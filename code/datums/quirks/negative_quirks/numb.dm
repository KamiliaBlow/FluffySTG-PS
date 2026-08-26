/datum/quirk/numb
	name = "Онемение"
	desc = "Вы не чувствуете боли."
	icon = FA_ICON_STAR_OF_LIFE
	value = -4
	gain_text = "Вы чувствуете, как ваше тело немеет."
	lose_text = "Онемение проходит."
	medical_record_text = "У пациента наблюдается врождённая гипестезия, вследствие чего не чувствует болевых раздражителей."
	medical_symptom_text = "Проявляет неспособность ощущать боль, что может привести к непреднамеренному нанесению себе травм и запоздалой реакции на опасные раздражители."
	hardcore_value = 4
	quirk_flags = QUIRK_TRAUMALIKE

/datum/quirk/numb/add(client/client_source)
	quirk_holder.apply_status_effect(/datum/status_effect/grouped/screwy_hud/fake_healthy, type)
	quirk_holder.add_traits(list(TRAIT_ANALGESIA, TRAIT_NO_DAMAGE_OVERLAY), QUIRK_TRAIT)

/datum/quirk/numb/remove(client/client_source)
	quirk_holder.remove_status_effect(/datum/status_effect/grouped/screwy_hud/fake_healthy, type)
	quirk_holder.remove_traits(list(TRAIT_ANALGESIA, TRAIT_NO_DAMAGE_OVERLAY), QUIRK_TRAIT)
