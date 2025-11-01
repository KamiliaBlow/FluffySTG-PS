/datum/quirk/unstable
	name = "Нестабильный"
	desc = "Из-за проблем в прошлом, вы не сможете восстановить свое душевное равновесие, и постоянно его теряете. Будьте очень осторожны, и следите за настроением!"
	icon = FA_ICON_ANGRY
	value = -10
	mob_trait = TRAIT_UNSTABLE
	gain_text = span_danger("Сейчас у вас много дел.")
	lose_text = span_notice("Ваш разум наконец-то успокоился.")
	medical_record_text = "Психика пациента находится в уязвимом состоянии и не может оправиться от травмирующих событий."
	hardcore_value = 9
	mail_goodies = list(/obj/effect/spawner/random/entertainment/plushie)
