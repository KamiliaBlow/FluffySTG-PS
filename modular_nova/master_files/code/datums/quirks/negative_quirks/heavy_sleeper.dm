// re-adds heavy sleeper
/datum/quirk/heavy_sleeper
	name = "Глубокий сон"
	desc = "Вы спите как камень! Когда вас усыпляют или лишают сознания, вам требуется немного больше времени, чтобы проснуться."
	icon = FA_ICON_BED
	value = -2
	mob_trait = TRAIT_HEAVY_SLEEPER
	gain_text = span_danger("Вам хочется спать.")
	lose_text = span_notice("Вы снова чувствуете себя бодрячком.")
	medical_record_text = "У пациента аномальные результаты исследования сна, и его трудно разбудить."
	hardcore_value = 2
	mail_goodies = list(
		/obj/item/clothing/glasses/blindfold,
		/obj/effect/spawner/random/bedsheet/any,
		/obj/item/clothing/under/misc/pj/red,
		/obj/item/clothing/head/costume/nightcap/red,
		/obj/item/clothing/under/misc/pj/blue,
		/obj/item/clothing/head/costume/nightcap/blue,
		/obj/item/pillow/random,
	)
