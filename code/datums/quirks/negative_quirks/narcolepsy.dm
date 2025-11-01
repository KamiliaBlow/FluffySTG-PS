/datum/quirk/item_quirk/narcolepsy
	name = "Нарколепсия"
	desc = "Вы часто чувствуете сонливость и можете заснуть в любой момент. Употребление кофеина, прогулки или даже подавление симптомов с помощью стимуляторов, прописанных врачом или без рецепта, могут помочь вам продержаться до конца смены..."
	icon = FA_ICON_BED
	value = -8
	hardcore_value = 8
	medical_record_text = "Пациент может непроизвольно засыпать во время обычных действий и чувствовать сонливость в любой момент времени."
	mail_goodies = list(
		/obj/item/reagent_containers/cup/glass/coffee,
		/obj/item/reagent_containers/cup/soda_cans/space_mountain_wind,
		/obj/item/storage/pill_bottle/prescription_stimulant,
	)

/datum/quirk/item_quirk/narcolepsy/add(client/client_source)
	var/mob/living/carbon/carbon_user = quirk_holder
	carbon_user.gain_trauma(/datum/brain_trauma/severe/narcolepsy/permanent, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/item_quirk/narcolepsy/add_unique(client/client_source)
	give_item_to_holder(
		stim_medication, // NOVA EDIT CHANGE - Original: /obj/item/storage/pill_bottle/prescription_stimulant,
		list(
			LOCATION_BACKPACK,
			LOCATION_LPOCKET,
			LOCATION_RPOCKET,
			LOCATION_HANDS,
		),
		flavour_text = "Дано тебе, чтобы помочь тебе не заснуть во время этой смены...",
		notify_player = TRUE,
	)

/datum/quirk/item_quirk/narcolepsy/remove()
	if(!QDELETED(quirk_holder) && quirk_holder.get_organ_by_type(/obj/item/organ/brain))
		var/mob/living/carbon/carbon_user = quirk_holder
		carbon_user?.cure_trauma_type(/datum/brain_trauma/severe/narcolepsy/permanent, TRAUMA_RESILIENCE_ABSOLUTE)
