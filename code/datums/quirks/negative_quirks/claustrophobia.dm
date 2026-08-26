/datum/quirk/claustrophobia
	name = "Клаустрофобия"
	desc = "Вы испытываете сильный страх перед замкнутыми пространствами. Если вас поместят в какой-либо контейнер, шкафчик или механизм, у вас начинается приступ паники, и вам становится трудно дышать." // NOVA EDIT CHANGE - ORIGINAL: desc = "You are terrified of small spaces and certain jolly figures. If you are placed inside any container, locker, or machinery, a panic attack sets in and you struggle to breathe."
	icon = FA_ICON_BOX_OPEN
	value = -4
	medical_record_text = "У пациента наблюдается боязнь замкнутых пространств."
	medical_symptom_text = "Испытывает приступы паники и одышку, когда находится в замкнутом пространстве. \
		Такие лекарственные препараты, как 'Псикодин', могут снизить выраженность реакции."
	hardcore_value = 5
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_TRAUMALIKE
	mail_goodies = list(/obj/item/reagent_containers/syringe/convermol) // to help breathing

/datum/quirk/claustrophobia/add(client/client_source)
	quirk_holder.AddComponentFrom(type, /datum/component/fearful, list(/datum/terror_handler/simple_source/claustrophobia, /datum/terror_handler/simple_source/clausophobia))

/datum/quirk/claustrophobia/remove()
	quirk_holder.RemoveComponentSource(type, /datum/component/fearful)
