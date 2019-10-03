#define LANGUAGE_SIIK_MAAS		"Siik'maas"
#define LANGUAGE_SIIK_TAJR		"Siik'tajr"
#define LANGUAGE_RESOMI			"Schechi"
#define LANGUAGE_XENOPHAGE      "Xenophage"
#define LANGUAGE_XENOPHAGE_HIVE "Hivemind"

//WOLF_SWARM-INF
/*
#define LANGUAGE_SWARM          "Swarm Audio Language"
#define LANGUAGE_SWARM_FAR      "Swarm Far Communicate Language"
*/

#define ANTAG_LANGUAGES 			list(LANGUAGE_CULT, LANGUAGE_ALIUM, LANGUAGE_OCCULT)

#define ALL_NON_ANTAG_LANGUAGES 	list(LANGUAGE_HUMAN_EURO, LANGUAGE_HUMAN_CHINESE, LANGUAGE_HUMAN_SELENIAN, LANGUAGE_HUMAN_ARABIC, LANGUAGE_HUMAN_INDIAN, LANGUAGE_HUMAN_IBERIAN, LANGUAGE_HUMAN_RUSSIAN, LANGUAGE_GUTTER, LANGUAGE_LEGALESE, LANGUAGE_SPACER, LANGUAGE_EAL, LANGUAGE_UNATHI_SINTA, LANGUAGE_UNATHI_YEOSA, LANGUAGE_SKRELLIAN, LANGUAGE_SIIK_MAAS, LANGUAGE_RESOMI, LANGUAGE_ROOTLOCAL, LANGUAGE_ADHERENT, LANGUAGE_VOX, LANGUAGE_NABBER)

#define HUMAN_LANGUAGES 			list(LANGUAGE_HUMAN_EURO, LANGUAGE_HUMAN_CHINESE, LANGUAGE_HUMAN_ARABIC, LANGUAGE_HUMAN_INDIAN, LANGUAGE_HUMAN_IBERIAN, LANGUAGE_HUMAN_RUSSIAN, LANGUAGE_GUTTER, LANGUAGE_SPACER)

#define HUMAN_LANGUAGES_FULL 		list(LANGUAGE_HUMAN_EURO, LANGUAGE_HUMAN_CHINESE,LANGUAGE_HUMAN_ARABIC, LANGUAGE_HUMAN_INDIAN, LANGUAGE_HUMAN_IBERIAN, LANGUAGE_HUMAN_RUSSIAN, LANGUAGE_GUTTER, LANGUAGE_SPACER, LANGUAGE_SIGN)

#define HUMAN_ADDITIONAL_LANGUAGES 	list(LANGUAGE_HUMAN_EURO, LANGUAGE_HUMAN_CHINESE, LANGUAGE_HUMAN_ARABIC, LANGUAGE_HUMAN_INDIAN, LANGUAGE_HUMAN_IBERIAN, LANGUAGE_HUMAN_RUSSIAN)

#define NON_HUMAN_LANGUAGES 		list(LANGUAGE_EAL, LANGUAGE_UNATHI, LANGUAGE_YEOSA, LANGUAGE_SKRELLIAN, LANGUAGE_SIIK_MAAS, LANGUAGE_RESOMI, LANGUAGE_ROOTLOCAL, LANGUAGE_ADHERENT, LANGUAGE_VOX, LANGUAGE_NABBER)

#define NON_SINT_LANGUAGES 			list(LANGUAGE_UNATHI, LANGUAGE_YEOSA, LANGUAGE_SKRELLIAN, LANGUAGE_SIIK_MAAS, LANGUAGE_RESOMI, LANGUAGE_ROOTLOCAL, LANGUAGE_ADHERENT, LANGUAGE_VOX,  LANGUAGE_NABBER)

#define SIGN_LANGUAGES 				list(LANGUAGE_SIGN, LANGUAGE_SIIK_TAJR)

#define LONG_RANGE_LANGUAGES 		list(LANGUAGE_ROOTGLOBAL, "Robot Talk")

//Zapil yazikov ksenoti dlya vseh po prosbe kogototam
//Eto primitivnie versii osnovnih yazikov kotorie mozhet viuchit lyboy
//Razumeetsya znanie ne idealno, pismenniy yazik moshet i viydet ponyat
//A vot bistruyu ustnuyu rech - vryad li
//No zato kashdiy mog bi pochuchut ponimat ksenotu, ne s pervogo raza, no vse she

#define LANGUAGE_PTAJ				"Primitive siik'maas"
#define LANGUAGE_PRESOMI			"Primitive schechi"
#define LANGUAGE_PUNATI			"Primitive sinta'unathi"
#define LANGUAGE_PSKRELLIAN		"Primitive skrellian"
#define LANGUAGE_PVOX				"Primitive vox"

/decl/cultural_info/location
	secondary_langs = list(LANGUAGE_PTAJ, LANGUAGE_PRESOMI, LANGUAGE_PUNATI, LANGUAGESKRELLIAN, LANGUAGE_PVOX)

/datum/language/tajprim
	name = LANGUAGE_PTAJ
	desc = "Упрощенный Сиик'маас - именно так можно назвать то, что вы выучили. Конечно, с письменностью гораздо легче, но и того что вы сможете выговорить уже достаточно для выживания на Адомае."
	speech_verb = "подмурчивает"
	ask_verb = "мявкает"
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
	speech_verb = "щебечет"
	ask_verb = "чирикает"
	exclaim_verb = "верещит"
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
	speech_verb = "шипит"
	ask_verb = "вопросительно шипит"
	exclaim_verb = "грозно шипит"
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
	speech_verb = "квакает"
	ask_verb = "варбл-варблает"
	exclaim_verb = "воет"
	colour = "skrell"
	syllables = list("qr","qrr","xuq","qil","quum","xuqm","vol","xrim","zaoo","qu-uu","qix","qoo","zix","*","!")
	shorthand = "PSK"
	partial_understanding = list(LANGUAGE_SKRELLIAN = 20)

/datum/language/voxprim
	name = LANGUAGE_PVOX
	desc = "Упрощенный воксиный - именно так можно назвать то, что вы выучили. Конечно, с письменностью гораздо легче, ведь ее нет."
	speech_verb = "гогочет"
	ask_verb = "кудахчет"
	exclaim_verb = "арет"
	colour = "vox"
	syllables = list("ti","ti","ti","hi","hi","ki","ki","ki","ki","ya","ta","ha","ka","ya","chi","cha","kah", \
	"SKRE","AHK","EHK","RAWK","KRA","AAA","EEE","KI","II","KRI","KA")
	shorthand = "PVox"
	partial_understanding = list(LANGUAGE_VOX = 25)

//tut idut tipa chtobi ksenosi ponimali primitivnie yaziki

/datum/language/tajaran
	partial_understanding = list(/datum/language/tajprim = 30)

/datum/language/resomi
	partial_understanding = list(/datum/language/rezprim = 30)

/datum/language/unathi
	partial_understanding = list(/datum/language/unprim = 25)

/datum/language/yeosa
	partial_understanding = list(/datum/language/unprim = 25)

/datum/language/skrell
	partial_understanding = list(/datum/language/skrellprim = 20)

/datum/language/vox
	partial_understanding = list(/datum/language/voxprim = 25)
