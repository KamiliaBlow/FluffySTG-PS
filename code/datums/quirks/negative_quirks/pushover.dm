/datum/quirk/pushover
	name = "Слабак"
	desc = "Ваш первый инстинкт всегда заключается в том, чтобы позволить людям толкать вас. Сопротивляться захватам заметно сложнее."
	icon = FA_ICON_HANDSHAKE
	value = -8
	mob_trait = TRAIT_GRABWEAKNESS
	gain_text = span_danger("Вы чувствуете себя слабаком.")
	lose_text = span_notice("Вы чувствуете, что хотите постоять за себя.")
	medical_record_text = "Пациент демонстрирует явно нерешительный характер и легко поддается манипуляциям."
	hardcore_value = 4
	mail_goodies = list(/obj/item/clothing/gloves/cargo_gauntlet)
