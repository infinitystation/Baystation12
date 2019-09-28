/datum/species/tajaran
	name = SPECIES_TAJARA
	name_plural = "Tajaran"
	icobase = 'infinity/icons/mob/human_races/species/tajara/body.dmi'
	deform =  'infinity/icons/mob/human_races/species/tajara/deformed_body.dmi'
	preview_icon = 'infinity/icons/mob/human_races/species/tajara/preview.dmi'
	tail = "tajtail"
	tail_animation = 'icons/mob/species/tajaran/tail.dmi'
	default_h_style = "Tajaran Ears"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp)

	darksight_range = 7
	darksight_tint = DARKTINT_GOOD
	slowdown = -0.5
	brute_mod = 1.15
	burn_mod =  1.15
	flash_mod = 1.5
	hunger_factor = DEFAULT_HUNGER_FACTOR * 1.5

	gluttonous = GLUT_TINY
	hidden_from_codex = FALSE
	health_hud_intensity = 1.75

	min_age = 19
	max_age = 140 //good medicine?

	description = "Таяра - гуманоидная раса, имеющая кошачьи черты. Происходят с холодной планеты Адомай \
	 в системе Замсиин-Ир, обладают теплым мехом и кошачьей грацией, позволяющей выживать в суровой  \
	среде родного мира. Их родной мир расположен к востоку от человеческих территорий. Взаимоотношения  \
	в обществе крайне сложны и запутаны, а политический строй являет собой парламентарную авторитарную демократию, \
	 что все объясняет ничего не объясняя. Почти все таяра живут на Адомае, а вне него бывают крайне редко. \
	 В последнее время происходит налаживание политических связей между Конфедеративным Содружеством Адомая \
	 и остальной галактикой, а Ледяной Занавес Адомая постепенно оттаивает, пропуская сквозь себя чужаков. \ 
	 Программы культурного обмена с другими расами позволяют как подготавливать опытных специалистов, \
	 так и понимать лучше тех, кто вокруг."

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80  //Default 120

	heat_level_1 = 330 //Default 360
	heat_level_2 = 380 //Default 400
	heat_level_3 = 800 //Default 1000

	heat_discomfort_level = 292
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)
	cold_discomfort_level = 230

	primitive_form = "Farwa"

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#afa59e"
	base_color = "#333333"
	blood_color = "#862a51"
	organs_icon = 'infinity/icons/mob/human_races/species/tajara/organs.dmi'
	reagent_tag = IS_TAJARA

	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw
/*
	base_auras = list(
		/obj/aura/speed/bio/tajaran
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/toggle_sprint
		)
*/
	sexybits_location = BP_GROIN

	available_cultural_info = list(
		TAG_CULTURE =   list(
			CULTURE_TAJARAN,
			CULTURE_HUMAN,
			CULTURE_HUMAN_MARTIAN,
			CULTURE_HUMAN_MARSTUN,
			CULTURE_HUMAN_LUNAPOOR,
			CULTURE_HUMAN_LUNARICH,
			CULTURE_HUMAN_VENUSIAN,
			CULTURE_HUMAN_VENUSLOW,
			CULTURE_HUMAN_BELTER,
			CULTURE_HUMAN_PLUTO,
			CULTURE_HUMAN_EARTH,
			CULTURE_HUMAN_CETI,
			CULTURE_HUMAN_SPACER,
			CULTURE_HUMAN_SPAFRO,
			CULTURE_HUMAN_OTHER
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_AHDOMAI,
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_VENUS,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_HELIOS,
			HOME_SYSTEM_TERSTEN,
			HOME_SYSTEM_LORRIMAN,
			HOME_SYSTEM_CINU,
			HOME_SYSTEM_YUKLID,
			HOME_SYSTEM_LORDANIA,
			HOME_SYSTEM_KINGSTON,
			HOME_SYSTEM_GAIA,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_TAJARAN_HADII,
			FACTION_TAJARAN_KAYTAM,
			FACTION_TAJARAN_KAYTAM_KSD,
			FACTION_TAJARAN_SHISHI,
			FACTION_TAJARAN_JAR,
			FACTION_TAJARAN_NAZKIIN,
			FACTION_TAJARAN_OTHER,
			FACTION_NANOTRASEN,
			FACTION_FREETRADE,
			FACTION_HEPHAESTUS,
			FACTION_XYNERGY,
			FACTION_EXPEDITIONARY,
			FACTION_PCRC,
			FACTION_CORPORATE,
			FACTION_DAIS,
			FACTION_ZENG_HU,
			FACTION_WARD_TAKAHASHI,
			FACTION_GRAYSON,
			FACTION_AERTHER,
			FACTION_SAARE,
			FACTION_MAJOR_BILL,
			FACTION_FOCAL_POINT,
			FACTION_XION,
			FACTION_VEY_MED,
			FACTION_BISHOP,
			FACTION_ZPCI,
			FACTION_SEPTENERGO,
			FACTION_OTHER
		),
		TAG_RELIGION =  list(
			RELIGION_SPIRITUALISM,
			RELIGION_JUDAISM,
			RELIGION_HINDUISM,
			RELIGION_BUDDHISM,
			RELIGION_ISLAM,
			RELIGION_CHRISTIANITY,
			RELIGION_AGNOSTICISM,
			RELIGION_DEISM,
			RELIGION_THELEMA,
			RELIGION_ATHEISM,
			RELIGION_OTHER
		)
	)

/datum/species/tajaran/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/tajblind(H),slot_glasses)
