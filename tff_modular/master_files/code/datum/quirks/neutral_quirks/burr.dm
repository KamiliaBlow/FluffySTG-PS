/datum/quirk/burr
	name = "Ка(г')тавость"
	desc = "Так т'удно выгова'ивать эту букву «Р»... Б'атцы!"
	icon = FA_ICON_SPELL_CHECK
	value = 0
	gain_text = span_danger("По'а беспокоиться о своей 'ечи...")
	lose_text = span_notice("Ну, зато я знаю, как выговаривать Р-р-р-р.")
	medical_record_text = "Пациент испытывает трудности с произношением буквы «Р»."
	hardcore_value = 0

/datum/quirk/burr/add(client/client_source)
	RegisterSignal(quirk_holder, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/quirk/burr/remove()
	UnregisterSignal(quirk_holder, COMSIG_MOB_SAY)

/datum/quirk/burr/proc/handle_speech(datum/source, list/speech_args)
	SIGNAL_HANDLER

	if(HAS_TRAIT(source, TRAIT_SIGN_LANG)) // No modifiers for signers, so you're less anxious when you go non-verbal
		return

	if(HAS_TRAIT(source, TRAIT_NO_ACCENT))
		return

	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] == "*")
		return
	var/list/different_R = list("х'","гх'","г'х","г'","х","гх","г","р'","х")
	var/static/regex/rawr = new(@"[рР]+", "g")
	if(message)
		var/list/message_split = splittext_char(message, " ")
		var/list/new_message = list()
		for(var/word in message_split)
			new_message += replacetext_char(word, rawr, pick(different_R))
		message = jointext(new_message, " ")
	speech_args[SPEECH_MESSAGE] = message
