/datum/quirk/hypersensitive
	name = "Hypersensitive"
	desc = "Как бы то ни было, все, кажется, влияет на ваше настроение больше, чем должно."
	icon = FA_ICON_FLUSHED
	value = -2
	gain_text = span_danger("Кажется, вы из всего делаете проблему.")
	lose_text = span_notice("Вы, похоже, больше не придаете чрезмерного значения всему.")
	medical_record_text = "Пациент демонстрирует высокий уровень эмоциональной нестабильности."
	hardcore_value = 3
	mail_goodies = list(/obj/effect/spawner/random/entertainment/plushie_delux)

/datum/quirk/hypersensitive/add(client/client_source)
	if (quirk_holder.mob_mood)
		quirk_holder.mob_mood.mood_modifier += 0.5

/datum/quirk/hypersensitive/remove()
	if (quirk_holder.mob_mood)
		quirk_holder.mob_mood.mood_modifier -= 0.5
