/datum/quirk/friendly
	name = "Дружелюбие"
	desc = "Вы лучше всех обнимаетесь, особенно когда у вас подходящее настроение."
	icon = FA_ICON_HANDS_HELPING
	value = 2
	mob_trait = TRAIT_FRIENDLY
	gain_text = span_notice("Вам хочется кого-нибудь обнять.")
	lose_text = span_danger("Вы больше не чувствуете непреодолимого желания обнимать других.")
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_MOODLET_BASED
	medical_record_text = "Пациент демонстрирует отсутствие стеснения при физическом контакте и отлично развитые руки. Прошу другого врача взять этот случай на себя."
	mail_goodies = list(/obj/item/storage/box/hug)

/datum/quirk/friendly/add_unique(client/client_source)
	var/mob/living/carbon/human/human_quirkholder = quirk_holder
	var/obj/item/organ/heart/holder_heart = human_quirkholder.get_organ_slot(ORGAN_SLOT_HEART)
	if(isnull(holder_heart) || isnull(holder_heart.reagents))
		return
	holder_heart.reagents.maximum_volume = 20
	// We have a bigger heart full of love!
	holder_heart.reagents.add_reagent(/datum/reagent/love, 2.5)
	// Like, physically bigger.
	holder_heart.reagents.add_reagent(/datum/reagent/consumable/nutriment/organ_tissue, 5)
	holder_heart.transform = holder_heart.transform.Scale(1.5)
	holder_heart.beat_noise += ". Оно излучает любовное тепло" // wuv is a detectable diagnostic quality
