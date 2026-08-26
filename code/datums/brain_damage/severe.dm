//Severe traumas, when your brain gets abused way too much.
//These range from very annoying to completely debilitating.
//They cannot be cured with chemicals, and require brain surgery to solve.

/datum/brain_trauma/severe
	abstract_type = /datum/brain_trauma/severe
	resilience = TRAUMA_RESILIENCE_SURGERY

/datum/brain_trauma/severe/mute
	name = "Mutism"
	desc = "Patient is completely unable to speak."
	scan_desc = "extensive damage to the brain's speech center"
	symptoms = "Completley incapable of producing sound or speech verbally."
	gain_text = span_warning("You forget how to speak!")
	lose_text = span_notice("You suddenly remember how to speak.")

/datum/brain_trauma/severe/mute/on_gain()
	ADD_TRAIT(owner, TRAIT_MUTE, TRAUMA_TRAIT)
	. = ..()

/datum/brain_trauma/severe/mute/on_lose()
	REMOVE_TRAIT(owner, TRAIT_MUTE, TRAUMA_TRAIT)
	..()

/datum/brain_trauma/severe/aphasia
	name = "Aphasia"
	desc = "Patient is unable to speak or understand any language."
	scan_desc = "extensive damage to the brain's language center"
	symptoms = "Completely incapable of understanding or producing language besides incomprehensible utterances."
	gain_text = span_warning("You have trouble forming words in your head...")
	lose_text = span_notice("You suddenly remember how languages work.")

/datum/brain_trauma/severe/aphasia/on_gain()
	owner.add_blocked_language(subtypesof(/datum/language) - /datum/language/aphasia, source = LANGUAGE_APHASIA)
	owner.grant_language(/datum/language/aphasia, source = LANGUAGE_APHASIA)
	. = ..()

/datum/brain_trauma/severe/aphasia/on_lose()
	if(!QDELING(owner))
		owner.remove_blocked_language(subtypesof(/datum/language), source = LANGUAGE_APHASIA)
		owner.remove_language(/datum/language/aphasia, source = LANGUAGE_APHASIA)

	..()

/datum/brain_trauma/severe/blindness
	name = "Cerebral Blindness"
	desc = "Patient's brain is no longer connected to its eyes."
	scan_desc = "extensive damage to the brain's occipital lobe"
	symptoms = "Exhibits a complete loss of vision despite having fully functional eyes."
	gain_text = span_warning("You can't see!")
	lose_text = span_notice("Your vision returns.")

/datum/brain_trauma/severe/blindness/on_gain()
	owner.become_blind(TRAUMA_TRAIT)
	. = ..()

/datum/brain_trauma/severe/blindness/on_lose()
	owner.cure_blind(TRAUMA_TRAIT)
	..()

/datum/brain_trauma/severe/paralysis
	name = "Paralysis"
	desc = "Patient's brain can no longer control part of its motor functions."
	scan_desc = "cerebral paralysis"
	symptoms = "Experience a complete loss of voluntary movement in specific body parts."
	gain_text = ""
	lose_text = ""
	var/paralysis_type
	var/list/paralysis_traits = list()
	//for descriptions

