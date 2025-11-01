/datum/quirk/nonviolent
	name = "Пацифист"
	desc = "Мысль о насилии вызывает у вас отвращение. Настолько сильное, что вы не можете причинить никому вреда."
	icon = FA_ICON_PEACE
	value = -8
	mob_trait = TRAIT_PACIFISM
	gain_text = span_danger("Вы испытываете отвращение при мысли о насилии!")
	lose_text = span_notice("Вы думаете, что сможете снова защитить себя.")
	medical_record_text = "Пациент необычайно миролюбив и не может заставить себя причинить физический вред."
	hardcore_value = 6
	mail_goodies = list(/obj/effect/spawner/random/decoration/flower, /obj/effect/spawner/random/contraband/cannabis) // flower power
