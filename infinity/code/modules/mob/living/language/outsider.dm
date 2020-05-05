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

/datum/language/abductors
	name = LANGUAGE_ABDUCTORS
	desc = "Abductors have a telepathical link between them."
	speech_verb = "транслирует"
	ask_verb = "запрашивает"
	exclaim_verb = "транслирует"
	colour = "#90489c"
	key = "m"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"