/datum/brain_trauma/severe/paralysis/New(specific_type)
	if(specific_type)
		paralysis_type = specific_type
	if(!paralysis_type)
		paralysis_type = pick("full","left","right","arms","legs","r_arm","l_arm","r_leg","l_leg")
	var/subject
	switch(paralysis_type)
		if("full")
			subject = "your body"
			paralysis_traits = list(TRAIT_PARALYSIS_L_ARM, TRAIT_PARALYSIS_R_ARM, TRAIT_PARALYSIS_L_LEG, TRAIT_PARALYSIS_R_LEG)
		if("left")
			subject = "the left side of your body"
			paralysis_traits = list(TRAIT_PARALYSIS_L_ARM, TRAIT_PARALYSIS_L_LEG)
		if("right")
			subject = "the right side of your body"
			paralysis_traits = list(TRAIT_PARALYSIS_R_ARM, TRAIT_PARALYSIS_R_LEG)
		if("arms")
			subject = "your arms"
			paralysis_traits = list(TRAIT_PARALYSIS_L_ARM, TRAIT_PARALYSIS_R_ARM)
		if("legs")
			subject = "your legs"
			paralysis_traits = list(TRAIT_PARALYSIS_L_LEG, TRAIT_PARALYSIS_R_LEG)
		if("r_arm")
			subject = "your right arm"
			paralysis_traits = list(TRAIT_PARALYSIS_R_ARM)
		if("l_arm")
			subject = "your left arm"
			paralysis_traits = list(TRAIT_PARALYSIS_L_ARM)
		if("r_leg")
			subject = "your right leg"
			paralysis_traits = list(TRAIT_PARALYSIS_R_LEG)
		if("l_leg")
			subject = "your left leg"
			paralysis_traits = list(TRAIT_PARALYSIS_L_LEG)

	gain_text = span_warning("You can't feel [subject] anymore!")
	lose_text = span_notice("You can feel [subject] again!")

/datum/brain_trauma/severe/paralysis/on_gain()
	. = ..()
	for(var/X in paralysis_traits)
		ADD_TRAIT(owner, X, TRAUMA_TRAIT)


/datum/brain_trauma/severe/paralysis/on_lose()
	..()
	for(var/X in paralysis_traits)
		REMOVE_TRAIT(owner, X, TRAUMA_TRAIT)


/datum/brain_trauma/severe/paralysis/paraplegic
	random_gain = FALSE
	known_trauma = FALSE
	paralysis_type = "legs"
	resilience = TRAUMA_RESILIENCE_ABSOLUTE

/datum/brain_trauma/severe/paralysis/hemiplegic
	random_gain = FALSE
	known_trauma = FALSE
	resilience = TRAUMA_RESILIENCE_ABSOLUTE

/datum/brain_trauma/severe/paralysis/hemiplegic/left
	paralysis_type = "left"

/datum/brain_trauma/severe/paralysis/hemiplegic/right
	paralysis_type = "right"

/datum/brain_trauma/severe/narcolepsy
	name = "Нарколепсия"
	desc = "Пациент может непроизвольно заснуть во время обычных повседневных занятий."
	scan_desc = "traumatic narcolepsy"
	symptoms = "Испытывает внезапные и неконтролируемые приступы сонливости или усталости во время повседневных занятий."
	gain_text = span_warning("Вы постоянно ощущаете сонливость...")
	lose_text = span_notice("Вы снова чувствуете себя бодро и сосредоточенно.")
	/// Odds seconds_per_tick the user falls asleep
	var/sleep_chance = 1
	/// Odds seconds_per_tick the user falls asleep while running
	var/sleep_chance_running = 2
	/// Odds seconds_per_tick the user falls asleep while drowsy
	var/sleep_chance_drowsy = 3
	/// Time values for how long the user will stay drowsy
	var/drowsy_time_minimum = 20 SECONDS
	var/drowsy_time_maximum = 30 SECONDS
	/// Time values for how long the user will stay asleep
	var/sleep_time_minimum = 6 SECONDS
	var/sleep_time_maximum = 6 SECONDS

