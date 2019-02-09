#define AUTOHISS_NUM 3


/mob/living/proc/handle_autohiss(message, datum/language/L)
	return message // no autohiss at this level

/mob/living/carbon/human/handle_autohiss(message, datum/language/L)
	if(!client || get_preference_value(/datum/client_preference/autohiss) == GLOB.PREF_OFF) // no need to process if there's no client or they have autohiss off
		return message
	return species.handle_autohiss(message, L, get_preference_value(/datum/client_preference/autohiss))

/datum/species
	var/list/autohiss_basic_map = null
	var/list/autohiss_extra_map = null
	var/list/autohiss_exempt = null

/datum/species/unathi
	autohiss_basic_map = list(
			"s" = list("ss", "sss", "ssss"),

			"ñ" = list("ñ", "ññ", "ñññ"),

			"Ñ" = list("Ñ", "Ññ", "Ñññ")
		)
	autohiss_extra_map = list(
			"x" = list("ks", "kss", "ksss"),

			"ê" = list("õ"),

			"ã" = list("õ"),

			"ç" = list("ñ", "ññ", "ñññ"),

			"÷" = list("ù", "ùù", "ùùù"),

			"æ" = list("ø", "øø", "øøø"),

			"Ê" = list("Õ"),

			"Ã" = list("Õ"),

			"Ç" = list("Ñ", "Ññ", "Ñññ"),

			"×" = list("Ù", "Ùù", "Ùùù"),

			"Æ" = list("Ø", "Øø", "Øøø")

		)
	autohiss_exempt = list(
					LANGUAGE_UNATHI,
					LANGUAGE_YEOSA
	)

/datum/species/tajaran
	autohiss_basic_map = list(
			"r" = list("rr", "rrr", "rrrr"),

			"ğ" = list("ğğ", "ğğğ", "ğğğğ"),

			"Ğ" = list("Ğğ", "Ğğğ", "Ğğğğ")
		)
	autohiss_exempt = list(LANGUAGE_SIIK_MAAS)

/datum/species/resomi
	autohiss_basic_map = list(
			"ç" = list("ñ", "ññ", "ñññ"),

			"Ç" = list("Ñ", "Ññ", "Ñññ")
		)
	autohiss_extra_map = list(
			"÷" = list("ù", "ùù"),

			"æ" = list("ø", "øø", "øøø"),

			"×" = list("Ù", "Ùù"),

			"Æ" = list("Ø", "Øø", "Øøø")
		)
	autohiss_exempt = list(LANGUAGE_RESOMI)

/datum/species/proc/handle_autohiss(message, datum/language/lang, mode)
	if(!autohiss_basic_map)
		return message
	if(lang.flags & NO_STUTTER)	// Currently prevents EAL, Sign language, and emotes from autohissing
		return message
	if(autohiss_exempt && (lang.name in autohiss_exempt))
		return message

	var/map = autohiss_basic_map.Copy()
	if(mode == GLOB.PREF_FULL && autohiss_extra_map)
		map |= autohiss_extra_map

	. = list()

	while(length(message))
		var/min_index = 10000 // if the message is longer than this, the autohiss is the least of your problems
		var/min_char = null
		for(var/char in map)
			var/i = findtext(message, char)
			if(!i) // no more of this character anywhere in the string, don't even bother searching next time
				map -= char
			else if(i < min_index)
				min_index = i
				min_char = char
		if(!min_char) // we didn't find any of the mapping characters
			. += message
			break
		. += copytext(message, 1, min_index)
		if(copytext(message, min_index, min_index+1) == ruppertext(min_char))
			switch(text2ascii(message, min_index+1))
				if(65 to 90) // A-Z, uppercase; uppercase R/S followed by another uppercase letter, uppercase the entire replacement string
					. += ruppertext(pick(map[min_char]))
				else
					. += capitalize(pick(map[min_char]))
		else
			. += pick(map[min_char])
		message = copytext(message, min_index + 1)

	return jointext(., null)