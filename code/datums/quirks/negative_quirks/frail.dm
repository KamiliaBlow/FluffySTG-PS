/datum/quirk/frail
	name = "Frail"
	desc = "Ваша кожа словно бумага, а кости как стекло! Вы гораздо проще, чем большинство, получаете раны."
	icon = FA_ICON_SKULL
	value = -6
	mob_trait = TRAIT_EASILY_WOUNDED
	gain_text = span_danger("Вы чувствуете себя крайне хрупко.")
	lose_text = span_notice("Вы снова чувствуете крепкость своего тела.")
	medical_record_text = "Пациент чрезвычайно легко получает травмы. Пожалуйста, примите все необходимые меры, чтобы избежать возможных исков о халатности."
	hardcore_value = 4
	mail_goodies = list(/obj/effect/spawner/random/medical/minor_healing)
