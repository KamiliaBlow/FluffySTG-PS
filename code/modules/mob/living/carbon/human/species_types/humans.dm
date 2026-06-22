/datum/species/human
	name = "\improper Human"
	id = SPECIES_HUMAN
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
	)
	skinned_type = /obj/item/stack/sheet/animalhide/carbon/human
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1.1

/datum/species/human/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_haircolor("#bb9966", update = FALSE) // brown
	human.set_hairstyle("Business Hair", update = TRUE)

/datum/species/human/get_scream_sound(mob/living/carbon/human/human)
	if(human.physique == MALE)
		if(prob(1))
			return 'sound/mobs/humanoids/human/scream/wilhelm_scream.ogg'
		return pick(
			'sound/mobs/humanoids/human/scream/malescream_1.ogg',
			'sound/mobs/humanoids/human/scream/malescream_2.ogg',
			'sound/mobs/humanoids/human/scream/malescream_3.ogg',
			'sound/mobs/humanoids/human/scream/malescream_4.ogg',
			'sound/mobs/humanoids/human/scream/malescream_5.ogg',
			'sound/mobs/humanoids/human/scream/malescream_6.ogg',
		)

	return pick(
		'sound/mobs/humanoids/human/scream/femalescream_1.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_2.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_3.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_4.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_5.ogg',
	)

/datum/species/human/get_cough_sound(mob/living/carbon/human/human)
	if(human.gender == FEMALE) // NOVA EDIT CHANGE - ORIGINAL: if(human.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)

/datum/species/human/get_cry_sound(mob/living/carbon/human/human)
	if(human.gender == FEMALE) // NOVA EDIT CHANGE - ORIGINAL: if(human.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/human/get_sneeze_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'

/datum/species/human/get_laugh_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/laugh/womanlaugh.ogg'
	return pick(
		'sound/mobs/humanoids/human/laugh/manlaugh1.ogg',
		'sound/mobs/humanoids/human/laugh/manlaugh2.ogg',
	)

/datum/species/human/get_sigh_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/human/get_sniff_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/human/get_snore_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return SFX_SNORE_FEMALE
	return SFX_SNORE_MALE

/datum/species/human/get_hiss_sound(mob/living/carbon/human/human)
	return 'sound/mobs/humanoids/human/hiss/human_hiss.ogg'

/datum/species/human/get_species_description()
	return "Люди - доминирующий вид в известной галактике. \
		Их вид распространяется от Старой Земли до самых пределов известного космоса."

/datum/species/human/get_species_lore()
	return list(
		"Эти существа, происходящие от приматов и родом с в основном безвредной Земли, \
        уже давно переросли рамки своей родной планеты и статус полублагоприятных существ. \
		Эра космоса вывела человечество за пределы Солнечной системы и открыла ему просторы всей Галактики.",

		"Как это свойственно людям, этот почти рекордный темп продвижения от суши к последнему рубежу стал \
        настоящим ударом по самолюбию других рас, с которыми они теперь делили одну арену. \
		В том числе и ящерицы - если кто-то и был оскорблён этими выскочками, то это, безусловно, был ящеричий род.",

		"Человечеству так и не удалось обрести такой мир, который позволил бы ему полностью объединиться под одним знаменем, как это сделали другие виды. \
		Бумажная волокита, характерная для бюрократов ООН, находит своё продолжение в мозаике под названием TerraGov \
		- совокупности национальных государств, которые по-прежнему существуют в человеческом обществе.",

		"Человеческий дух стремления к новым возможностям и предпринимательства продолжает процветать в своей высшей форме: \
        гиперкорпорации. Действуя вне сферы влияния TerraGov - как в прямом, так и в переносном смысле, \
        гиперкорпорации покупают необходимые им голоса в сенате и закрепляют за собой территории, находящиеся далеко за пределами досягаемости Земного правительства. \
		На территории гиперкорпорации политика компании - это закон, что придает новый смысл понятию \"увольнение сотрудника\".",
	)

/datum/species/human/create_pref_unique_perks()
	var/list/to_add = list()

	if(CONFIG_GET(number/default_laws) == 0 || CONFIG_GET(flag/silicon_asimov_superiority_override)) // Default lawset is set to Asimov
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "robot",
			SPECIES_PERK_NAME = "Превосходство Азимова",
			SPECIES_PERK_DESC = "ИИ и их киборги по умолчанию подчиняются только \
                людям. Как люди, кремниевые обязаны и защищать вас, и подчиняться вам.",
		))

	var/human_authority_setting = CONFIG_GET(string/human_authority)

	if(human_authority_setting == HUMAN_AUTHORITY_NON_HUMAN_WHITELIST || human_authority_setting == HUMAN_AUTHORITY_ENFORCED)
		to_add += list(list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "bullhorn",
			SPECIES_PERK_NAME = "Структура подчинения",
			SPECIES_PERK_DESC = "Nanotrasen допускает к командным должностям, таким как капитан, только людей.",
		))

	return to_add
