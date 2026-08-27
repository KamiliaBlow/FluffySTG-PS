/datum/quirk/item_quirk/mime_fan
	name = "Любитель мимов"
	desc = "Вы обожаете пантомимные выходки, а ношение значка мима поднимает вам настроение."
	icon = FA_ICON_THUMBTACK
	value = 2
	mob_trait = TRAIT_MIME_FAN
	gain_text = span_notice("Вы — большой поклонник мимов.")
	lose_text = span_danger("Мимы больше не кажутся такими уж замечательными.")
	medical_record_text = "Пациент заявляет о своей безграничной любви к мимам."
	mail_goodies = list(
		/obj/item/toy/crayon/mime,
		/obj/item/clothing/mask/gas/mime,
		/obj/item/storage/backpack/mime,
		/obj/item/clothing/under/rank/civilian/mime,
		/obj/item/reagent_containers/cup/glass/bottle/bottleofnothing,
		/obj/item/stamp/mime,
		/obj/item/storage/box/survival/hug/black,
		/obj/item/bedsheet/mime,
		/obj/item/clothing/shoes/sneakers/mime,
		/obj/item/toy/figure/mime,
		/obj/item/toy/crayon/spraycan/mimecan,
	)

/datum/quirk/item_quirk/mime_fan/add_unique(client/client_source)
	give_item_to_holder(/obj/item/clothing/accessory/mime_fan_pin, list(LOCATION_BACKPACK, LOCATION_HANDS))
