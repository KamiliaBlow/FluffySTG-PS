/datum/quirk/bouncy
	name = "Попрыгунчик!"
	desc = "У вас такая прыгучая походка!"
	gain_text = span_notice("Вы прыгаете с места на место!")
	lose_text = span_notice("Вы потеряли бодрость в походке...")
	medical_record_text = "Пациент ходит неровно."
	value = 0
	icon = FA_ICON_TURN_UP

/datum/quirk/bouncy/add(client/client_source)
	quirk_holder.AddElementTrait(TRAIT_WADDLING, QUIRK_TRAIT, /datum/element/waddling)

/datum/quirk/bouncy/remove()
	REMOVE_TRAIT(quirk_holder, TRAIT_WADDLING, QUIRK_TRAIT)
