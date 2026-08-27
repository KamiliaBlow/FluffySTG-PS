//Mild traumas are the most common; they are generally minor annoyances.
//They can be cured with mannitol and patience, although brain surgery still works.
//Most of the old brain damage effects have been transferred to the dumbness trauma.

/datum/brain_trauma/mild
	abstract_type = /datum/brain_trauma/mild

/datum/brain_trauma/mild/hallucinations
	name = "Галлюцинации"
	desc = "Пациент страдает постоянными галлюцинациями."
	scan_desc = "schizophrenia"
	symptoms = "У него наблюдаются частые галлюцинации (зрительные или слуховые) или бред, \
		которые проходят после введения токсина Mindbreaker."
	gain_text = span_warning("Вы чувствуете, как ускользает ваша связь с реальностью...")
	lose_text = span_notice("Вы чувствуете себя более уравновешенно.")
	/// Whether the hallucinations we give are uncapped, ie all the wacky ones
	var/uncapped = FALSE

/datum/brain_trauma/mild/hallucinations/on_life(seconds_per_tick)
	if(owner.stat >= UNCONSCIOUS)
		return
	if(HAS_TRAIT(owner, TRAIT_RDS_SUPPRESSED))
		owner.remove_language(/datum/language/aphasia, source = LANGUAGE_APHASIA)
		owner.adjust_hallucinations(-10 SECONDS * seconds_per_tick)
		return

	owner.grant_language(/datum/language/aphasia, source = LANGUAGE_APHASIA)
	owner.adjust_hallucinations_up_to(((uncapped ? 12 SECONDS : 5 SECONDS) * seconds_per_tick), (uncapped ? 240 SECONDS : 60 SECONDS))

/datum/brain_trauma/mild/hallucinations/on_lose()
	owner.remove_status_effect(/datum/status_effect/hallucination)
	if(!QDELING(owner))
		owner.remove_language(/datum/language/aphasia, source = LANGUAGE_APHASIA)
	return ..()

/datum/brain_trauma/mild/stuttering
	name = "Заикание"
	desc = "Пациент не может нормально говорить."
	scan_desc = "reduced mouth coordination"
	symptoms = "Испытывает трудности с плавной речью, часто повторяет или удлиняет звуки или слоги."
	gain_text = span_warning("Становится всё труднее говорить чётко.")
	lose_text = span_notice("Вы чувствуете, что контролируете свою речь.")

/datum/brain_trauma/mild/stuttering/on_life(seconds_per_tick)
	owner.adjust_stutter_up_to(5 SECONDS * seconds_per_tick, 50 SECONDS)

/datum/brain_trauma/mild/stuttering/on_lose()
	owner.remove_status_effect(/datum/status_effect/speech/stutter)
	return ..()

/datum/brain_trauma/mild/dumbness
	name = "Отупение"
	desc = "У пациента наблюдается снижение мозговой активности, что приводит к снижению интеллекта."
	symptoms = "Наблюдается заметное ухудшение когнитивных функций, в том числе речи, памяти, моторики и способности решать задачи."
	scan_desc = "reduced brain activity"
	gain_text = span_warning("Вы чувствуете себя глупее.")
	lose_text = span_notice("Вы снова чувствуете себя умнее.")

/datum/brain_trauma/mild/dumbness/on_gain()
	ADD_TRAIT(owner, TRAIT_DUMB, TRAUMA_TRAIT)
	owner.add_mood_event("dumb", /datum/mood_event/oblivious)
	return ..()

/datum/brain_trauma/mild/dumbness/on_life(seconds_per_tick)
	owner.adjust_derpspeech_up_to(5 SECONDS * seconds_per_tick, 50 SECONDS)
	if(SPT_PROB(1.5, seconds_per_tick))
		owner.emote("drool")
	else if(owner.stat == CONSCIOUS && SPT_PROB(1.5, seconds_per_tick))
		owner.say(pick_list_replacements(BRAIN_DAMAGE_FILE, "brain_damage"), forced = "brain damage", filterproof = TRUE)

/datum/brain_trauma/mild/dumbness/on_lose()
	REMOVE_TRAIT(owner, TRAIT_DUMB, TRAUMA_TRAIT)
	owner.remove_status_effect(/datum/status_effect/speech/stutter/derpspeech)
	owner.clear_mood_event("dumb")
	return ..()

/datum/brain_trauma/mild/speech_impediment
	name = "Нарушение речи"
	desc = "Пациент не способен составлять связные предложения."
	scan_desc = "communication disorder"
	symptoms = "Испытывает трудности с формулировкой мыслей в связную речь, что часто приводит к появлению беспорядочных или бессмысленных предложений."
	gain_text = span_danger("Похоже, вы не можете сформулировать ни одной связной мысли!")
	lose_text = span_danger("Ваш ум становится более ясным.")

