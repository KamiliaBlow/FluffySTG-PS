/datum/quirk/unblinking
	name = "Неморгание"
	desc = "По какой-то причине у вас нет век, и поэтому вы не можете моргать."
	icon = FA_ICON_FACE_FLUSHED
	value = 0
	gain_text = span_danger("Вы больше не чувствуете необходимости моргать.")
	lose_text = span_notice("Вы снова чувствуете необходимость моргать.")
	medical_record_text = "Пациент не способен моргать."
	mob_trait = TRAIT_NO_EYELIDS //Also prevents eye shutting in knockout state and death.

/datum/quirk/unblinking/add(client/client_source)
	. = ..()
	var/obj/item/organ/eyes/eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)
	if(isnull(eyes))
		return

	eyes.blink_animation = FALSE

	// interrupt the animations
	if(eyes.eyelid_left)
		animate(eyes.eyelid_left, alpha = 0, time = 0)
		QDEL_NULL(eyes.eyelid_left)
	if(eyes.eyelid_right)
		animate(eyes.eyelid_right, alpha = 0, time = 0)
		QDEL_NULL(eyes.eyelid_right)

/datum/quirk/unblinking/remove()
	. = ..()
	var/obj/item/organ/eyes/eyes = quirk_holder.get_organ_slot(ORGAN_SLOT_EYES)
	if(isnull(eyes))
		return

	eyes.blink_animation = TRUE
	eyes.eyelid_left = new(src, "[eyes.eye_icon_state]_l")
	eyes.eyelid_right = new(src, "[eyes.eye_icon_state]_r")
	quirk_holder.update_body()
