/datum/quirk/possessive
	name = "Притягательность"
	desc = "Вы испытываете сильную привязанность к любой вещи, которая у вас есть; зачастую вам кажется, что вы не можете с ней расстаться."
	value = 0
	gain_text = span_danger("Вам кажется, что всё, что у вас есть, слишком ценно, чтобы уронить.")
	lose_text = span_notice("И вдруг вам кажется, что ваши вещи уже не так важны.")
	medical_record_text = "Пациент проявляет склонность к привязанности к предметам."
	icon = FA_ICON_HANDS_HOLDING

/datum/quirk/possessive/post_add()
	. = ..()
	var/mob/living/carbon/human/affected_human = quirk_holder
	affected_human.gain_trauma(/datum/brain_trauma/mild/possessive, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/possessive/remove()
	. = ..()
	var/mob/living/carbon/human/affected_human = quirk_holder
	affected_human?.cure_trauma_type(/datum/brain_trauma/mild/possessive, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/kleptomaniac
	name = "Клептомания"
	desc = "Вы испытываете сильное желание взять в руки всё, что попадается на глаза, зачастую даже не осознавая этого."
	value = 0
	gain_text = span_danger("Вы чувствуете внезапное желание что-нибудь взять. Наверняка никто и не заметит.")
	lose_text = span_notice("Вы больше не испытываете желания что-то брать.")
	medical_record_text = "У пациента наблюдаются признаки клептомании."
	icon = FA_ICON_HAND_HOLDING

/datum/quirk/kleptomaniac/post_add()
	. = ..()
	var/mob/living/carbon/human/affected_human = quirk_holder
	affected_human.gain_trauma(/datum/brain_trauma/severe/kleptomaniac, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/kleptomaniac/remove()
	. = ..()
	var/mob/living/carbon/human/affected_human = quirk_holder
	affected_human?.cure_trauma_type(/datum/brain_trauma/severe/kleptomaniac, TRAUMA_RESILIENCE_ABSOLUTE)