/datum/brain_trauma/mild/speech_impediment/on_gain()
	ADD_TRAIT(owner, TRAIT_UNINTELLIGIBLE_SPEECH, TRAUMA_TRAIT)
	. = ..()

/datum/brain_trauma/mild/speech_impediment/on_lose()
	REMOVE_TRAIT(owner, TRAIT_UNINTELLIGIBLE_SPEECH, TRAUMA_TRAIT)
	..()

/datum/brain_trauma/mild/concussion
	name = "Контузия"
	desc = "У пациента сотрясение мозга."
	symptoms = "Наблюдаются головные боли, головокружение, тошнота, спутанность сознания и периодическая потеря сознания."
	scan_desc = "concussion"
	gain_text = span_warning("У вас болит голова!")
	lose_text = span_notice("Давление в голове начинает спадать.")

/datum/brain_trauma/mild/concussion/on_life(seconds_per_tick)
	if(SPT_PROB(2.5, seconds_per_tick))
		switch(rand(1,11))
			if(1)
				owner.vomit(VOMIT_CATEGORY_DEFAULT)
			if(2,3)
				owner.adjust_dizzy(20 SECONDS)
			if(4,5)
				owner.adjust_confusion(10 SECONDS)
				owner.set_eye_blur_if_lower(20 SECONDS)
			if(6 to 9)
				owner.adjust_slurring(1 MINUTES)
			if(10)
				to_chat(owner, span_notice("На мгновение вы забываете, чем занимались."))
				owner.Stun(20)
			if(11)
				to_chat(owner, span_warning("Вы теряете сознание."))
				owner.Unconscious(80)

	..()

/datum/brain_trauma/mild/healthy
	name = "Анозогнозия"
	desc = "Пациент всегда чувствует себя здоровым, независимо от своего состояния."
	scan_desc = "self-awareness deficit"
	symptoms = "Проявляет неосведомленность о собственных заболеваниях или отрицают их наличие, \
		часто настаивая на том, что тело абсолютно здорово, несмотря на явные доказательства обратного."
	gain_text = span_notice("Ты чувствуешь себя великолепно!")
	lose_text = span_warning("Вы больше не чувствуете себя абсолютно здоровым.")

/datum/brain_trauma/mild/healthy/on_gain()
	owner.apply_status_effect(/datum/status_effect/grouped/screwy_hud/fake_healthy, type)
	return ..()

/datum/brain_trauma/mild/healthy/on_life(seconds_per_tick)
	owner.adjust_stamina_loss(-6 * seconds_per_tick) //no pain, no fatigue

/datum/brain_trauma/mild/healthy/on_lose()
	owner.remove_status_effect(/datum/status_effect/grouped/screwy_hud/fake_healthy, type)
	return ..()

/datum/brain_trauma/mild/muscle_weakness
	name = "Мышечная слабость"
	desc = "У пациента время от времени наблюдаются приступы мышечной слабости."
	scan_desc = "weak motor nerve signal"
	symptoms = "У пациента наблюдаются внезапные приступы мышечной слабости, приводящие к снижению силы захвата, затруднениям при передвижении и периодическим падениям."
	gain_text = span_warning("В мышцах ощущается странная слабость.")
	lose_text = span_notice("Вы снова чувствуете, что контролируете свои мышцы.")

/datum/brain_trauma/mild/muscle_weakness/on_life(seconds_per_tick)
	var/fall_chance = 1
	if(owner.move_intent == MOVE_INTENT_RUN)
		fall_chance += 2
	if(SPT_PROB(0.5 * fall_chance, seconds_per_tick) && owner.body_position == STANDING_UP)
		to_chat(owner, span_warning("Ваша нога подкашивается!"))
		owner.Paralyze(35)

	else if(owner.get_active_held_item())
		var/drop_chance = 1
		var/obj/item/I = owner.get_active_held_item()
		drop_chance += I.w_class
		if(SPT_PROB(0.5 * drop_chance, seconds_per_tick) && owner.dropItemToGround(I))
			to_chat(owner, span_warning("Вы бросаете [I]!"))

	else if(SPT_PROB(1.5, seconds_per_tick))
		to_chat(owner, span_warning("Вы чувствуете внезапную слабость в мышцах!"))
		owner.adjust_stamina_loss(50)
	..()

