/datum/quirk/hydrophobia
	name = "Гидрофобия"
	desc = "Вы панически боитесь воды! Для гибридов-слизней это также означает, что вы не сможете отталкивать воду."
	gain_text = span_danger("Вы считаете, что вода - это самое ужасное, что только может существовать.")
	lose_text = span_danger("Вы больше не считаете, что вода - это что-то такое уж плохое.")
	medical_record_text = "Пациент страдает гидрофобией, проявляя крайнюю тревогу вблизи водоемов."
	value = -2
	mob_trait = TRAIT_WATER_HATER
	icon = FA_ICON_WATER_LADDER
	quirk_flags = QUIRK_HUMAN_ONLY

/datum/quirk/hydrophobia/is_species_appropriate(datum/species/mob_species)
	if(TRAIT_WATER_HATER in GLOB.species_prototypes[mob_species].inherent_traits)
		return FALSE
	else
		return ..()

/datum/quirk/hydrophobia/add(client/client_source)
	// If they're a slime, let's remove their ability
	var/datum/action/cooldown/spell/slime_hydrophobia/slime_hydrophobia = locate() in quirk_holder.actions
	if(slime_hydrophobia)
		qdel(slime_hydrophobia)

/datum/quirk/hydrophobia/remove()
	// If they're a slime, let's grant them the ability to repel water
	var/datum/action/cooldown/spell/slime_hydrophobia/slime_hydrophobia = locate() in quirk_holder.actions
	if(isnull(slime_hydrophobia) && isroundstartslime(quirk_holder) && !HAS_TRAIT(quirk_holder, TRAIT_WATER_BREATHING))
		slime_hydrophobia = new(src)
		slime_hydrophobia.Grant(quirk_holder)
