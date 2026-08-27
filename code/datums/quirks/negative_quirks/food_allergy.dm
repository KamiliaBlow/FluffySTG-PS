GLOBAL_LIST_INIT(possible_food_allergies, list(
	"Алкоголь" = ALCOHOL,
	"Насекомые" = BUGS,
	"Молочные продукты" = DAIRY,
	"Фрукты" = FRUIT,
	"Злаки" = GRAIN,
	"Мясо" = MEAT,
	"Орехи" = NUTS,
	"Морепродукты" = SEAFOOD,
	"Сахар" = SUGAR,
	"Овощи" = VEGETABLES,
))

/datum/quirk/item_quirk/food_allergic
	name = "Пищевая аллергия"
	desc = "С самого детства вы страдаете аллергией на определённые продукты."
	icon = FA_ICON_SHRIMP
	value = -2
	gain_text = span_danger("Вы чувствуете, как ваша иммунная система даёт сбой.")
	lose_text = span_notice("Вы чувствуете, как ваша иммунная система приходит в норму.")
	medical_record_text = "Иммунная система пациента бурно реагирует на определённые продукты питания."
	hardcore_value = 1
	quirk_flags = QUIRK_HUMAN_ONLY
	mail_goodies = list(/obj/item/reagent_containers/hypospray/medipen)
	/// Footype flags that will trigger the allergy
	var/target_foodtypes = NONE

/datum/quirk_constant_data/food_allergy
	associated_typepath = /datum/quirk/item_quirk/food_allergic
	customization_options = list(/datum/preference/choiced/food_allergy)

/datum/quirk/item_quirk/food_allergic/add(client/client_source)
	if(target_foodtypes != NONE) // Already set, don't care
		return

	var/desired_allergy = client_source?.prefs.read_preference(/datum/preference/choiced/food_allergy) || "Случайно"
	if(desired_allergy != "Случайно")
		target_foodtypes = GLOB.possible_food_allergies[desired_allergy]
		if(target_foodtypes != NONE) // Got a preference, don't care
			return

	target_foodtypes = pick(assoc_to_values(GLOB.possible_food_allergies))

/datum/quirk/item_quirk/food_allergic/add_unique(client/client_source)
	var/what_are_we_actually_killed_by = english_list(bitfield_to_list(target_foodtypes, FOOD_FLAGS_IC)) // This should never be more than one thing but just in case we can support it
	to_chat(client_source.mob, span_info("У вас аллергия на [what_are_we_actually_killed_by]. Следите за тем, что вы едите!"))

	var/obj/item/clothing/accessory/dogtag/allergy/dogtag = new(quirk_holder, what_are_we_actually_killed_by)
	give_item_to_holder(dogtag, list(LOCATION_BACKPACK, LOCATION_HANDS), flavour_text = "Всегда держите его при себе, особенно рядом с кухней.", notify_player = TRUE)
