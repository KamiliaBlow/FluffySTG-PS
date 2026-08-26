// Re-labels TG brainproblems to be more generic. There never was a tumor anyways!
/datum/quirk/item_quirk/brainproblems
	name = "Дегенерация мозга"
	desc = "У вас в мозге развивается смертельное заболевание, которое постепенно разрушает его. Лучше принесите немного маннитола!"
	medical_record_text = "Patient has a lethal condition in their brain that is slowly causing brain death."
	icon = FA_ICON_BRAIN
	species_quirks = list(/datum/species/synthetic = /datum/quirk/item_quirk/brainproblems/synth)
	//overrides for brainproblems variables, halves the degradation speed and gives the player a normal mannitol bottle.
	degradation_speed = 0.1
	medicine_to_get = /obj/item/storage/pill_bottle/mannitol

// Override of Brain Tumor quirk for species with artificial brains.
// Does not appear in TGUI or the character preferences window.
/datum/quirk/item_quirk/brainproblems/synth
	name = "Positronic Cascade Anomaly"
	gain_text = span_danger("Вы чувствуете глюки в системе.")
	lose_text = span_notice("Вы больше не чувствуете глюков в системе.")
	mail_goodies = list(/obj/item/storage/pill_bottle/liquid_solder/braintumor)
	abstract_type = /datum/quirk/item_quirk/brainproblems/synth
	medicine_to_get = /obj/item/storage/pill_bottle/liquid_solder

// Adds custom medical flavortext for synthetic brains.
/datum/quirk/item_quirk/brainproblems/synth/add()
	. = ..()
	var/obj/item/organ/brain/synth/synth_brain = quirk_holder.get_organ_slot(ORGAN_SLOT_BRAIN)
	switch(synth_brain.type)
		if(/obj/item/organ/brain/synth)
			name = "Positronic Cascade Anomaly"
		if(/obj/item/organ/brain/synth/mmi)
			name = "Interface Rejection Syndrome"
		if(/obj/item/organ/brain/synth/circuit)
			name = "Processor Firmware Bug"
		if(/obj/item/organ/brain/synth/circuit/hyperboard)
			name = "Processor Firmware Bug"
		if(/obj/item/organ/brain/synth/circuit/limaengine)
			name = "Liquid Core Instability Anomaly"
		if(/obj/item/organ/brain/synth/circuit/disk)
			name = "Short-circuited Hardware"
		if(/obj/item/organ/brain/synth/circuit/neuroboard)
			name = "Neural System Malfunction"
		if(/obj/item/organ/brain/synth/circuit/condensed)
			name = "Crystal Destabilization"
		if(/obj/item/organ/brain/synth/circuit/cyberdeck)
			name = "System Destabilization"

	medical_record_text = "У пациента наблюдается сбой в работе [synth_brain.name], который постепенно приводит к смерти мозга."
