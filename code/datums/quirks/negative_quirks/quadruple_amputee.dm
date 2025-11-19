/datum/quirk/quadruple_amputee
	name = "Quadruple Amputee"
	desc = "Упс! Полное протезирование! В результате какого-то действительно жестокого космического наказания все ваши конечности были заменены на дешевые протезы."
	icon = "tg-prosthetic-full"
	value = -6
	medical_record_text = "При физическом осмотре у пациента были обнаружены протезы конечностей низкого качество."
	hardcore_value = 6
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_CHANGES_APPEARANCE
	mail_goodies = list(/obj/item/weldingtool/mini, /obj/item/stack/cable_coil/five)

/datum/quirk/quadruple_amputee/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.del_and_replace_bodypart(new /obj/item/bodypart/arm/left/robot/surplus, special = TRUE)
	human_holder.del_and_replace_bodypart(new /obj/item/bodypart/arm/right/robot/surplus, special = TRUE)
	human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/left/robot/surplus, special = TRUE)
	human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/right/robot/surplus, special = TRUE)

/datum/quirk/quadruple_amputee/post_add()
	to_chat(quirk_holder, span_bolddanger("Все ваши конечности были заменены дешевыми протезами. Они хрупкие и легко разваливаются под давлением. \
	Кроме того, для их ремонта необходимо использовать сварочный инструмент и кабели, а не пакеты с ледяными компрессами и мазь."))

/datum/quirk/quadruple_amputee/remove()
	if(QDELING(quirk_holder))
		return
	
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.reset_to_original_bodypart(BODY_ZONE_L_ARM)
	human_holder.reset_to_original_bodypart(BODY_ZONE_R_ARM)
	human_holder.reset_to_original_bodypart(BODY_ZONE_L_LEG)
	human_holder.reset_to_original_bodypart(BODY_ZONE_R_LEG)
