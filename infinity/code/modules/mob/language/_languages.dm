//Zapil yazikov ksenoti dlya vseh po prosbe kogototam
//Eto primitivnie versii osnovnih yazikov kotorie mozhet viuchit lyboy
//Razumeetsya znanie ne idealno, pismenniy yazik moshet i viydet ponyat
//A vot bistruyu ustnuyu rech - vryad li
//No zato kashdiy mog bi pochuchut ponimat ksenotu, ne s pervogo raza, no vse she

/decl/cultural_info/location/New()
	secondary_langs += list(LANGUAGE_SIIK_MAAS, LANGUAGE_RESOMI, LANGUAGE_UNATHI_SINTA, LANGUAGE_SKRELLIAN)
	..()

/datum/language/tajaran/primitive
	name = LANGUAGE_PTAJ
	desc = "Упрощенный Сиик'маас - именно так можно назвать то, что вы выучили. Конечно, \
	с письменностью гораздо легче, но и того что вы сможете выговорить уже достаточно чтобы выжить на Адомае."
	speech_verb = "мурчит"
	ask_verb = "вопросительно мурчит"
	exclaim_verb = "подвывает"
	shorthand = "PTJ"
	key = list("")
	flags = BAD_SPEAKER
	partial_understanding = list(LANGUAGE_SIIK_MAAS = 30, LANGUAGE_PTAJ = 15)

/datum/language/tajaran/primitive/can_be_spoken_properly_by(var/mob/speaker)
	var/mob/living/S = speaker
	if(!istype(S))
		return FALSE
	if(S.isSynthetic())
		return TRUE
	return FALSE

/datum/language/tajaran/primitive/muddle(var/message)
	message = replacetext(message, "s", "sh")
	message = replacetext(message, "S", "SH")
	message = replacetext(message, "с", "ш")
	message = replacetext(message, "С", "Ш")
	return message

/datum/language/resomi/primitive
	name = LANGUAGE_PRESOMI
	desc = "Упрощенный Счечи - именно так можно назвать то, что вы выучили. Конечно, с письменностью \
	гораздо легче, но и того что вы сможете выговорить уже достаточно чтобы выжить в резомьей среде."
	speech_verb = "свистит"
	ask_verb = "насвистывает"
	exclaim_verb = "просвистывает"
	shorthand = "PSCH"
	key = list("")//so shit but list it is necessary that key.length() = 1
	flags = BAD_SPEAKER
	partial_understanding = list(LANGUAGE_RESOMI = 30,LANGUAGE_PRESOMI = 15)

/datum/language/resomi/primitive/can_be_spoken_properly_by(var/mob/speaker)
	var/mob/living/S = speaker
	if(!istype(S))
		return FALSE
	if(S.isSynthetic())
		return TRUE
	return FALSE

/datum/language/resomi/primitive/muddle(var/message)
	message = replacetext(message, ",",    "")
	return message

/datum/language/unathi/primitive
	name = LANGUAGE_PUNATI
	desc = "Упрощенный Синта'унати! - именно так можно назвать то, что вы выучили. Конечно, с письменностью \
	гораздо легче, но и того что вы сможете выговорить уже достаточно чтобы выжить на Могесе."
	speech_verb = "шипит"
	ask_verb = "вопросительно шипит"
	exclaim_verb = "прерывисто шипит"
	shorthand = "PUT"
	key = list("")
	flags = BAD_SPEAKER
	partial_understanding = list(LANGUAGE_UNATHI_SINTA = 25, LANGUAGE_UNATHI_YEOSA = 25, LANGUAGE_PUNATI = 15)

/datum/language/skrell/primitive
	name = LANGUAGE_PSKRELLIAN
	desc = "Упрощенный Скрельский - именно так можно назвать то, что вы выучили. Конечно, с письменностью \
	гораздо легче ведь ее вы не учили, но и того что вы сможете выговорить уже достаточно чтобы выжить среди \
	Скреллов. Выучить хоть часть Скрелльского, особенно из-за цены импланта, который помог в этом."
	speech_verb = "подвывает"
	ask_verb = "воет"
	exclaim_verb = "навывает"
	shorthand = "PSK"
	key = list("")
	flags = BAD_SPEAKER
	partial_understanding = list(LANGUAGE_SKRELLIAN = 20, LANGUAGE_PSKRELLIAN = 10)

//tut idut tipa chtobi ksenosi ponimali primitivnie yaziki i tipa tebya, primitiva poimyt a ti ih ne och no i tebya tozhe

/datum/language/tajaran/New()
	..()
	partial_understanding += list(LANGUAGE_PTAJ = 45)

/datum/language/resomi/New()
	..()
	partial_understanding += list(LANGUAGE_PRESOMI = 45)

/datum/language/unathi/New()
	..()
	partial_understanding += list(LANGUAGE_PUNATI = 40)

/datum/language/yeosa/New()
	..()
	partial_understanding += list(LANGUAGE_PUNATI = 40)

/datum/language/skrell/New()
	..()
	partial_understanding += list(LANGUAGE_PSKRELLIAN = 35)
