//Swarm Language

/*/datum/language/swarm
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
	shorthand = "N/A"*/

/datum/language/xenocommon
	name = LANGUAGE_XENOPHAGE
	colour = "alien"
	desc = "The common tongue of the xenophages."
	speech_verb = "шипит"
	ask_verb = "шипит"
	exclaim_verb = "шипит"
	key = "i"
	flags = RESTRICTED
	syllables = list("sss","sSs","SSS")
	machine_understands = 0
	shorthand = "Xeno"

/datum/language/xenos
	name = LANGUAGE_XENOPHAGE_HIVE
	desc = "Xenophages have the strange ability to commune over a psychic hivemind."
	speech_verb = "шипит"
	ask_verb = "шипит"
	exclaim_verb = "шипит"
	colour = "alien"
	key = "a"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"

/datum/language/xenos/check_special_condition(var/mob/other)

	var/mob/living/carbon/M = other
	if(!istype(M))
		return 1
	if(locate(/obj/item/organ/internal/xeno/hivenode) in M.internal_organs)
		return 1

	return 0
