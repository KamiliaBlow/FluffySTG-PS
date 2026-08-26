/datum/quirk/coldblooded
	name = "Хладнокровие"
	desc = "Вы хладнокровны, как ящерица! Постарайтесь регулировать температуру тела, иначе вам конец."
	value = -2
	medical_record_text = "Пациент хладнокровен."
	gain_text = "Вам кажется, что вы не можете согреться."
	lose_text = "Вам кажется, что вы снова можешь согреться."
	icon = FA_ICON_SNOWFLAKE
	mob_trait = TRAIT_COLDBLOODED

/datum/quirk/coldblooded/is_species_appropriate(datum/species/mob_species)
	if(ispath(mob_species, /datum/species/lizard))
		return FALSE
	return ..()

