// Re-labels TG brainproblems to be more generic. There never was a tumor anyways!
/datum/quirk/item_quirk/brainproblems
	name = "Дегенерация мозга"
	desc = "У вас в мозгу смертельное заболевание, которое медленно разрушает его. Лучше взять с собой маннитол!"
	medical_record_text = "У пациента смертельное заболевание мозга, которое медленно приводит к смерти."
	icon = FA_ICON_BRAIN

// Override of Brain Tumor quirk for robotic/synthetic species with posibrains.
// Does not appear in TGUI or the character preferences window.
/datum/quirk/item_quirk/brainproblems/synth
	name = "Позитронно-каскадная аномалия"
	desc = "Ваш позитронный мозг медленно разрушается из-за каскадной аномалии. Лучше взять с собой жидкий припой!"
	gain_text = "<span class='danger'>Вы чувствуете сбои в работе.</span>"
	lose_text = "<span class='notice'>Вы больше не чувствуете сбоев.</span>"
	medical_record_text = "У пациента каскадная аномалия в мозге, которая медленно приводит к смерти мозга."
	icon = FA_ICON_BRAZILIAN_REAL_SIGN
	mail_goodies = list(/obj/item/storage/pill_bottle/liquid_solder/braintumor)
	hidden_quirk = TRUE

// If brainproblems is added to a synth, this detours to the brainproblems/synth quirk.
// TODO: Add more brain-specific detours when PR #16105 is merged
/datum/quirk/item_quirk/brainproblems/add_to_holder(mob/living/new_holder, quirk_transfer, client/client_source)
	if(!issynthetic(new_holder) || type != /datum/quirk/item_quirk/brainproblems)
		// Defer to TG brainproblems if the character isn't robotic.
		return ..()

	// TODO: Check brain type and detour to appropriate brainproblems quirk
	var/datum/quirk/item_quirk/brainproblems/synth/bp_synth = new
	qdel(src)
	return bp_synth.add_to_holder(new_holder, quirk_transfer, client_source)

// Synthetics get liquid_solder with Brain Tumor instead of mannitol.
/datum/quirk/item_quirk/brainproblems/synth/add_unique(client/client_source)
	give_item_to_holder(
		/obj/item/storage/pill_bottle/liquid_solder/braintumor,
		list(
			LOCATION_LPOCKET = ITEM_SLOT_LPOCKET,
			LOCATION_RPOCKET = ITEM_SLOT_RPOCKET,
			LOCATION_BACKPACK = ITEM_SLOT_BACKPACK,
			LOCATION_HANDS = ITEM_SLOT_HANDS,
		),
		flavour_text = "Они помогут вам выжить, пока вы не получите запас лекарств. Не полагайтесь на них слишком сильно!",
	)
