/datum/quirk/hypersensitive
	name = "Гиперчувствительность"
	desc = "Как бы то ни было, кажется, что всё влияет на ваше настроение сильнее, чем следовало бы."
	icon = FA_ICON_FLUSHED
	value = -2
	gain_text = span_danger("Похоже, вы из всего делаете драму.")
	lose_text = span_notice("You don't seem to make a big deal out of everything anymore.")
	medical_record_text = "Пациент демонстрирует высокую эмоциональную нестабильность."
	medical_symptom_text = "Наблюдается усиление эмоциональных реакций на раздражители, \
		что приводит к значительному повышению чувствительности и реактивности в социальных ситуациях."
	hardcore_value = 3
	mail_goodies = list(/obj/effect/spawner/random/entertainment/plushie_delux)
	quirk_flags = QUIRK_TRAUMALIKE

/datum/quirk/hypersensitive/add(client/client_source)
	if (quirk_holder.mob_mood)
		quirk_holder.mob_mood.mood_modifier += 0.5

/datum/quirk/hypersensitive/remove()
	if (quirk_holder.mob_mood)
		quirk_holder.mob_mood.mood_modifier -= 0.5
