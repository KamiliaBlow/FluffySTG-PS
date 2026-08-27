/datum/quirk/death_dnr_poll
	name = "Танаторенезия"
	desc = "Всякий раз, когда вы умираете и выбираете «Не реанимировать», ваше тело после воскрешения может перейти к другому призраку, который получит совершенно новую личность и новые воспоминания."
	icon = FA_ICON_ZAP
	value = 0
	medical_record_text = "У пациента танаторенезия: в случае смерти и последующей реанимации возможна потеря памяти или изменение личности."
	medical_symptom_text = "В случае смерти и последующей реанимации пациента возможна потеря памяти или смена личности."
	quirk_flags = QUIRK_NO_TRANSFER

	// Used the the spawners menu to describe the quirk
	var/you_are_text = "Вы - погибший член экипажа, страдающий танаторенезией - состоянием, которое меняет личность и вызывает потерю памяти при смерти и воскрешении."
	var/flavor_text = "Что-то ощущается... иначе. Вы не до конца понимаете, кто вы и что произошло - вы помните только своё имя и то, что здесь работаете. Ну что ж, лучше вернуться к делам: меньше всего вам хочется остаться и без работы, и без воспоминаний."
	var/important_text = "Приступайте к своим обязанностям. Если после смерти вы выберете «Не реанимировать», это тело сможет занять другой призрак. Вы по-прежнему участвуете в рандомизации антагонистов в середине раунда."

/datum/quirk/death_dnr_poll/add_unique(client/client_source)
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_LIVING_DNR, PROC_REF(mob_died))

/datum/quirk/death_dnr_poll/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_LIVING_DNR)

/datum/quirk/death_dnr_poll/proc/mob_died(mob/living/source, mob/dead/observer/dnring)
	SIGNAL_HANDLER

	var/whomst = source.real_name
	var/workable_job = (source.mind && !is_unassigned_job(source.mind.assigned_role))
	if(workable_job)
		whomst += "? Должность: [span_notice(source.mind.assigned_role.title)]"
	if(length(source.mind?.get_special_roles()))
		whomst += "[workable_job ? "," : "?"] Статус: [span_boldnotice(english_list(source.mind?.get_special_roles()))]"

	source.AddComponent(/datum/component/ghostrole_on_revive, \
		refuse_revival_if_failed = TRUE, \
		on_successful_revive = CALLBACK(src, PROC_REF(on_successful_revive)), \
		revive_title = whomst, \
		spawn_text = "Погибший член экипажа", \
		you_are_text = src.you_are_text, \
		flavor_text = src.flavor_text, \
		important_text = src.important_text, \
	)
	source.log_message("was made ghostrole pollable by [name] quirk.", LOG_GAME, color = COLOR_PURPLE)

/datum/quirk/death_dnr_poll/proc/on_successful_revive()
	quirk_holder.log_message("has had their body taken over by a ghost due to the [name] quirk.", LOG_GAME, color = COLOR_PURPLE)
	var/welcome_msg = boxed_message(span_notice("<b>[quirk_holder.real_name]</b> страдает <i>танаторенезией</i> - теперь это тело принадлежит вам.<br>\
		Если после смерти вы выберете <b>«Не реанимировать»</b>, другой призрак снова сможет захватить это тело."))
	addtimer(CALLBACK(src, GLOBAL_PROC_REF(to_chat), quirk_holder, welcome_msg), 2 SECONDS)
