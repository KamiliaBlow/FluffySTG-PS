/datum/quirk/no_taste
	name = "Агевзия"
	desc = "Вы ничего не чувствуете! Но токсичная еда всё равно вас отравит."
	icon = FA_ICON_MEH_BLANK
	value = 0
	mob_trait = TRAIT_AGEUSIA
	gain_text = span_notice("У всего что вы едите нет вкуса!")
	lose_text = span_notice("Теперь вы чувствуете всю палитру вкусов различных вещей!")
	medical_record_text = "Пациент страдает агевзией и не может ощущать вкус пищи или реагентов."
	mail_goodies = list(/obj/effect/spawner/random/food_or_drink/condiment) // but can you taste the salt? CAN YOU?!
