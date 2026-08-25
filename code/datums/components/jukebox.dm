/**
 * ## Jukebox datum
 *
 * Plays music to nearby mobs when hosted in a movable or a turf.
 *
 * Built on top of [/datum/threed_sound], so the music is stereo-positioned
 * relative to each listener and its volume falls off with distance from the
 * jukebox, calculated serverside.
 */
/datum/jukebox
	parent_type = /datum/threed_sound

	/// List of /datum/tracks we can play. Set via init_songs().
	VAR_FINAL/list/songs = list()
	/// Current song track selected
	VAR_FINAL/datum/track/selection

	/// Whether the music loops when done.
	/// If FALSE, you must handle ending music yourself.
	var/sound_loops = FALSE

	/// Maximum volume for the TGUI knob, matching its 0-100 range.
	/// The generic 3D sound `volume` starts at this value.
	var/volume_max = 100

/datum/jukebox/New(atom/new_parent)
	// The base type self-deletes after sound_length; a jukebox's lifetime is
	// controlled by whatever hosts it instead, so kill that timer immediately.
	..(
		new_parent = new_parent,
		new_sound = null,
		current_listeners = null,
		can_add_new_listeners = src.can_add_new_listeners,
		volume = src.volume_max,
		sound_range = SOUND_RANGE,
		sound_length = 1 HOURS,
		channel = CHANNEL_JUKEBOX,
		preference_volume = /datum/preference/numeric/volume/sound_jukebox,
		preference_signal = COMSIG_MOB_JUKEBOX_PREFERENCE_APPLIED,
		pressure_affected = FALSE,
	)
	if(QDELETED(src))
		return

	deltimer(deletion_timer)
	deletion_timer = null

	if(can_add_new_listeners)
		var/static/list/connections = list(COMSIG_ATOM_ENTERED = PROC_REF(check_new_listener))
		AddComponent(/datum/component/connect_range, parent, connections, max(x_cutoff, z_cutoff))

	songs = init_songs()
	if(length(songs))
		selection = songs[pick(songs)]

/**
 * Initializes the track list.
 *
 * By default, this loads all tracks from the config datum.
 *
 * Returns
 * * An assoc list of track names to /datum/track. Track names must be unique.
 */
/datum/jukebox/proc/init_songs()
	return load_songs_from_config()

/// Loads the config sounds once, and returns a copy of them.
/datum/jukebox/proc/load_songs_from_config()
	var/static/list/config_songs
	if(isnull(config_songs))
		config_songs = list()
		var/list/tracks = flist(CONFIG_JUKEBOX_SOUNDS)
		for(var/track_file in tracks)
			var/datum/track/new_track = new()
			new_track.song_path = file("[CONFIG_JUKEBOX_SOUNDS][track_file]")
			var/list/track_data = splittext(track_file, "+")
			if(!length(track_data) || !IS_SOUND_FILE_SAFE(new_track.song_path))
				continue
			var/track_name = track_data[JUKEBOX_NAME]
			track_name = strip_filepath_extension(track_name, SSsounds.safe_formats)
			new_track.song_name = track_name
			new_track.song_length = SSsounds.get_sound_length(new_track.song_path)
			if(track_data.len >= 3) // Bandaid for legacy tracks to not use the length for the bpm rather then the actual beats.
				var/static/logged_to_admins = FALSE
				log_game("[new_track.song_path] track data seems to be using the legacy format; we will attempt to make it work.")
				if(!logged_to_admins)
					message_admins("The jukebox has tracks uploaded in a legacy format. Length is now fetched programmatically, with title and beats being the only required fields.")
					logged_to_admins = TRUE
				new_track.song_beat_deciseconds = text2num(track_data[3])
			else if(track_data.len >= 2)
				new_track.song_beat_deciseconds = text2num(track_data[JUKEBOX_BEATS])
			config_songs[new_track.song_name] = new_track

		if(!length(config_songs))
			var/datum/track/default/default_track = new()
			config_songs[default_track.song_name] = default_track

	// returns a copy so it can mutate if desired.
	return config_songs.Copy()

