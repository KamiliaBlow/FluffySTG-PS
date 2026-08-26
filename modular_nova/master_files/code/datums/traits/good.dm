// NOVA GOOD TRAITS

/datum/quirk/hard_soles
	name = "Жесткая кожа"
	desc = "Вы привыкли ходить босиком, и это не приносит вам никаких негативных последствий."
	value = 2
	mob_trait = TRAIT_HARD_SOLES
	gain_text = span_notice("Поверхность больше не кажется такой неровной под ногами.")
	lose_text = span_danger("Вы начинаете ощущать неровности и выпуклости на поверхности.")
	medical_record_text = "Ступни пациента обладают большей устойчивостью к растяжению."
	icon = FA_ICON_PERSON_RUNNING

/datum/quirk/linguist
	name = "Лингвист"
	desc = "Вы изучали множество языков и получаете дополнительный балл за знание языков."
	value = 0
	mob_trait = TRAIT_LINGUIST
	gain_text = span_notice("Похоже, ваш мозг лучше приспособлен к работе с различными стилями общения.")
	lose_text = span_danger("Ваше понимание тонкостей драконьих идиом постепенно угасает.")
	medical_record_text = "У пациента наблюдается высокая пластичность мозга в отношении изучения языков."
	icon = FA_ICON_BOOK_ATLAS

/datum/quirk/sharpclaws
	name = "Острые когти"
	desc = "Будь то врождённые биологические особенности охотника или ваше упрямое нежелание подстригать ногти перед занятиями по джиу-джитсу, ваши атаки без оружия становятся более резкими и заставляют людей кровоточить."
	value = 2
	gain_text = span_notice("Ваши ладони немного болят из-за острых ногтей.")
	lose_text = span_danger("Когда ногти теряют блеск, вы ощущаете явную пустоту; удачи вам в попытках почесать это место.")
	medical_record_text = "Пациент в итоге процарапал обивку кушеток на осмотровом столе; было рекомендовано подумать о подстригании его когтей."
	icon = FA_ICON_LINES_LEANING

/datum/quirk/sharpclaws/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	if(!istype(human_holder))
		return FALSE

	var/obj/item/bodypart/arm/left/left_arm = human_holder.get_bodypart(BODY_ZONE_L_ARM)
	if(left_arm)
		left_arm.unarmed_attack_verbs = list("slash")
		left_arm.unarmed_attack_effect = ATTACK_EFFECT_CLAW
		left_arm.unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
		left_arm.unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'
		left_arm.unarmed_sharpness = SHARP_EDGED

	var/obj/item/bodypart/arm/right/right_arm = human_holder.get_bodypart(BODY_ZONE_R_ARM)
	if(right_arm)
		right_arm.unarmed_attack_verbs = list("slash")
		right_arm.unarmed_attack_effect = ATTACK_EFFECT_CLAW
		right_arm.unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
		right_arm.unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'
		right_arm.unarmed_sharpness = SHARP_EDGED

