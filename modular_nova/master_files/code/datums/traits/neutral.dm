// NOVA NEUTRAL TRAITS
/datum/quirk/excitable
	name = "Волнующе!"
	desc = "Когда вас поглаживают по голове, вы начинаете вилять хвостом! Вы такой возбудимый! ВИЛЯТЬ-ВИЛЯТЬ."
	gain_text = span_notice("Вам так хочется, чтобы вас погладили по голове!")
	lose_text = span_notice("Вам уже не так сильно нравятся поглаживания по голове.")
	medical_record_text = "Пациент, похоже, легко возбуждается."
	value = 0
	mob_trait = TRAIT_EXCITABLE
	icon = FA_ICON_LAUGH_BEAM

/datum/quirk/affectionaversion
	name = "Отвращение к ласке от киборгов"
	desc = "Вы не позволяете четвероногим киборгам лизать вас или тыкать в вас носом."
	gain_text = span_notice("Вы были внесены в реестры 'Не лизать' и 'Не тыкаться носом'.")
	lose_text = span_notice("Вы были исключены из списков 'Не лизать' и 'Не тыкаться носом'.")
	medical_record_text = "Пациент внесен в реестры 'Не лизать' и 'Не тыкаться носом'."
	value = 0
	mob_trait = TRAIT_AFFECTION_AVERSION
	icon = FA_ICON_CIRCLE_EXCLAMATION

/datum/quirk/personalspace
	name = "Личное пространство"
	desc = "Вы бы предпочли, чтобы люди не трогали вас за жопу."
	gain_text = span_notice("Вам бы понравилось, если бы люди не трогали вас за жопу.")
	lose_text = span_notice("Вас меньше беспокоит, когда люди трогают вас за жопу.")
	medical_record_text = "Пациент проявляет негативную реакцию на прикосновения к задней части тела."
	value = 0
	mob_trait = TRAIT_PERSONALSPACE
	icon = FA_ICON_HAND_PAPER

/datum/quirk/dnr
	name = "Невоскрешаемость"
	desc = "По какой бы то ни было причине вас невозможно воскресить никаким способом."
	gain_text = span_notice("Ваша душа становится слишком израненной, чтобы принять возрождение.")
	lose_text = span_notice("Вы снова чувствуете, как ваша душа исцеляется.")
	medical_record_text = "Пациент находится в состоянии НВ и не подлежит реанимации ни при каких обстоятельствах."
	value = 0
	mob_trait = TRAIT_DNR
	icon = FA_ICON_SKULL_CROSSBONES

/datum/quirk/dnr/add(client/client_source)
	. = ..()

	quirk_holder.update_dnr_hud()

/datum/quirk/dnr/remove()
	var/mob/living/old_holder = quirk_holder

	. = ..()

	old_holder.update_dnr_hud()

/mob/living/prepare_data_huds()
	. = ..()

	update_dnr_hud()

/// Adds the DNR HUD element if src has TRAIT_DNR. Removes it otherwise.
/mob/living/proc/update_dnr_hud()
	set_hud_image_state(DNR_HUD, "hud_dnr")
	if(HAS_TRAIT(src, TRAIT_DNR))
		set_hud_image_active(DNR_HUD)
	else
		set_hud_image_inactive(DNR_HUD)

/mob/living/carbon/human/examine(mob/user)
	. = ..()

	if(stat != DEAD && HAS_TRAIT(src, TRAIT_DNR) && (HAS_TRAIT(user, TRAIT_SECURITY_HUD) || HAS_TRAIT(user, TRAIT_MEDICAL_HUD)))
		. += "\n[span_boldwarning("This individual is unable to be revived, and may be permanently dead if allowed to die!")]"

/datum/atom_hud/data/human/dnr
	hud_icons = list(DNR_HUD)

// uncontrollable laughter
/datum/quirk/item_quirk/joker
	name = "Псевдобульбарный аффект"
	desc = "Время от времени вас охватывают неконтролируемые приступы смеха."
	value = 0
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_PROCESSES
	medical_record_text = "Пациент страдает от внезапных и неконтролируемых приступов смеха."
	var/pcooldown = 0
	var/pcooldown_time = 60 SECONDS
	icon = FA_ICON_GRIN_TEARS

