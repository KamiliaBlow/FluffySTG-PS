/datum/quirk/nyctophobia
	name = "Никтофобия"
	desc = "Насколько вы можете вспомнить, вы всегда боялись темноты. Находясь в темноте без источника света, вы инстинктивно ведете себя осторожно и постоянно испытываете чувство страха."
	icon = FA_ICON_LIGHTBULB
	value = -3
	medical_record_text = "Пациент испытывает страх перед темнотой. (Серьёзно?)"
	medical_symptom_text = "В темноте у пациента возникают приступы паники и одышка. \
		Такие лекарства, как 'Псикодин', могут ослабить выраженность реакции."
	hardcore_value = 5
	mail_goodies = list(/obj/effect/spawner/random/engineering/flashlight)
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_TRAUMALIKE

/datum/quirk/nyctophobia/add(client/client_source)
	quirk_holder.AddComponentFrom(type, /datum/component/fearful, list(/datum/terror_handler/simple_source/nyctophobia))

/datum/quirk/nyctophobia/remove()
	quirk_holder.RemoveComponentSource(type, /datum/component/fearful)
