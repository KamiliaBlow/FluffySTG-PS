/datum/quirk/masquerade_food
	name = "Маскарад"
	desc = "Гемофаг, адаптировавшийся к употреблению обычной еды и напитков. Это делается исключительно ради удовольствия, так как питательной пользы от такой пищи вы не получаете."
	gain_text = span_notice("Вы чувствуете, что ваше тело адаптировалось к употреблению обычной еды и напитков без необходимости смешивать их с кровью.")
	lose_text = span_danger("Вы чувствуете, что ваше тело больше не способно употреблять обычную еду или напитки без добавления крови.")
	medical_record_text = "Пациент способен употреблять еду и напитки без необходимости добавлять кровь, хотя не получает от этого питательной пользы."
	value = 2
	mob_trait = TRAIT_MASQUERADE_FOOD
	icon = FA_ICON_MASK
	quirk_flags = QUIRK_HUMAN_ONLY

/datum/quirk/masquerade_food/is_species_appropriate(datum/species/mob_species)
	var/datum/species_traits = GLOB.species_prototypes[mob_species].inherent_traits
	if(TRAIT_DRINKS_BLOOD in species_traits)
		return TRUE
	else
		return FALSE
