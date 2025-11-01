/datum/quirk/cursed
	name = "Проклятый"
	desc = "Вы прокляты неудачей. Вы гораздо чаще подвергаетесь несчастным случаям и неприятностям. Когда дождь идет, то льет как из ведра."
	icon = FA_ICON_CLOUD_SHOWERS_HEAVY
	value = -8
	mob_trait = TRAIT_CURSED
	gain_text = span_danger("Вы чувствуете, что у вас будет плохой день.")
	lose_text = span_notice("Вы чувствуете, что у вас будет хороший день.")
	medical_record_text = "Пациент проклят невезением."
	hardcore_value = 8

/datum/quirk/cursed/add(client/client_source)
	quirk_holder.AddComponent(/datum/component/omen/quirk)