/datum/brain_trauma/severe/narcolepsy/on_life(seconds_per_tick)
	if(owner.IsSleeping())
		return

	/// If any of these are in the user's blood, return early
	var/static/list/immunity_medicine = list(
		/datum/reagent/medicine/modafinil,
		/datum/reagent/medicine/synaptizine,
	) //don't add too many, as most stimulant reagents already have a drowsy-removing effect
	for(var/medicine in immunity_medicine)
		if(owner.reagents.has_reagent(medicine))
			return

	var/drowsy = !!owner.has_status_effect(/datum/status_effect/drowsiness)
	var/caffeinated = HAS_TRAIT(owner, TRAIT_STIMULATED)
	var/final_sleep_chance = sleep_chance
	if(owner.move_intent == MOVE_INTENT_RUN)
		final_sleep_chance += sleep_chance_running
	if(drowsy)
		final_sleep_chance += sleep_chance_drowsy //stack drowsy ontop of base or running odds with the += operator
	if(caffeinated)
		final_sleep_chance *= 0.5 //make it harder to fall asleep on caffeine

	if(!SPT_PROB(final_sleep_chance, seconds_per_tick))
		return

	//if not drowsy, don't fall asleep but make them drowsy
	if(!drowsy)
		to_chat(owner, span_warning("Вы чувствуете усталость..."))
		owner.adjust_drowsiness(rand(drowsy_time_minimum, drowsy_time_maximum))
		if(prob(50))
			owner.emote("yawn")
		else if(prob(33)) //rarest message is a custom emote
			owner.visible_message("потирает [owner.p_their()] глаза.", visible_message_flags = EMOTE_MESSAGE)
	//drowsy, so fall asleep. you've had your chance to remedy it
	else
		to_chat(owner, span_warning("You fall asleep."))
		owner.Sleeping(rand(sleep_time_minimum, sleep_time_maximum))
		if(prob(50) && owner.IsSleeping())
			owner.emote("snore")

/datum/brain_trauma/severe/narcolepsy/permanent
	scan_desc = "chronic narcolepsy" //less odds to fall asleep than parent, but sleeps for longer
	sleep_chance = 0.333
	sleep_chance_running = 0.333
	sleep_chance_drowsy = 1
	sleep_time_minimum = 20 SECONDS
	sleep_time_maximum = 30 SECONDS
	known_trauma = FALSE

/datum/brain_trauma/severe/monophobia
	name = "Монофобия"
	desc = "Пациент чувствует себя плохо и испытывает дискомфорт, когда рядом нет других людей, что приводит к стрессу, уровень которого может достигать смертельно опасных значений."
	scan_desc = "monophobia"
	symptoms = "Испытывает сильный страх и тревогу, когда остается наедине, что часто приводит к приступам паники, \
		тошноте, учащенному сердцебиению, а в тяжелых случаях - к обмороку, рвоте или сердечной недостаточности."
	gain_text = span_warning("Вам действительно очень одиноко...")
	lose_text = span_notice("Вам кажется, что в одиночестве вы можете чувствовать себя в безопасности.")

/datum/brain_trauma/severe/monophobia/on_gain()
	. = ..()
	owner.AddComponentFrom(REF(src), /datum/component/fearful, list(/datum/terror_handler/vomiting, /datum/terror_handler/simple_source/monophobia))

/datum/brain_trauma/severe/monophobia/on_lose(silent)
	. = ..()
	owner.RemoveComponentSource(REF(src), /datum/component/fearful)

/datum/brain_trauma/severe/discoordination
	name = "Нарушение координации"
	desc = "Пациент не может пользоваться сложными инструментами или механизмами."
	scan_desc = "extreme discoordination"
	symptoms = "Полностью неспособен выполнять задачи, требующие мелкой моторики или координации движений, такие как использование инструментов или управление механизмами."
	gain_text = span_warning("Вы едва можете держать руки под контролем!")
	lose_text = span_notice("Вы снова чувствуете, что можете управлять своими руками.")

/datum/brain_trauma/severe/discoordination/on_gain()
	. = ..()
	owner.apply_status_effect(/datum/status_effect/discoordinated)

/datum/brain_trauma/severe/discoordination/on_lose()
	owner.remove_status_effect(/datum/status_effect/discoordinated)
	return ..()

/datum/brain_trauma/severe/pacifism
	name = "Травматическое ненасилие"
	desc = "Пациент категорически не желает причинять вред другим людям с применением насилия."
	scan_desc = "pacific syndrome"
	symptoms = "Полностью неспособные заставить себя совершать акты насилия или причинять вред другим, \
		часто прилагая все усилия, чтобы избежать конфликтов или ситуаций, которые могут привести к насилию."
	gain_text = span_notice("Вы чувствуете странное умиротворение.")
	lose_text = span_notice("Вы больше не чувствуете необходимости не причинять вреда.")

