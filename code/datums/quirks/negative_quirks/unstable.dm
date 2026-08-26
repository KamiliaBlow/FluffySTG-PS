/datum/quirk/unstable
	name = "Нестабильность"
	desc = "Из-за проблем в прошлом вы не сможете восстановить рассудок, если его утратите. Будьте очень осторожны, и следите за своим настроением!"
	icon = FA_ICON_ANGRY
	value = -10
	mob_trait = TRAIT_UNSTABLE
	gain_text = span_danger("Сейчас у вас на уме много всего.")
	lose_text = span_notice("Ваш разум наконец-то обрёл покой.")
	medical_record_text = "Психика пациента находится в уязвимом состоянии и не может оправиться от травмирующих событий."
	medical_symptom_text = "Наблюдается выраженная нестабильность настроения и неспособность восстанавливаться после психологических стрессовых факторов."
	hardcore_value = 9
	mail_goodies = list(/obj/effect/spawner/random/entertainment/plushie)
	quirk_flags = QUIRK_TRAUMALIKE