/datum/quirk/item_quirk/joker/add_unique(client/client_source)
	give_item_to_holder(/obj/item/paper/joker, list(LOCATION_BACKPACK, LOCATION_HANDS))

/datum/quirk/item_quirk/joker/process()
	if(pcooldown > world.time)
		return
	pcooldown = world.time + pcooldown_time
	var/mob/living/carbon/human/user = quirk_holder
	if(user && istype(user))
		if(user.stat == CONSCIOUS)
			if(prob(20))
				user.emote("laugh")
				addtimer(CALLBACK(user, /mob/proc/emote, "laugh"), 5 SECONDS)
				addtimer(CALLBACK(user, /mob/proc/emote, "laugh"), 10 SECONDS)

/obj/item/paper/joker
	name = "удостоверение инвалидности"
	icon = 'modular_nova/master_files/icons/obj/card.dmi'
	icon_state = "joker"
	desc = "Улыбайтесь, даже если сердце болит."
	default_raw_text = "<i>\
			<div style='border-style:solid;text-align:center;border-width:5px;margin: 20px;margin-bottom:0px'>\
			<div style='margin-top:20px;margin-bottom:20px;font-size:150%;'>\
			Прости, что я смеюсь:<br>\
			У меня такое заболевание.\
			</div>\
			</div>\
			</i>\
			<br>\
			<center>\
			<b>\
			БОЛЬШЕ НА ОБОРОТЕ\
			</b>\
			</center>"
	/// Whether or not the card is currently flipped.
	var/flipped = FALSE
	/// The flipped version of default_raw_text.
	var/flipside_default_raw_text = "<i>\
			<div style='border-style:solid;text-align:center;border-width:5px;margin: 20px;margin-bottom:0px'>\
			<div style='margin-top:20px;margin-bottom:20px;font-size:100%;'>\
			<b>\
			Это заболевание, вызывающее внезапный,<br>\
			частый и неконтролируемый смех, который<br>\
			не соответствует вашему настроению.<br>\
			Это может наблюдаться у людей с черепно-мозговой травмой<br>\
			или при определенных неврологических заболеваниях.<br>\
			</b>\
			</div>\
			</div>\
			</i>\
			<br>\
			<center>\
			<b>\
			ПОЖАЛУЙСТА, ВЕРНИТЕ ЭТУ КАРТУ ВЛАДЕЛЬЦУ\
			</b>\
			</center>"
	/// Flipside version of raw_text_inputs.
	var/list/datum/paper_input/flipside_raw_text_inputs
	/// Flipside version of raw_stamp_data.
	var/list/datum/paper_stamp/flipside_raw_stamp_data
	/// Flipside version of raw_field_input_data.
	var/list/datum/paper_field/flipside_raw_field_input_data
	/// Flipside version of input_field_count
	var/flipside_input_field_count = 0


/obj/item/paper/joker/Initialize(mapload)
	. = ..()
	if(flipside_default_raw_text)
		add_flipside_raw_text(flipside_default_raw_text)


/**
 * This is an unironic copy-paste of add_raw_text(), meant to have the same functionalities, but for the flipside.
 *
 * This simple helper adds the supplied raw text to the flipside of the paper, appending to the end of any existing contents.
 *
 * This a God proc that does not care about paper max length and expects sanity checking beforehand if you want to respect it.
 *
 * The caller is expected to handle updating icons and appearance after adding text, to allow for more efficient batch adding loops.
 * * Arguments:
 * * text - The text to append to the paper.
 * * font - The font to use.
 * * color - The font color to use.
 * * bold - Whether this text should be rendered completely bold.
 */
/obj/item/paper/joker/proc/add_flipside_raw_text(text, font, color, bold)
	var/new_input_datum = new /datum/paper_input(
		text,
		font,
		color,
		bold,
	)

	flipside_input_field_count += get_input_field_count(text)

	LAZYADD(flipside_raw_text_inputs, new_input_datum)


/obj/item/paper/joker/update_icon()
	..()
	icon_state = "joker"