/datum/brain_trauma/severe/pacifism/on_gain()
	ADD_TRAIT(owner, TRAIT_PACIFISM, TRAUMA_TRAIT)
	. = ..()

/datum/brain_trauma/severe/pacifism/on_lose()
	REMOVE_TRAIT(owner, TRAIT_PACIFISM, TRAUMA_TRAIT)
	..()

/datum/brain_trauma/severe/hypnotic_stupor
	name = "Гипнотический ступор"
	desc = "Пациент подвержен приступам глубокого ступора, в результате чего он становится чрезвычайно внушаемым."
	scan_desc = "oneiric feedback loop"
	symptoms = "У пациента наблюдаются внезапные приступы глубокого ступора или трансоподобных состояний, во время которых он становится крайне подверженным влиянию извне, \
		что зачастую приводит к искажению восприятия или поведения, навязыванию чужих воспоминаний или, в тяжелых случаях, к угрозе для себя или окружающих."
	gain_text = span_warning("Вы чувствуете себя немного ошеломлённо.")
	lose_text = span_notice("Вы чувствуете, будто туман рассеялся в вашей голове.")

/datum/brain_trauma/severe/hypnotic_stupor/on_lose() //hypnosis must be cleared separately, but brain surgery should get rid of both anyway
	..()
	owner.remove_status_effect(/datum/status_effect/trance)

/datum/brain_trauma/severe/hypnotic_stupor/on_life(seconds_per_tick)
	..()
	if(SPT_PROB(0.5, seconds_per_tick) && !owner.has_status_effect(/datum/status_effect/trance))
		owner.apply_status_effect(/datum/status_effect/trance, rand(100,300), FALSE)

/datum/brain_trauma/severe/hypnotic_trigger
	name = "Гипнотический триггер"
	desc = "У пациента в подсознании заложена триггерная фраза, которая вызывает поддающееся внушению трансоподобное состояние."
	scan_desc = "oneiric feedback loop"
	gain_text = span_warning("Вы чувствуете себя как-то странно, будто только что забыли что-то важное.")
	lose_text = span_notice("Вы чувствуете, будто с души сняли тяжелый груз.")
	random_gain = FALSE
	known_trauma = FALSE
	var/trigger_phrase = "Nanotrasen"

/datum/brain_trauma/severe/hypnotic_trigger/New(phrase)
	..()
	if(phrase)
		trigger_phrase = phrase

/datum/brain_trauma/severe/hypnotic_trigger/on_lose() //hypnosis must be cleared separately, but brain surgery should get rid of both anyway
	..()
	owner.remove_status_effect(/datum/status_effect/trance)

/datum/brain_trauma/severe/hypnotic_trigger/handle_hearing(datum/source, list/hearing_args)
	if(HAS_TRAIT(owner, TRAIT_DEAF) || owner == hearing_args[HEARING_SPEAKER])
		return

	var/regex/reg = new("(\\b[REGEX_QUOTE(trigger_phrase)]\\b)","ig")

	if(findtext(hearing_args[HEARING_RAW_MESSAGE], reg))
		addtimer(CALLBACK(src, PROC_REF(hypnotrigger)), 1 SECONDS) //to react AFTER the chat message
		hearing_args[HEARING_RAW_MESSAGE] = reg.Replace(hearing_args[HEARING_RAW_MESSAGE], span_hypnophrase("*********"))

/datum/brain_trauma/severe/hypnotic_trigger/proc/hypnotrigger()
	to_chat(owner, span_warning("Эти слова пробуждают что-то глубоко внутри вас, и вы чувствуете, как ваше сознание ускользает..."))
	owner.apply_status_effect(/datum/status_effect/trance, rand(100,300), FALSE)

