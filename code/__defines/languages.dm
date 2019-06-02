// Global
#define LANGUAGE_GALCOM         "Galactic Common"
#define LANGUAGE_SIGN           "Sign Language"

//Human
#define LANGUAGE_HUMAN_EURO      "Zurich Accord Common"
#define LANGUAGE_HUMAN_CHINESE   "Yangyu"
#define LANGUAGE_HUMAN_ARABIC    "Prototype Standard Arabic"
#define LANGUAGE_HUMAN_INDIAN    "New Dehlavi"
#define LANGUAGE_HUMAN_IBERIAN   "Iberian"
#define LANGUAGE_HUMAN_RUSSIAN   "Pan-Slavic"

//Human misc
#define LANGUAGE_GUTTER         "Gutter"
#define LANGUAGE_LEGALESE       "Legalese"
#define LANGUAGE_SPACER         "Spacer"

//Alien
#define LANGUAGE_EAL            "Encoded Audio Language"
#define LANGUAGE_UNATHI         "Sinta'unathi"
#define LANGUAGE_YEOSA          "Yeosa'unathi"
#define LANGUAGE_SKRELLIAN      "Skrellian"
#define LANGUAGE_SIIK_MAAS		"Siik'maas"
#define LANGUAGE_SIIK_TAJR		"Siik'tajr"
#define LANGUAGE_RESOMI			"Schechi"
#define LANGUAGE_ROOTLOCAL      "Local Rootspeak"
#define LANGUAGE_ROOTGLOBAL     "Global Rootspeak"
#define LANGUAGE_ADHERENT       "Protocol"
#define LANGUAGE_VOX            "Vox-pidgin"
#define LANGUAGE_NABBER         "Serpentid"

//Antag
#define LANGUAGE_XENOPHAGE      "Xenophage"
#define LANGUAGE_XENOPHAGE_HIVE "Hivemind"
#define LANGUAGE_CULT           "Cult"
#define LANGUAGE_ALIUM          "Alium"
#define LANGUAGE_OCCULT         "Occult"

// Language flags.
#define WHITELISTED  1   // Language is available if the speaker is whitelisted.
#define RESTRICTED   2   // Language can only be acquired by spawning or an admin.
#define NONVERBAL    4   // Language has a significant non-verbal component. Speech is garbled without line-of-sight.
#define SIGNLANG     8   // Language is completely non-verbal. Speech is displayed through emotes for those who can understand.
#define HIVEMIND     16  // Broadcast to all mobs with this language.
#define NONGLOBAL    32  // Do not add to general languages list.
#define INNATE       64  // All mobs can be assumed to speak and understand this language. (audible emotes)
#define NO_TALK_MSG  128 // Do not show the "\The [speaker] talks into \the [radio]" message
#define NO_STUTTER   256 // No stuttering, slurring, or other speech problems
#define ALT_TRANSMIT 512 // Language is not based on vision or sound (Todo: add this into the say code and use it for the rootspeak languages)

//WOLF_SWARM-INF
/*
#define LANGUAGE_SWARM          "Swarm Audio Language"
#define LANGUAGE_SWARM_FAR      "Swarm Far Communicate Language"
*/

#define ANTAG_LANGUAGES list(LANGUAGE_XENOPHAGE, LANGUAGE_CULT, LANGUAGE_ALIUM, LANGUAGE_OCCULT)

#define ALL_NON_ANTAG_LANGUAGES list(LANGUAGE_GALCOM, LANGUAGE_HUMAN_EURO, LANGUAGE_HUMAN_CHINESE, LANGUAGE_HUMAN_ARABIC, LANGUAGE_HUMAN_INDIAN, LANGUAGE_HUMAN_IBERIAN, LANGUAGE_HUMAN_RUSSIAN,LANGUAGE_GUTTER, LANGUAGE_LEGALESE, LANGUAGE_SPACER, LANGUAGE_EAL, LANGUAGE_UNATHI, LANGUAGE_YEOSA, LANGUAGE_SKRELLIAN, LANGUAGE_SIIK_MAAS, LANGUAGE_SIIK_TAJR, LANGUAGE_RESOMI, LANGUAGE_ROOTLOCAL, LANGUAGE_ADHERENT,LANGUAGE_VOX, LANGUAGE_NABBER)

#define HUMAN_LANGUAGES list(LANGUAGE_GALCOM, LANGUAGE_HUMAN_EURO, LANGUAGE_HUMAN_CHINESE, LANGUAGE_HUMAN_ARABIC, LANGUAGE_HUMAN_INDIAN, LANGUAGE_HUMAN_IBERIAN, LANGUAGE_HUMAN_RUSSIAN, LANGUAGE_GUTTER, LANGUAGE_SPACER)

#define NON_HUMAN_LANGUAGES list(LANGUAGE_EAL, LANGUAGE_UNATHI, LANGUAGE_YEOSA, LANGUAGE_SKRELLIAN, LANGUAGE_SIIK_MAAS, LANGUAGE_RESOMI, LANGUAGE_ROOTLOCAL, LANGUAGE_ADHERENT, LANGUAGE_VOX, LANGUAGE_NABBER)

#define NON_SINT_LANGUAGES list(LANGUAGE_UNATHI, LANGUAGE_YEOSA, LANGUAGE_SKRELLIAN, LANGUAGE_SIIK_MAAS, LANGUAGE_RESOMI, LANGUAGE_ROOTLOCAL, LANGUAGE_ADHERENT, LANGUAGE_VOX,  LANGUAGE_NABBER)

#define SIGN_LANGUAGES list(LANGUAGE_SIGN, LANGUAGE_SIIK_TAJR)

#define LONG_RANGE_LANGUAGES list(LANGUAGE_ROOTGLOBAL, LANGUAGE_XENOPHAGE_HIVE, "Robot Talk")