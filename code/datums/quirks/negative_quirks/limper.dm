/datum/quirk/item_quirk/limper
	name = "Слабость в ноге"
	desc = "Вы заметно прихрамываете при ходьбе. Это значительно замедлит ваше передвижение. Хорошо, что вы взяли с собой трость."
	icon = FA_ICON_PERSON_CANE
	gain_text = span_danger("Нога как будто немного подкашивается.")
	lose_text = span_notice("Ваши ноги снова стали нормальными.")
	medical_record_text = "Судя по всему, у пациента наблюдается слабость в ноге."
	value = -6
	hardcore_value = 3
	quirk_flags = QUIRK_HUMAN_ONLY

	mail_goodies = list(
		/obj/item/cane,
		/obj/item/cane/crutch,
		/obj/item/cane/white,
	)

/datum/quirk/item_quirk/limper/add_unique(client/client_source)
	give_item_to_holder(new /obj/item/cane(get_turf(quirk_holder)), list(
			LOCATION_HANDS,
			LOCATION_BACKPACK,
		))
	return

/datum/quirk/item_quirk/limper/add(client/client_source)
	quirk_holder.apply_status_effect(/datum/status_effect/limp/quirk)

/datum/quirk/item_quirk/limper/remove(client/client_source)
	quirk_holder.remove_status_effect(/datum/status_effect/limp/quirk)

