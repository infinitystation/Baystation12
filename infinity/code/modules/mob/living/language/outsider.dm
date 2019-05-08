//Swarm Language

/datum/language/swarm
	name = LANGUAGE_SWARM
	colour = "adherent"
	desc = "—в€зь ближнего действи€"
	speech_verb = "транслирует"
	ask_verb = "транслирует"
	exclaim_verb = "транслирует"
	key = "t"
	flags = RESTRICTED
	machine_understands = 0
	syllables = list("шипит", "свистит", "скрежет")
	shorthand = "Swarm"

/datum/language/swarm_far
	name = LANGUAGE_SWARM_FAR
	desc = "Ѕлюспэйс подключение к общей сети уль€ и разделЄнное на €чейки"
	speech_verb = "транслирует"
	ask_verb = "транслирует"
	exclaim_verb = "транслирует"
	colour = "adherent"
	key = "z"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"