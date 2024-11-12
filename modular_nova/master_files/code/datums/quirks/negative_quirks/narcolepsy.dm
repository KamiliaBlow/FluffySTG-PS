/datum/quirk/narcolepsy
	name = "Нарколепсия"
	desc = "Вы можете заснуть в любой момент и часто чувствуете усталость."
	icon = FA_ICON_CLOUD_MOON_RAIN
	value = -8
	hardcore_value = 8
	medical_record_text = "Пациент может непроизвольно засыпать во время обычной деятельности."
	mail_goodies = list(
		/obj/item/reagent_containers/cup/glass/coffee,
		/obj/item/reagent_containers/cup/soda_cans/space_mountain_wind,
		/obj/item/storage/pill_bottle/prescription_stimulant,
	)

/datum/quirk/narcolepsy/post_add()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user.gain_trauma(/datum/brain_trauma/severe/narcolepsy/permanent, TRAUMA_RESILIENCE_ABSOLUTE)

	var/obj/item/storage/medkit/civil_defense/comfort/stocked/stimmies = new()
	if(quirk_holder.equip_to_slot_if_possible(stimmies, ITEM_SLOT_BACKPACK, qdel_on_fail = TRUE, initial = TRUE, indirect_action = TRUE))
		to_chat(quirk_holder, span_info("Вам выдали фирменный набор для снятия симптомов, содержащий легкие стимуляторы, которые помогут не заснуть в эту смену. Отнеситесь к дозировке ответственно. При возникновении побочных эффектов обратитесь к своему лечащему врачу."))

/datum/quirk/narcolepsy/remove()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user?.cure_trauma_type(/datum/brain_trauma/severe/narcolepsy/permanent, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/brain_trauma/severe/narcolepsy/permanent
	scan_desc = "narcolepsy"

//similar to parent but slower
/datum/brain_trauma/severe/narcolepsy/permanent/on_life(seconds_per_tick, times_fired)
	if(owner.IsSleeping())
		return
	if(owner.reagents.has_reagent(/datum/reagent/medicine/modafinil))
		return //stimulant which already blocks sleeping
	if(owner.reagents.has_reagent(/datum/reagent/medicine/synaptizine))
		return //mild stimulant easily made in chemistry

	var/sleep_chance = 0.333 //3
	var/drowsy = !!owner.has_status_effect(/datum/status_effect/drowsiness)
	var/caffeinated = HAS_TRAIT(owner, TRAIT_STIMULATED)
	if(drowsy)
		sleep_chance = 1
	if(caffeinated) //make it real hard to fall asleep on caffeine
		sleep_chance = sleep_chance / 2

	if(!drowsy && SPT_PROB(sleep_chance, seconds_per_tick))
		to_chat(owner, span_warning("Вы чувствуете усталость..."))
		owner.adjust_drowsiness(rand(30 SECONDS, 60 SECONDS))

	else if(drowsy && SPT_PROB(sleep_chance, seconds_per_tick))
		to_chat(owner, span_warning("Вы засыпаете."))
		owner.Sleeping(rand(20 SECONDS, 30 SECONDS))
