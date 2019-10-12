//Zapil yazikov ksenoti dlya vseh po prosbe kogototam
//Eto primitivnie versii osnovnih yazikov kotorie mozhet viuchit lyboy
//Razumeetsya znanie ne idealno, pismenniy yazik moshet i viydet ponyat
//A vot bistruyu ustnuyu rech - vryad li
//No zato kashdiy mog bi pochuchut ponimat ksenotu, ne s pervogo raza, no vse she

/decl/cultural_info/location
	secondary_langs = list(LANGUAGE_PTAJ, LANGUAGE_PRESOMI, LANGUAGE_PUNATI, LANGUAGE_PSKRELLIAN)

/datum/language/tajprim
	name = LANGUAGE_PTAJ
	desc = "Упрощенный Сиик'маас - именно так можно назвать то, что вы выучили. Конечно, с письменностью гораздо легче, но и того что вы сможете выговорить уже достаточно для выживания на Адомае."
	speech_verb = "мурчит"
	ask_verb = "вопросительно мурчит"
	exclaim_verb = "подвывает"
	colour = "tajaran"
	syllables = list("mrr","rr","tajr","kir","raj","kii","mir","kra","ahk","nal","vah","khaz","jri","ran","darr",
	"mi","jri","dynh","manq","rhe","zar","rrhaz","kal","chur","eech","thaa","dra","jurl","mah","sanu","dra","ii'r",
	"ka","aasi","far","wa","baq","ara","qara","zir","sam","mak","hrar","nja","rir","khan","jun","dar","rik","kah",
	"hal","ket","jurl","mah","tul","cresh","azu","ragh","mro","mra","mrro","mrra")
	shorthand = "PTJ"
	partial_understanding = list(LANGUAGE_SIIK_MAAS = 30)

/datum/language/rezprim
	name = LANGUAGE_PRESOMI
	desc = "Упрощенный Счечи - именно так можно назвать то, что вы выучили. Конечно, с письменностью гораздо легче, но и того что вы сможете выговорить уже достаточно для выживания в резомьей среде."
	speech_verb = "�������"
	ask_verb = "������������"
	exclaim_verb = "������� � �������"
	colour = "alien"
	syllables = list(
			"ca", "ra", "ma", "sa", "na", "ta", "la", "sha", "scha", "a", "a",
			"ce", "re", "me", "se", "ne", "te", "le", "she", "sche", "e", "e",
			"ci", "ri", "mi", "si", "ni", "ti", "li", "shi", "schi", "i", "i"
		)
	shorthand = "PSCH"
	partial_understanding = list(LANGUAGE_RESOMI = 30)

/datum/language/unprim
	name = LANGUAGE_PUNATI
	desc = "Упрощенный язык унати - именно так можно назвать то, что вы выучили. Конечно, с письменностью гораздо легче, но и того что вы сможете выговорить уже достаточно для выживания на Могесе."
	speech_verb = "������ ������� �����"
	ask_verb = "����� �������������"
	exclaim_verb = "������ �����"
	colour = "soghun"
	syllables = list(
		"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz", "zs", "sz",
		"ha", "ah", "he", "eh", "hi", "ih", "ho", "oh", "hu", "uh", "hs", "sh",
		"la", "al", "le", "el", "li", "il", "lo", "ol", "lu", "ul", "ls", "sl",
		"ka", "ak", "ke", "ek", "ki", "ik", "ko", "ok", "ku", "uk", "ks", "sk",
		"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us", "ss", "ss",
		"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur", "rs", "sr",
		"a",  "a",  "e",  "e",  "i",  "i",  "o",  "o",  "u",  "u",  "s",  "s"
	)
	shorthand = "PUT"
	partial_understanding = list(LANGUAGE_UNATHI_SINTA = 25, LANGUAGE_UNATHI_YEOSA = 25)

/datum/language/skrellprim
	name = LANGUAGE_PSKRELLIAN
	desc = "Упрощенный Скрельский - именно так можно назвать то, что вы выучили. Конечно, с письменностью гораздо легче ведь ее вы не учили, но и того что вы сможете выговорить уже достаточно для выживания среди Скреллов. Выучить хоть часть этого языка было дорого, особенно из-за цены импланта, который помог в этом."
	speech_verb = "������ ��������� �����"
	ask_verb = "поет"
	exclaim_verb = "воет"
	colour = "skrell"
	syllables = list("qr","qrr","xuq","qil","quum","xuqm","vol","xrim","zaoo","qu-uu","qix","qoo","zix","*","!")
	shorthand = "PSK"
	partial_understanding = list(LANGUAGE_SKRELLIAN = 20)

//tut idut tipa chtobi ksenosi ponimali primitivnie yaziki i tipa tebya, primitiva poimyt a ti ih ne och no i tebya tozhe

/datum/language/tajaran/New()
	..()
	partial_understanding += list(/datum/language/tajprim = 45)

/datum/language/resomi/New()
	..()
	partial_understanding += list(/datum/language/rezprim = 45)

/datum/language/unathi/New()
	..()
	partial_understanding += list(/datum/language/unprim = 40)

/datum/language/yeosa/New()
	..()
	partial_understanding += list(/datum/language/unprim = 40)

/datum/language/skrell/New()
	..()
	partial_understanding += list(/datum/language/skrellprim = 35)