/datum/brain_trauma/mild/muscle_spasms
	name = "Мышечные спазмы"
	desc = "У пациента периодически возникают мышечные спазмы, вызывающие непроизвольные движения."
	scan_desc = "nervous fits"
	symptoms = "Наблюдаются непроизвольные мышечные сокращения, приводящие к внезапным, кратковременным движениям или подергиваниям, которые могут нарушать нормальные двигательные функции."
	gain_text = span_warning("В мышцах ощущается странная слабость.")
	lose_text = span_notice("Вы снова чувствуете, что контролируете свои мышцы.")

/datum/brain_trauma/mild/muscle_spasms/on_gain()
	owner.apply_status_effect(/datum/status_effect/spasms)
	. = ..()

/datum/brain_trauma/mild/muscle_spasms/on_lose()
	owner.remove_status_effect(/datum/status_effect/spasms)
	..()

/datum/brain_trauma/mild/nervous_cough
	name = "Нервный кашель"
	desc = "Пациент испытывает постоянное желание кашлять."
	scan_desc = "nervous cough"
	symptoms = "Испытывает постоянное, неконтролируемое желание кашлять, что может мешать повседневной деятельности и общению с окружающими."
	gain_text = span_warning("У вас постоянно чешется в горле...")
	lose_text = span_notice("Першение в горле проходит.")

/datum/brain_trauma/mild/nervous_cough/on_life(seconds_per_tick)
	if(SPT_PROB(6, seconds_per_tick) && !HAS_TRAIT(owner, TRAIT_SOOTHED_THROAT))
		if(prob(5))
			to_chat(owner, span_warning("[pick("У вас приступ кашля!", "Вы не можете перестать кашлять!")]"))
			owner.Immobilize(20)
			owner.emote("cough")
			addtimer(CALLBACK(owner, TYPE_PROC_REF(/mob/, emote), "cough"), 0.6 SECONDS)
			addtimer(CALLBACK(owner, TYPE_PROC_REF(/mob/, emote), "cough"), 1.2 SECONDS)
		owner.emote("cough")
	..()

/datum/brain_trauma/mild/expressive_aphasia
	name = "Экспрессивная афазия"
	desc = "У пациента наблюдается частичная утрата речи, приводящая к сокращению словарного запаса."
	scan_desc = "inability to form complex sentences"
	symptoms = "Испытывает трудности с вербальным выражением мыслей, часто заменяя сложные слова более простыми вариантами или бессмысленными звуками."
	gain_text = span_warning("Вы теряете понимание сложных слов.")
	lose_text = span_notice("Вы чувствуете, что ваш словарный запас снова приходит в норму.")

/datum/brain_trauma/mild/expressive_aphasia/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		var/list/message_split = splittext(message, " ")
		var/list/new_message = list()

		for(var/word in message_split)
			var/suffix = ""
			var/suffix_foundon = 0
			for(var/potential_suffix in list("." , "," , ";" , "!" , ":" , "?"))
				suffix_foundon = findtext(word, potential_suffix, -length(potential_suffix))
				if(suffix_foundon)
					suffix = potential_suffix
					break

			if(suffix_foundon)
				word = copytext(word, 1, suffix_foundon)
			word = html_decode(word)

			if(GLOB.most_common_words_alphabetical[LOWER_TEXT(word)])
				new_message += word + suffix
			else
				if(prob(30) && message_split.len > 2)
					new_message += pick("ам","эмм")
					break
				else
					var/list/charlist = text2charlist(word)
					charlist.len = round(charlist.len * 0.5, 1)
					shuffle_inplace(charlist)
					new_message += jointext(charlist, "") + suffix

		message = jointext(new_message, " ")

	speech_args[SPEECH_MESSAGE] = trim(message)

/datum/brain_trauma/mild/mind_echo
	name = "Эхо Разума"
	desc = "Нейроны речи у пациента не замыкаются должным образом, в результате чего прежние речевые паттерны время от времени спонтанно вновь проявляются."
	scan_desc = "looping neural pattern"
	symptoms = "Наблюдается непроизвольное повторение ранее услышанных или произнесенных фраз, что приводит к постоянным ощущениям дежавю как при слушании, так и при речи."
	gain_text = span_warning("Вы чувствуете слабое эхо своих мыслей...")
	lose_text = span_notice("Слабое эхо затихает.")
	var/list/hear_dejavu = list()
	var/list/speak_dejavu = list()