/obj/item/paper/joker/click_alt(mob/user)
	var/list/datum/paper_input/old_raw_text_inputs = raw_text_inputs
	var/list/datum/paper_stamp/old_raw_stamp_data = raw_stamp_data
	var/list/datum/paper_stamp/old_raw_field_input_data = raw_field_input_data
	var/old_input_field_count = input_field_count

	raw_text_inputs = flipside_raw_text_inputs
	raw_stamp_data = flipside_raw_stamp_data
	raw_field_input_data = flipside_raw_field_input_data
	input_field_count = flipside_input_field_count

	flipside_raw_text_inputs = old_raw_text_inputs
	flipside_raw_stamp_data = old_raw_stamp_data
	flipside_raw_field_input_data = old_raw_field_input_data
	flipside_input_field_count = old_input_field_count

	flipped = !flipped
	update_static_data()

	balloon_alert(user, "card flipped")
	return CLICK_ACTION_SUCCESS

/datum/quirk/feline_aspect
	name = "Кошачьи манеры"
	desc = "По каким-то причинам вы ведете себя как представитель кошачьих. Это заменит большинство других речевых особенностей, связанных с языком."
	gain_text = span_notice("Вы'мяу бы сейчас как раз не отказались бы от кошачьей мяты...")
	lose_text = span_notice("Вас уже не так привлекают лазеры.")
	medical_record_text = "Поведение пациента, судя по всему, очень напоминает поведение кошачьих."
	mob_trait = TRAIT_FELINE
	icon = FA_ICON_CAT

/datum/quirk/feline_aspect/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/cat/new_tongue = new(get_turf(human_holder))

	ADD_TRAIT(human_holder, TRAIT_WATER_HATER, QUIRK_TRAIT)

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/feline_aspect/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/new_tongue = new human_holder.dna.species.mutanttongue

	REMOVE_TRAIT(human_holder, TRAIT_WATER_HATER, QUIRK_TRAIT)

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/canine_aspect
	name = "Собачьи манеры"
	desc = "Гав! По какой-то причине вы ведете себя как представитель собачьих. Это заменит большинство других речевых особенностей, связанных с использованием языка."
	gain_text = span_notice("Га-.. Полоски бекона...")
	lose_text = span_notice("Вы меньше испытываете чувство покинутости.")
	mob_trait = TRAIT_CANINE
	icon = FA_ICON_DOG
	value = 0
	medical_record_text = "Было замечено, как пациент роется в мусорном ведре. Следите за ним."

/datum/quirk/canine_aspect/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/dog/new_tongue = new(get_turf(human_holder))

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/canine_aspect/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/new_tongue = new human_holder.dna.species.mutanttongue

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/avian_aspect
	name = "Птичьи манеры"
	desc = "Вы - птичий мозг или у вас мозг как у птицы. Это заменит большинство других речевых особенностей, связанных с языком."
	gain_text = span_notice("ВЯЯЯЯЯ ОСТАВЬТЕ ГАРНИТУУУУРУ В ПОКОЕЕ!")
	lose_text = span_notice("У вас меньше желания сидеть сложа руки.")
	mob_trait = TRAIT_AVIAN
	icon = FA_ICON_KIWI_BIRD
	value = 0
	medical_record_text = "У пациента наблюдаются манеры поведения, сходные с поведением птиц."

/datum/quirk/avian_aspect/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/avian/new_tongue = new(get_turf(human_holder))

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/avian_aspect/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/new_tongue = new human_holder.dna.species.mutanttongue

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

#define SEVERITY_STUN 1
#define SEVERITY_SNEEZE 2
#define SEVERITY_KNOCKDOWN 3
#define SEVERITY_BLEP 4

GLOBAL_LIST_INIT(possible_snout_sensitivities, list(
	"Stun" = SEVERITY_STUN,
	"Sneeze" = SEVERITY_SNEEZE, //Includes a stun
	"Collapse" = SEVERITY_KNOCKDOWN,
	"Blep" = SEVERITY_BLEP,
))