/datum/quirk/sharpclaws/remove(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/bodypart/arm/left/left_arm = human_holder.get_bodypart(BODY_ZONE_L_ARM)
	if(left_arm)
		left_arm.unarmed_attack_verbs = initial(left_arm.unarmed_attack_verbs)
		left_arm.unarmed_attack_effect = initial(left_arm.unarmed_attack_effect)
		left_arm.unarmed_attack_sound = initial(left_arm.unarmed_attack_sound)
		left_arm.unarmed_miss_sound = initial(left_arm.unarmed_miss_sound)
		left_arm.unarmed_sharpness = initial(left_arm.unarmed_sharpness)

	var/obj/item/bodypart/arm/right/right_arm = human_holder.get_bodypart(BODY_ZONE_R_ARM)
	if(right_arm)
		right_arm.unarmed_attack_verbs = initial(right_arm.unarmed_attack_verbs)
		right_arm.unarmed_attack_effect = initial(right_arm.unarmed_attack_effect)
		right_arm.unarmed_attack_sound = initial(right_arm.unarmed_attack_sound)
		right_arm.unarmed_miss_sound = initial(right_arm.unarmed_miss_sound)
		right_arm.unarmed_sharpness = initial(right_arm.unarmed_sharpness)

// AdditionalEmotes *turf quirks
/datum/quirk/water_aspect
	name = "Аспект «Вода» (Эмоции)"
	desc = "(Врождённая способность Акванов) Подводные миры - ваш дом, а космос от них не сильно отличается. (Чтобы применить эффект, скажите *turf)"
	value = 0
	mob_trait = TRAIT_WATER_ASPECT
	gain_text = span_notice("Вам кажется, что вы можете управлять водой.")
	lose_text = span_danger("По какой-то причине вы утратили способность управлять водой!")
	medical_record_text = "Пациент держит в руках набор наноботов, предназначенных для синтеза H2O."
	icon = FA_ICON_WATER

/datum/quirk/webbing_aspect
	name = "Аспект «Паутина» (Эмоции)"
	desc = "(Врождённая способность Насекомых) Насекомые, умеющие ткать, нередко сталкиваются с завистью со стороны тех, кто не обладает врождённой способностью создавать трёхмерные объекты. (Чтобы применить эффект, скажите *turf)"
	value = 0
	mob_trait = TRAIT_WEBBING_ASPECT
	gain_text = span_notice("Вы без труда смогли бы сплести паутину.")
	lose_text = span_danger("Почему-то вы утратили умение ткать.")
	medical_record_text = "Пациент обладает способностью плести паутину из шелка, вырабатываемого организмом."
	icon = FA_ICON_STICKY_NOTE

/datum/quirk/floral_aspect
	name = "Аспект «Растение» (Эмоции)"
	desc = "(Врождённая способность Подперсона) Исследования кудзу не напрасны - технология ускоренного фотосинтеза уже здесь! (Чтобы применить эффект, скажите *turf)"
	value = 0
	mob_trait = TRAIT_FLORAL_ASPECT
	gain_text = span_notice("У вас создается ощущение, что вы можете выращивать виноградные лозы.")
	lose_text = span_danger("По какой-то причине вы утратили способность к быстрой фотосинтезе.")
	medical_record_text = "Пациент способен быстро осуществлять фотосинтез для выращивания лиан."
	icon = FA_ICON_PLANT_WILT

/datum/quirk/ash_aspect
	name = "Аспект «Пепел» (Эмоции)"
	desc = "(Врождённая способность ящериц) Способность создавать пепел и пламя - могущественная сила, хотя в основном используется для эффектных выступлений. (Чтобы применить эффект, скажите *turf)"
	value = 0
	mob_trait = TRAIT_ASH_ASPECT
	gain_text = span_notice("Внутри вас тлеет пламя кузницы.")
	lose_text = span_danger("По какой-то причине вы утратили способность извергать огонь.")
	medical_record_text = "У пациента имеется огнедышащая железа, характерная для людоящеров."
	icon = FA_ICON_FIRE

/datum/quirk/sparkle_aspect
	name = "Аспект «Сияние» (Эмоции)"
	desc = "(Врождённое у молей) Сверкать, как пыль на крыльях моли, или как дешёвая интрижка в квартале красных фонарей. (Чтобы применить эффект, скажите *turf)"
	value = 0
	mob_trait = TRAIT_SPARKLE_ASPECT
	gain_text = span_notice("Вы полностью покрыты сверкающей пылью!")
	lose_text = span_danger("Как-то так получилось, что вы полностью избавились от блесток...")
	medical_record_text = "Пациент, похоже, выглядит просто ослепительно великолепно."
	icon = FA_ICON_HAND_SPARKLES

/datum/quirk/no_appendix
	name = "Выживший после аппендицита"
	desc = "В прошлом у вас был приступ аппендицита, и теперь у вас нет аппендикса."
	icon = FA_ICON_NOTES_MEDICAL
	value = 0
	gain_text = span_notice("У вас больше нет аппендикса.")
	lose_text = span_danger("Ваш аппендикс как по волшебству… снова вырос?")
	medical_record_text = "У пациента в прошлом был аппендицит, и ему хирургическим путем его удалили."
	/// The mob's original appendix
	var/obj/item/organ/appendix/old_appendix

/datum/quirk/no_appendix/post_add()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder
	old_appendix = carbon_quirk_holder.get_organ_slot(ORGAN_SLOT_APPENDIX)

	if(isnull(old_appendix))
		return

	old_appendix.Remove(carbon_quirk_holder, special = TRUE)
	old_appendix.moveToNullspace()

	STOP_PROCESSING(SSobj, old_appendix)

/datum/quirk/no_appendix/remove()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder

	if(isnull(old_appendix))
		return

	var/obj/item/organ/appendix/current_appendix = carbon_quirk_holder.get_organ_slot(ORGAN_SLOT_APPENDIX)

	// if we have not gained an appendix already, put the old one back
	if(isnull(current_appendix))
		old_appendix.Insert(carbon_quirk_holder, special = TRUE)
	else
		qdel(old_appendix)

	old_appendix = null

/datum/quirk/sensitive_hearing // Teshari hearing but as a quirk
	name = "Чувствительный слух"
	desc = "Вы можете слышать даже самые тихие звуки, но из-за этого вы становитесь более уязвимыми к повреждению слуха. ПРИМЕЧАНИЕ: Это прямой ухудшение характеристик для Тешари!"
	icon = FA_ICON_HEADPHONES_SIMPLE
	value = 6
	hidden_quirk = TRUE // disabled until reworked.
	mob_trait = TRAIT_SENSITIVE_HEARING
	gain_text = span_notice("С расстояния 3х метров можно было услышать, как падает булавка.")
	lose_text = span_danger("Ваш слух стал менее чувствительным.")
	medical_record_text = "Результаты тестов слуха у пациента оказались очень высокими."
	/// Teshari hearing is an action, so here is its holder
	var/datum/action/cooldown/spell/teshari_hearing/hearing_action

/datum/quirk/sensitive_hearing/add_unique()
	var/obj/item/organ/ears/ears = quirk_holder.get_organ_slot(ORGAN_SLOT_EARS)

	hearing_action = new
	LAZYADD(ears.actions_types, hearing_action.type)
	ears.add_item_action(hearing_action)
	hearing_action.Grant(quirk_holder)

/datum/quirk/sensitive_hearing/remove()
	if(QDELING(quirk_holder))
		return
	var/obj/item/organ/ears/ears = quirk_holder.get_organ_slot(ORGAN_SLOT_EARS)
	if(isnull(ears))
		return

	LAZYREMOVE(ears.actions_types, hearing_action.type)
	ears.remove_item_action(hearing_action)
	hearing_action.Remove(quirk_holder)
	//restore dmg multiplier of our current ears
	//we could have any subtype at this point so just take that one's initial value
	//as opposed to making a copy at the start of the player's round (what if they transplant it, etc)
	ears.damage_multiplier = initial(ears.damage_multiplier)