/datum/brain_trauma/mild/mind_echo/handle_hearing(datum/source, list/hearing_args)
	if(HAS_TRAIT(owner, TRAIT_DEAF) || owner == hearing_args[HEARING_SPEAKER])
		return

	if(hear_dejavu.len >= 5)
		if(prob(25))
			var/deja_vu = pick_n_take(hear_dejavu)
			var/static/regex/quoted_spoken_message = regex("\".+\"", "gi")
			hearing_args[HEARING_RAW_MESSAGE] = quoted_spoken_message.Replace(hearing_args[HEARING_RAW_MESSAGE], "\"[deja_vu]\"") //Quotes included to avoid cases where someone says part of their name
			return
	if(hear_dejavu.len >= 15)
		if(prob(50))
			popleft(hear_dejavu) //Remove the oldest
			hear_dejavu += hearing_args[HEARING_RAW_MESSAGE]
	else
		hear_dejavu += hearing_args[HEARING_RAW_MESSAGE]

/datum/brain_trauma/mild/mind_echo/handle_speech(datum/source, list/speech_args)
	if(speak_dejavu.len >= 5)
		if(prob(25))
			var/deja_vu = pick_n_take(speak_dejavu)
			speech_args[SPEECH_MESSAGE] = deja_vu
			return
	if(speak_dejavu.len >= 15)
		if(prob(50))
			popleft(speak_dejavu) //Remove the oldest
			speak_dejavu += speech_args[SPEECH_MESSAGE]
	else
		speak_dejavu += speech_args[SPEECH_MESSAGE]

/datum/brain_trauma/mild/color_blindness
	name = "Ахроматопсия"
	desc = "Затылочная доля мозга пациента не способна распознавать и интерпретировать цвета, в результате чего пациент страдает полной цветовой слепотой."
	scan_desc = "colorblindness"
	symptoms = "Проявляет полную неспособность воспринимать цвета, видя мир в оттенках серого, черного и белого."
	gain_text = span_warning("Кажется, что окружающий мир теряет свои краски.")
	lose_text = span_notice("Мир снова кажется ярким и красочным.")

/datum/brain_trauma/mild/color_blindness/on_gain()
	owner.add_client_colour(/datum/client_colour/monochrome, TRAUMA_TRAIT)
	return ..()

/datum/brain_trauma/mild/color_blindness/on_lose(silent)
	owner.remove_client_colour(TRAUMA_TRAIT)
	return ..()

/datum/brain_trauma/mild/possessive
	name = "Собственничество"
	desc = "Пациент чрезвычайно ревностно относится к своим вещам."
	scan_desc = "possessiveness"
	symptoms = "Проявляет чрезмерную потребность держать личные вещи рядом с собой, \
		что часто приводит к тому, что он крепко сжимает предметы в руках, не отпуская их даже тогда, когда его заставляют это сделать."
	gain_text = span_warning("Вы начинаете беспокоиться о своих вещах.")
	lose_text = span_notice("Вы меньше беспокоитесь о своих вещах.")

/datum/brain_trauma/mild/possessive/on_lose(silent)
	. = ..()
	for(var/obj/item/thing in owner.held_items)
		clear_trait(thing)

/datum/brain_trauma/mild/possessive/on_life(seconds_per_tick)
	if(!SPT_PROB(5, seconds_per_tick))
		return

	var/obj/item/my_thing = pick(owner.held_items) // can pick null, that's fine
	if(isnull(my_thing) || HAS_TRAIT(my_thing, TRAIT_NODROP) || (my_thing.item_flags & (HAND_ITEM|ABSTRACT)))
		return

	ADD_TRAIT(my_thing, TRAIT_NODROP, TRAUMA_TRAIT)
	RegisterSignals(my_thing, list(COMSIG_ITEM_DROPPED, COMSIG_MOVABLE_MOVED), PROC_REF(clear_trait))
	to_chat(owner, span_warning("Вы чувствуете потребность держать [my_thing] рядом..."))
	addtimer(CALLBACK(src, PROC_REF(relax), my_thing), rand(30 SECONDS, 3 MINUTES), TIMER_DELETE_ME)

/datum/brain_trauma/mild/possessive/proc/relax(obj/item/my_thing)
	if(QDELETED(my_thing))
		return
	if(HAS_TRAIT_FROM_ONLY(my_thing, TRAIT_NODROP, TRAUMA_TRAIT)) // in case something else adds nodrop, somehow?
		to_chat(owner, span_notice("Вам становится легче отпустить [my_thing]."))
	clear_trait(my_thing)

/datum/brain_trauma/mild/possessive/proc/clear_trait(obj/item/my_thing, ...)
	SIGNAL_HANDLER

	REMOVE_TRAIT(my_thing, TRAIT_NODROP, TRAUMA_TRAIT)
	UnregisterSignal(my_thing, list(COMSIG_ITEM_DROPPED, COMSIG_MOVABLE_MOVED))
