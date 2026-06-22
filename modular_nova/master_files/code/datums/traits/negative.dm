// NOVA NEGATIVE TRAITS

/datum/quirk/alexithymia
	name = "Алекситимия"
	desc = "Вы не можете точно оценить свои чувства."
	value = -4
	mob_trait = TRAIT_MOOD_NOEXAMINE
	medical_record_text = "Пациент не способен выражать свои эмоции."
	icon = FA_ICON_QUESTION_CIRCLE

/datum/quirk/fragile
	name = "Хрупкость"
	desc = "Вы чувствуете себя невероятно хрупким. Ожоги и синяки причиняют вам боль сильнее, чем обычному человеку!"
	value = -6
	medical_record_text = "Организм пациента адаптировался к низкой гравитации. К сожалению, условия низкой гравитации не способствуют развитию крепких костей."
	icon = FA_ICON_TIRED
	var/brute_mod
	var/burn_mod

/datum/quirk_constant_data/fragile
	associated_typepath = /datum/quirk/fragile
	customization_options = list(
		/datum/preference/numeric/fragile_customization/brute,
		/datum/preference/numeric/fragile_customization/burn,
	)

/datum/preference/numeric/fragile_customization
	abstract_type = /datum/preference/numeric/fragile_customization
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER

	minimum = 1.25
	maximum = 5 // 5x damage, arbitrary

	step = 0.01

/datum/preference/numeric/fragile_customization/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/datum/preference/numeric/fragile_customization/create_default_value()
	return 1.25

/datum/preference/numeric/fragile_customization/brute
	savefile_key = "fragile_brute"

/datum/preference/numeric/fragile_customization/burn
	savefile_key = "fragile_burn"

/datum/quirk/fragile/add_unique(client/client_source)
	var/mob/living/carbon/human/user = quirk_holder
	var/datum/preferences/prefs = client_source?.prefs
	brute_mod = prefs?.read_preference(/datum/preference/numeric/fragile_customization/brute) || 1.25
	burn_mod = prefs?.read_preference(/datum/preference/numeric/fragile_customization/burn) || 1.25

	user.physiology.brute_mod *= brute_mod
	user.physiology.burn_mod *= burn_mod

/datum/quirk/fragile/remove()
	. = ..()

	var/mob/living/carbon/human/user = quirk_holder
	user.physiology.brute_mod /= brute_mod
	user.physiology.burn_mod /= burn_mod

/datum/quirk/monophobia
	name = "Монофобия"
	desc = "Вы будете испытывать все большее стресса, когда находитесь в одиночестве, что вызовет панические реакции, от тошноты до сердечных приступов."
	value = -6
	gain_text = span_danger("Вы чувствуете себя очень одиноко...")
	lose_text = span_notice("Вы чувствуете, что одиночество, это не так уж и плохо.")
	medical_record_text = "Пациент чувствует себя плохо и испытывает стресс, когда находится вдали от других людей, что приводит к потенциально смертельному уровню стресса."
	icon = FA_ICON_PEOPLE_ARROWS_LEFT_RIGHT

/datum/quirk/monophobia/post_add()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user.gain_trauma(/datum/brain_trauma/severe/monophobia, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/monophobia/remove()
	. = ..()
	var/mob/living/carbon/human/user = quirk_holder
	user?.cure_trauma_type(/datum/brain_trauma/severe/monophobia, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/no_guns
	name = "Никаких пушек"
	desc = "По какой-то причине вы не можете использовать оружие. Причины могут быть разные, но решать вам."
	gain_text = span_notice("Вы чувствуете, что больше не сможете пользоваться оружием...")
	lose_text = span_notice("Вы вдруг чувствуете, что снова можете пользоваться оружием!")
	medical_record_text = "Пациент не может пользоваться огнестрельным оружием. Причина неизвестна."
	value = -6
	mob_trait = TRAIT_NOGUNS
	icon = FA_ICON_GUN
