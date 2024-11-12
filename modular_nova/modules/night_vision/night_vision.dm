/datum/quirk/night_vision
	name = "Ночное зрение"
	desc = "Вы видите в полной темноте чуть более четко, чем большинство людей."
	icon = FA_ICON_MOON
	value = 4
	mob_trait = TRAIT_NIGHT_VISION
	gain_text = span_notice("Тени кажутся чуть менее темными.")
	lose_text = span_danger("Все кажется немного темнее.")
	medical_record_text = "Глаза пациента демонстрируют акклиматизацию к темноте выше среднего."
	mail_goodies = list(
		/obj/item/flashlight/flashdark,
		/obj/item/food/grown/mushroom/glowshroom/shadowshroom,
		/obj/item/skillchip/light_remover,
	)

/datum/quirk/night_vision/add(client/client_source)
	refresh_quirk_holder_eyes()

/datum/quirk/night_vision/remove()
	refresh_quirk_holder_eyes()

/datum/quirk/night_vision/proc/refresh_quirk_holder_eyes()
	var/mob/living/carbon/human/human_quirk_holder = quirk_holder
	var/obj/item/organ/internal/eyes/eyes = human_quirk_holder.get_organ_by_type(/obj/item/organ/internal/eyes)
	if(!eyes)
		return
	// We've either added or removed TRAIT_NIGHT_VISION before calling this proc. Just refresh the eyes.
	eyes.refresh()
