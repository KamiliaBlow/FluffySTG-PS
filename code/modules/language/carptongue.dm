/datum/language/carptongue
	name = "Карповый"
	desc = "Различные рыбные звуки, которые могут иметь смысл для космических карпов."
	key = "c"
	icon_state = "fish"
	flags = NO_STUTTER|TONGUELESS_SPEECH
	sentence_chance = 0
	space_chance = 0
	between_word_sentence_chance = 0
	between_word_space_chance = 75
	additional_syllable_low = -2
	additional_syllable_high = -1
	syllables = list("glub", "blub", "bloop")
	default_priority = 25
	default_name_syllable_min = 1
	default_name_syllable_max = 2
