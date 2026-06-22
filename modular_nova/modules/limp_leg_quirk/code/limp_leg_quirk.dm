/datum/quirk/item_quirk/limp_leg
	name = "Limp Leg"
	desc = "Ваша нога не работает по той или иной причине. Костыль помогает вам не отставать от других."
	icon = FA_ICON_WALKING
	value = -4
	gain_text = span_notice("Вы чувствуете, как ноги подкашиваются под вами.")
	lose_text = span_notice("Ходьба снова стала естественной.")
	medical_record_text = "Пациент демонстрирует нарушение подвижности из-за хромоты ноги."
	quirk_flags = QUIRK_HUMAN_ONLY

/datum/quirk_constant_data/limp_leg
	associated_typepath = /datum/quirk/item_quirk/limp_leg
	customization_options = list(/datum/preference/choiced/limp_leg)

/datum/quirk/item_quirk/limp_leg/add_unique(client/client_source)
	. = ..()

	give_item_to_holder(
		/obj/item/cane/crutch,
		list(
			LOCATION_HANDS,
		),
		flavour_text = "Ваш костыль необходим для передвижения на полной скорости. Не теряйте его.",
		notify_player = TRUE,
	)

/datum/quirk/item_quirk/limp_leg/add(client/client_source)

	var/leg_side = client_source?.prefs.read_preference(/datum/preference/choiced/limp_leg)

	switch(leg_side)
		if("Random")
			ADD_TRAIT(quirk_holder, pick(TRAIT_PARALYSIS_L_LEG, TRAIT_PARALYSIS_R_LEG), QUIRK_TRAIT)
		if("Левая нога")
			ADD_TRAIT(quirk_holder, TRAIT_PARALYSIS_L_LEG, QUIRK_TRAIT)
		if("Правая нога")
			ADD_TRAIT(quirk_holder, TRAIT_PARALYSIS_R_LEG, QUIRK_TRAIT)

/datum/quirk/item_quirk/limp_leg/remove()
	REMOVE_TRAIT(quirk_holder, TRAIT_PARALYSIS_L_LEG, QUIRK_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_PARALYSIS_R_LEG, QUIRK_TRAIT)
