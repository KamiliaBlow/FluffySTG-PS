// Override of Blood Deficiency quirk for robotic/synthetic species.
// Does not appear in TGUI or the character preferences window.
/datum/quirk/blooddeficiency/synth
	name = "Утечка гидравлики"
	desc = "Гидравлические жидкости вашего тела протекают через уплотнения."
	medical_record_text = "Пациенту требуется регулярное лечение гидравлической потери жидкости."
	icon = FA_ICON_GLASS_WATER_DROPLET
	mail_goodies = list(/obj/item/reagent_containers/blood/oil)
	// min_blood = BLOOD_VOLUME_BAD - 25; // TODO: Uncomment after TG PR #70563
	hidden_quirk = TRUE

// If blooddeficiency is added to a synth, this detours to the blooddeficiency/synth quirk.
/datum/quirk/blooddeficiency/add_to_holder(mob/living/new_holder, quirk_transfer, client/client_source)
	if(!issynthetic(new_holder) || type != /datum/quirk/blooddeficiency)
		// Defer to TG blooddeficiency if the character isn't robotic.
		return ..()

	var/datum/quirk/blooddeficiency/synth/bd_synth = new
	qdel(src)
	return bd_synth.add_to_holder(new_holder, quirk_transfer)