/datum/quirk/sensitivesnout
	name = "Чувствительный нос"
	desc = "У вас всегда была чувствительная кожа на лице, и когда кто-то тыкает вас в лицо, это действительно больно!"
	gain_text = span_notice("У вас ужасно чувствительная кожа на лице.")
	lose_text = span_notice("Теперь прикосновения к лицу вас не беспокоят.")
	medical_record_text = "Похоже, в кончике носа пациента находится скопление нервов, поэтому я не рекомендую прикасаться к нему напрямую."
	value = 0
	mob_trait = TRAIT_SENSITIVESNOUT
	icon = FA_ICON_FINGERPRINT
	var/severity = SEVERITY_KNOCKDOWN
	COOLDOWN_DECLARE(emote_cooldown)

/datum/quirk_constant_data/sensitive_snout
	associated_typepath = /datum/quirk/sensitivesnout
	customization_options = list(/datum/preference/choiced/snout_sensitivity)

/datum/quirk/sensitivesnout/add(client/client_source)
	var/desired_severity = GLOB.possible_snout_sensitivities[client_source?.prefs?.read_preference(/datum/preference/choiced/snout_sensitivity)]
	severity = isnum(desired_severity) ? desired_severity : 1

/datum/quirk/sensitivesnout/proc/get_booped(attacker)
	var/can_emote = FALSE
	if(COOLDOWN_FINISHED(src, emote_cooldown))
		can_emote = TRUE
		COOLDOWN_START(src, emote_cooldown, 5 SECONDS)
	if (ishuman(quirk_holder) && can_emote)
		var/mob/living/carbon/human/human_holder = quirk_holder
		human_holder.force_say()
	switch(severity)
		if(SEVERITY_STUN)
			to_chat(quirk_holder, span_warning("[attacker] слегка тыкает вас в ваш чувствительный нос, и вы замираете на месте!"))
			quirk_holder.Stun(1 SECONDS)
		if(SEVERITY_SNEEZE)
			quirk_holder.Stun(1 SECONDS)
			if(can_emote)
				to_chat(quirk_holder, span_warning("[attacker] тыкает вас в ваш чувствительный нос! Вы не можешь сдержать чих!"))
				quirk_holder.emote("sneeze")
		if(SEVERITY_KNOCKDOWN)
			to_chat(quirk_holder, span_warning("[attacker] тыкает вас в ваш чувствительный нос, и вы падаешь на землю!"))
			quirk_holder.Knockdown(1 SECONDS)
			quirk_holder.apply_damage(30, STAMINA)
		if(SEVERITY_BLEP)
			if(can_emote)
				to_chat(quirk_holder, span_warning("[attacker] тыкает вас в ваш чувствительный нос! Вы рефлекторно высовываете язык!"))
				quirk_holder.emote("blep")

#undef SEVERITY_STUN
#undef SEVERITY_SNEEZE
#undef SEVERITY_KNOCKDOWN
#undef SEVERITY_BLEP

/datum/quirk/overweight
	name = "Лишний вес"
	desc = "Вы весите больше, чем средний человек вашего роста, но к этому вы уже привыкли."
	gain_text = span_notice("Ваше тело кажется тяжёлым.")
	lose_text = span_notice("Вы вдруг почувствовали, что стали легче!")
	value = 0
	icon = FA_ICON_HAMBURGER // I'm very hungry. Give me the burger!
	medical_record_text = "Вес пациента превышает средний показатель."
	mob_trait = TRAIT_OFF_BALANCE_TACKLER

/datum/quirk/overweight/add(client/client_source)
	quirk_holder.add_movespeed_modifier(/datum/movespeed_modifier/overweight)

/datum/quirk/overweight/remove()
	quirk_holder.remove_movespeed_modifier(/datum/movespeed_modifier/overweight)

/datum/movespeed_modifier/overweight
	multiplicative_slowdown = 0.5 //Around that of a dufflebag, enough to be impactful but not debilitating.

/datum/mood_event/fat/add_effects(...)
	. = ..()
	if(HAS_TRAIT_FROM(owner, TRAIT_OFF_BALANCE_TACKLER, QUIRK_TRAIT))
		mood_change = 0 // They are probably used to it, no reason to be viscerally upset about it.
		description = "<b>У меня проблемы с весом.</b>"
