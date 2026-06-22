/datum/quirk/touchy
	name = "Touchy"
	desc = "Вы очень тактичны и должны физически прикоснуться к чему-либо, чтобы его осмотреть."
	icon = FA_ICON_HAND
	value = -2
	gain_text = span_danger("Вы чувствуете, что не можете рассматривать вещи со стороны.")
	lose_text = span_notice("Вы чувствуете, что можете рассматривать вещи со стороны.")
	medical_record_text = "Пациент не может различать предметы на расстоянии."
	hardcore_value = 4

/datum/quirk/touchy/add(client/client_source)
	RegisterSignal(quirk_holder, COMSIG_CLICK_SHIFT, PROC_REF(examinate_check))

/datum/quirk/touchy/remove()
	UnregisterSignal(quirk_holder, COMSIG_CLICK_SHIFT)

///Checks if the mob is besides the  thing being examined, if they aren't then we cancel their examinate.
/datum/quirk/touchy/proc/examinate_check(mob/examiner, atom/examined)
	SIGNAL_HANDLER

	if(!examined.Adjacent(examiner))
		return COMSIG_MOB_CANCEL_CLICKON
