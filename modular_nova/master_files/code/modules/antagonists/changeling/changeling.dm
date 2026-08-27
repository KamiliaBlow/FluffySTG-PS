/datum/antagonist/changeling
	dna_max = 8 // changed from 6
	/// chem_recharge_rate = 0.5 (disabled override, can reenable when needed)
	/// The time that the horror form died.
	var/true_form_death
	/// Any quirks that we don't want to be mimicked when transforming
	var/list/mimicable_quirks_list = list(
		"Bad Touch",
		"Чувствительный нос",
		"Аспект «Пепел» (Эмоции)",
		"Собачьи манеры",
		"Волнующе!",
		"Кошачьи манеры",
		"Аспект «Растение» (Эмоции)",
		"Гетерохромия",
		"Гидра",
		"Сверхразмер",
		"Личное пространство",
		"Псевдобульбарный аффект",
		"Бегающий взгляд",
		"Smooth-Headed",
		"Аспект «Сияние» (Эмоции)",
		"Аспект «Вода» (Эмоции)",
		"Аспект «Паутина» (Эмоции)",
		"Дружелюбие",
		"Птичьи манеры",
	)

// FLUFFY FRONTIER EDIT - REMOVAL
/* /datum/antagonist/changeling/forge_objectives()
	return */
// FLUFFY FRONTIER EDIT END

/datum/changeling_profile
	/// The bra worn by the profile source
	var/bra
	/// The color of the undershirt used by the profile source
	var/undershirt_color
	/// The color of the socks used by the profile source
	var/socks_color
	/// The color of the bra used by the profile source
	var/bra_color
	/// Does the profile source's eyes glow
	var/emissive_eyes
	/// Profile source digi leg icons
	var/list/worn_icon_digi_list = list()
	/// profile source monkey icons
	var/list/worn_icon_monkey_list = list()
	/// Profile source vox icons
	var/list/worn_icon_teshari_list = list()
	/// The bra worn by the profile source
	var/list/worn_icon_vox_list = list()
	/// Support variation flags used by the profile source
	var/list/supports_variations_flags_list = list()
	/// The profile source scream type
	var/scream_type
	/// The profile source laugh type
	var/laugh_type
	/// The profile source mob height scaling
	var/target_height
	/// the profile source mob's size
	var/target_mob_size