/**
 * Returns a set of general data relating to the jukebox for use in TGUI.
 *
 * Returns
 * * A list of UI data
 */
/datum/jukebox/proc/get_ui_data()
	var/list/data = list()
	var/list/songs_data = list()
	for(var/song_name in songs)
		var/datum/track/one_song = songs[song_name]
		UNTYPED_LIST_ADD(songs_data, list( \
			"name" = song_name, \
			"length" = DisplayTimeText(one_song.song_length), \
			"beat" = one_song.song_beat_deciseconds || "Unknown", \
		))

	data["active"] = !!our_sound
	data["songs"] = songs_data
	data["track_selected"] = selection?.song_name
	data["looping"] = sound_loops
	data["volume"] = volume
	return data

/**
 * Sets the sound's volume to a new value.
 * Then updates any mobs listening to it.
 */
/datum/jukebox/proc/set_new_volume(new_vol)
	new_vol = clamp(new_vol, 0, volume_max)
	if(volume == new_vol)
		return
	volume = new_vol
	if(isnull(our_sound))
		return
	update_all()

/// Sets volume to the maximum possible value, the initial volume value.
/datum/jukebox/proc/set_volume_to_max()
	set_new_volume(volume_max)

/// Creates the sound datum for the selected track, on our reserved channel.
/datum/jukebox/proc/set_up_song()
	if(isnull(selection))
		return FALSE

	var/area/juke_area = get_area(parent)
	our_sound = sound(selection.song_path)
	our_sound.channel = our_channel
	our_sound.priority = 255
	our_sound.repeat = sound_loops
	our_sound.environment = juke_area?.sound_environment || SOUND_ENVIRONMENT_NONE
	return TRUE

/// Helper to kickstart the music for all mobs in hearing range of the jukebox.
/datum/jukebox/start_music()
	if(!isnull(our_sound) || !set_up_song())
		return
	for(var/mob/nearby in hearers(sound_range, parent))
		register_listener(nearby)

/// Check for new mobs entering the jukebox's range.
/datum/jukebox/proc/check_new_listener(datum/source, atom/movable/entered)
	SIGNAL_HANDLER

	if(isnull(our_sound))
		return
	if(!ismob(entered))
		return
	if(entered in listeners)
		return
	register_listener(entered)

/**
 * The base update assumes both the jukebox and the listener are on a turf;
 * mobs sitting in nullspace (cryopods and friends) would runtime there.
 * Mute them instead and let the base unmute them once they're back somewhere.
 */
/datum/jukebox/update_listener(mob/listener)
	var/turf/sound_turf = get_turf(parent)
	var/turf/listener_turf = get_turf(listener)
	if(isnull(sound_turf) || isnull(listener_turf))
		listeners[listener] |= SOUND_MUTE
		our_sound.status = SOUND_UPDATE | SOUND_MUTE
		SEND_SOUND(listener, our_sound)
		return
	return ..()

/**
 * Subtype which only plays the music to the mob you pass in via start_music().
 *
 * Multiple mobs can still listen at once, but you must register them all manually via start_music().
 */
/datum/jukebox/single_mob
	can_add_new_listeners = FALSE

/datum/jukebox/single_mob/start_music(mob/solo_listener)
	if(!isnull(our_sound) || !set_up_song())
		return
	register_listener(solo_listener)

/// Track datums, used in jukeboxes
/datum/track
	/// Readable name, used in the jukebox menu
	var/song_name = "generic"
	/// Filepath of the song
	var/song_path = null
	/// How long is the song in deciseconds
	var/song_length = 0
	/// How long is a beat of the song in decisconds
	/// Used to determine time between effects when played
	/// Do note this is NOT BPM.
	var/song_beat_deciseconds = 0

// Default track supplied for testing and also because it's a banger
/datum/track/default
	song_path = 'sound/music/lobby_music/title3.ogg'
	song_name = "Tintin on the Moon"
	song_length = 3 MINUTES + 52 SECONDS
	song_beat_deciseconds = 1 SECONDS
