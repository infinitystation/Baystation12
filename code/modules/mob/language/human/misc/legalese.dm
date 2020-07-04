/datum/language/legal
	name = LANGUAGE_LEGALESE
	desc = "A cryptic language used by interstellar bureaucrats and lawyers."
	speech_verb = "объявляет"
	exclaim_verb = "возражает"
	ask_verb = "запрашивает"
	space_chance = 100
	key = "u"
	partial_understanding = list(
		LANGUAGE_HUMAN_EURO = 10,
		LANGUAGE_HUMAN_SELENIAN = 25,
		LANGUAGE_SKRELLIAN = 5
	)
	syllables = list(
		"hitherto", "whereof", "hereunto", "deed", "hereinbefore", "whereas", "consensus", "nonwithstanding",
		"exonerated", "effecuate", "accord", "caveat", "stipulation", "pledgee", "covenant", "rights",
		"lawful", "suit of law", "sequestrator", "et al", "et", "ex", "quid", "bono",	"quo", "pro", "ad"
	)
	shorthand = "LGS"