/datum/brain_trauma/severe/dyslexia
	name = "Дислексия"
	desc = "Пациент не умеет ни читать, ни писать."
	scan_desc = "dyslexia"
	symptoms = "Испытывает значительные трудности при чтении и письме, часто путает буквы и слова, \
		что приводит к проблемам при выполнении задач, связанных с грамотностью, таких как чтение скан-кодов или заполнение документов."
	gain_text = span_warning("У вас возникают трудности с чтением или письмом...")
	lose_text = span_notice("Вы вдруг вспоминаете, как читать и писать.")

/datum/brain_trauma/severe/dyslexia/on_gain()
	ADD_TRAIT(owner, TRAIT_ILLITERATE, TRAUMA_TRAIT)
	. = ..()

/datum/brain_trauma/severe/dyslexia/on_lose()
	REMOVE_TRAIT(owner, TRAIT_ILLITERATE, TRAUMA_TRAIT)
	..()

/datum/brain_trauma/severe/kleptomaniac
	name = "Клептомания"
	desc = "Пациент имеет склонность к кражам."
	scan_desc = "kleptomania"
	symptoms = "Испытывает неконтролируемое желание украсть предметы, находящиеся поблизости, зачастую без необходимости и без причины, \
		что приводит к компульсивному воровству, которое может мешать повседневной жизни и социальному взаимодействию."
	gain_text = span_warning("Вы чувствуете внезапное желание взять что-то. Наверняка никто и не заметит.")
	lose_text = span_notice("Вы больше не испытываете желания что-то брать.")
	/// Cooldown between allowing steal attempts
	COOLDOWN_DECLARE(steal_cd)

/datum/brain_trauma/severe/kleptomaniac/on_gain()
	. = ..()
	RegisterSignal(owner, COMSIG_MOB_APPLY_DAMAGE, PROC_REF(damage_taken))

/datum/brain_trauma/severe/kleptomaniac/on_lose()
	. = ..()
	UnregisterSignal(owner, COMSIG_MOB_APPLY_DAMAGE)

/datum/brain_trauma/severe/kleptomaniac/proc/damage_taken(datum/source, damage_amount, damage_type, ...)
	SIGNAL_HANDLER
	// While you're fighting someone (or dying horribly) your mind has more important things to focus on than pocketing stuff
	if(damage_amount >= 5 && (damage_type == BRUTE || damage_type == BURN || damage_type == STAMINA))
		COOLDOWN_START(src, steal_cd, 12 SECONDS)

/datum/brain_trauma/severe/kleptomaniac/on_life(seconds_per_tick)
	if(owner.usable_hands <= 0)
		return
	if(!SPT_PROB(5, seconds_per_tick))
		return
	if(!COOLDOWN_FINISHED(src, steal_cd))
		return
	if(!owner.has_active_hand() || !owner.get_empty_held_indexes())
		return

	// If our main hand is full, that means our offhand is empty, so try stealing with that
	var/steal_to_offhand = !!owner.get_active_held_item()
	var/curr_index = owner.active_hand_index
	var/pre_dir = owner.dir
	if(steal_to_offhand)
		owner.swap_hand(owner.get_inactive_hand_index())

	var/list/stealables = list()
	for(var/obj/item/potential_stealable in oview(1, owner))
		if(potential_stealable.w_class >= WEIGHT_CLASS_BULKY)
			continue
		if(potential_stealable.anchored || !(potential_stealable.interaction_flags_item & INTERACT_ITEM_ATTACK_HAND_PICKUP))
			continue
		stealables += potential_stealable

	for(var/obj/item/stealable as anything in shuffle(stealables))
		if(!stealable.IsReachableBy(owner) || stealable.IsObscured())
			continue
		// Try to do a raw click on the item with one of our empty hands, to pick it up (duh)
		owner.log_message("attempted to pick up (kleptomania)", LOG_ATTACK, color = "orange")
		owner.ClickOn(stealable)
		// No feedback message. Intentional, you may not even realize you picked up something
		break

	if(steal_to_offhand)
		owner.swap_hand(curr_index)
	owner.setDir(pre_dir)
	// Gives you a small buffer - not to avoid spam, but to make it more subtle / less predictable
	COOLDOWN_START(src, steal_cd, 8 SECONDS)
