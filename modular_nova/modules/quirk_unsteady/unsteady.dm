/datum/quirk/unsteady
	name = "Неустойчивость"
	desc = "Вас легко сбить с ног, вы очень пугливы и часто падаете при получении травм."
	icon = FA_ICON_PERSON_FALLING_BURST
	value = 0 // much like death degradation, effects can be negated in configuration
	gain_text = span_danger("Вы чувствуете, что можете легко потерять равновесие.")
	lose_text = span_notice("Вы снова твёрдо стоите на ногах.")
	medical_record_text = "Пациент отличается крайней неустойчивостью и легко теряет равновесие под внешним воздействием."

	// the minimum amount of damage required to knockdown
	var/unsteady_damagethreshold = UNSTEADY_DEFAULT_DAMAGETHRESHOLD
	// chance to knockdown when hit over threshold
	var/unsteady_hurtchance = UNSTEADY_DEFAULT_DAMAGECHANCE
	// length of the knockdown
	var/unsteady_stunlength = UNSTEADY_DEFAULT_STUNLENGTH

/datum/quirk_constant_data/unsteady
	associated_typepath = /datum/quirk/unsteady
	customization_options = list(
		/datum/preference/numeric/unsteady/unsteady_damagethreshold,
		/datum/preference/numeric/unsteady/unsteady_hurtfactor,
		/datum/preference/numeric/unsteady/unsteady_stunlength,
	)

/datum/quirk/unsteady/add(client/client_source)
	RegisterSignal(quirk_holder, COMSIG_MOB_APPLY_DAMAGE, PROC_REF(ouchie))

	// update vars on preferences
	var/datum/preferences/client_preferences = client_source?.prefs

	if(!client_preferences)
		return

	unsteady_damagethreshold = client_preferences.read_preference(/datum/preference/numeric/unsteady/unsteady_damagethreshold)
	unsteady_hurtchance = client_preferences.read_preference(/datum/preference/numeric/unsteady/unsteady_hurtfactor)
	unsteady_stunlength = client_preferences.read_preference(/datum/preference/numeric/unsteady/unsteady_stunlength)

/datum/quirk/unsteady/remove()
	UnregisterSignal(quirk_holder, COMSIG_MOB_APPLY_DAMAGE)

/// Knockdown if all our conditions are met and display a combat message for it
/datum/quirk/unsteady/proc/ouchie(mob/living/carbon/source, damage, damagetype, def_zone, blocked, wound_bonus, exposed_wound_bonus, sharpness, attack_direction, attacking_item)
	SIGNAL_HANDLER

	if(damagetype != BRUTE)
		return
	if(damage < unsteady_damagethreshold)
		return
	if (!prob(unsteady_hurtchance))
		return

	//don't display the message if already downed
	if(!source.IsKnockdown())
		source.visible_message(
			span_warning("[source] в панике валится на пол!"),
			span_userdanger("Вы в панике валитесь на пол!"),
			vision_distance = COMBAT_MESSAGE_RANGE,
	)

	// get down on the floor, break it down
	source.Knockdown(unsteady_stunlength)
