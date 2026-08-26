/datum/disease/chronic_illness
	stage_prob = 0.10 // Originally: stage_prob = 0.25

/datum/quirk/item_quirk/chronic_illness
	name = "Хроническое заболевание с темпоральным стиранием"
	desc = "Вы страдаете аномальным хроническим заболеванием, требующим постоянного приёма лекарств. Без лечения оно приводит к коррекции временного потока."
	icon = FA_ICON_DISEASE
	value = -12
	gain_text = span_danger("Вы чувствуете, будто начинаете исчезать...")
	lose_text = span_notice("Вы внезапно снова ощущаете себя более реальным.")
	medical_record_text = "Пациент страдает аномальным хроническим заболеванием, требующим постоянного приёма лекарств для контроля состояния."
	hardcore_value = 12
	mail_goodies = list(/obj/item/storage/pill_bottle/sansufentanyl)

/datum/quirk/item_quirk/chronic_illness/add(client/client_source)
	var/datum/disease/chronic_illness/hms = new()
	quirk_holder.ForceContractDisease(hms, make_copy = FALSE, del_on_fail = TRUE)

/datum/quirk/item_quirk/chronic_illness/add_unique(client/client_source)
	give_item_to_holder(/obj/item/storage/pill_bottle/sansufentanyl, list(LOCATION_BACKPACK), flavour_text = "Вам назначили препарат, который помогает контролировать ваше состояние. Принимайте его регулярно, чтобы избежать осложнений.", notify_player = TRUE)
	give_item_to_holder(/obj/item/healthanalyzer/simple/disease, list(LOCATION_BACKPACK))
