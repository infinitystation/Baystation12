/datum/species/resomi
	name = SPECIES_RESOMI
	name_plural = "Resomii"
	description = "A race of feathered raptors who developed on a cold world, almost \
	outside of the Goldilocks zone. Extremely fragile, they developed hunting skills \
	that emphasized taking out their prey without themselves getting hit. They are an \
	advanced culture on good terms with Skrellian and Human interests."

	min_age = 15
	max_age = 45
	health_hud_intensity = 3

	blood_color = "#d514f7"
	flesh_color = "#5f7bb0"
	base_color = "#001144"
	tail = "resomitail"
	tail_hair = "feathers"
	strength = STR_HIGH
	reagent_tag = IS_RESOMI
	breath_pressure = 12

	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw

	icobase = 			'infinity/icons/mob/human_races/species/resomi/body.dmi'
	deform = 			'infinity/icons/mob/human_races/species/resomi/body.dmi'
	damage_overlays = 	'infinity/icons/mob/human_races/species/resomi/damage_overlay.dmi'
	damage_mask = 		'infinity/icons/mob/human_races/species/resomi/damage_mask.dmi'
	blood_mask = 		'infinity/icons/mob/human_races/species/resomi/blood_mask.dmi'

	slowdown = -0.8 //speed fix?
	total_health = 150
	brute_mod = 1.35
	burn_mod =  1.35
	metabolism_mod = 2.0
	mob_size = MOB_SMALL
	holder_type = /obj/item/weapon/holder/human
	light_sensitive = 6
	gluttonous = GLUT_TINY
	blood_volume = 280
	hunger_factor = DEFAULT_HUNGER_FACTOR * 3

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_FBP_CHARGEN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	bump_flag = MONKEY
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

	cold_level_1 = 180
	cold_level_2 = 130
	cold_level_3 = 70
	heat_level_1 = 320
	heat_level_2 = 370
	heat_level_3 = 600
	heat_discomfort_level = 292
	heat_discomfort_strings = list(
		"Your feathers prickle in the heat.",
		"You feel uncomfortably warm.",
		)
	cold_discomfort_level = 180

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/resomi),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/resomi),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/resomi),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/resomi),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/resomi)
		)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver/resomi,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys/resomi,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
		)

	unarmed_types = list(
		/datum/unarmed_attack/bite/sharp,
		/datum/unarmed_attack/claws,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/stomp/weak
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/sonar_ping,
		/mob/living/proc/toggle_pass_table
		)

	descriptors = list(
		/datum/mob_descriptor/height = -8,
		/datum/mob_descriptor/build = -8
		)

	available_cultural_info = list(
		TAG_CULTURE =   list(
			CULTURE_RESOMI_NEWREFUGE,
			CULTURE_RESOMI_REFUGE,
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_TIAMATH,
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_VENUS,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_HELIOS,
			HOME_SYSTEM_TERSTEN,
			HOME_SYSTEM_AHDOMAI,
			HOME_SYSTEM_LORRIMAN,
			HOME_SYSTEM_CINU,
			HOME_SYSTEM_YUKLID,
			HOME_SYSTEM_LORDANIA,
			HOME_SYSTEM_KINGSTON,
			HOME_SYSTEM_GAIA,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_RESOMI_REFUGE,
			FACTION_NANOTRASEN,
			FACTION_FREETRADE,
			FACTION_HEPHAESTUS,
			FACTION_XYNERGY,
			FACTION_EXPEDITIONARY,
			FACTION_CORPORATE,
			FACTION_DAIS,
			FACTION_ZENG_HU,
			FACTION_WARD_TAKAHASHI,
			FACTION_GRAYSON,
			FACTION_AERTHER,
			FACTION_MAJOR_BILL,
			FACTION_FOCAL_POINT,
			FACTION_XION,
			FACTION_VEY_MED,
			FACTION_BISHOP,
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


/mob/living/proc/toggle_pass_table()
	set name = "Toggle Agility" //Dunno a better name for this. You have to be pretty agile to hop over stuff!!!
	set desc = "Allows you to start/stop hopping over things such as hydroponics trays, tables, and railings."
	set category = "IC"
	pass_flags ^= PASS_FLAG_TABLE //I dunno what this fancy ^= is but Aronai gave it to me.
	to_chat(src, "You [pass_flags&PASS_FLAG_TABLE ? "will" : "will NOT"] move over tables/railings/trays!")
