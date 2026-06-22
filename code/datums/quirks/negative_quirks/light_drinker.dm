/datum/quirk/light_drinker
	name = "Light Drinker"
	desc = "Вы просто не можете контролировать количество выпитого и очень быстро пьянеете."
	icon = FA_ICON_COCKTAIL
	value = -2
	mob_trait = TRAIT_LIGHT_DRINKER
	gain_text = span_notice("Одна только мысль о том, чтобы выпить алкоголь, заставляет голову кружиться.")
	lose_text = span_danger("Вы больше не испытываете сильного воздействия алкоголя.")
	medical_record_text = "Пациент демонстрирует низкую толерантность к алкоголю. (Слабак)"
	hardcore_value = 3
	mail_goodies = list(/obj/item/reagent_containers/cup/glass/waterbottle)
