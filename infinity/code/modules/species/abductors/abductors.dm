/datum/species/abductor
	name = SPECIES_ABDUCTOR
	name_plural = "Abductor"
	icobase = 'infinity/icons/mob/human_races/species/abductor/body.dmi'
	deform =  'infinity/icons/mob/human_races/species/abductor/body.dmi'
	preview_icon = 'infinity/icons/mob/human_races/species/abductor/preview.dmi'
	default_h_style = "Bald"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch)

	override_organ_types = list(BP_EYES = /obj/item/organ/internal/eyes/abductor)

	hidden_from_codex = TRUE

	min_age = 10
	max_age = 60

	brute_mod = 0.75
	burn_mod =  0.75
	toxins_mod = 0

	cold_level_1 = 250 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	description = "Abductors are humanoid aliens, which wants only one thing. Experiment on other species."

	primitive_form = "Monkey"

	species_flags = SPECIES_FLAG_NO_SCAN
	appearance_flags = null

	spawn_flags = SPECIES_IS_RESTRICTED

	flesh_color = "#b9b9b9"
	blood_color = "#da37e7"

	genders = list(MALE)

	force_cultural_info = list(
		TAG_CULTURE =   CULTURE_ABDUCTOR_A,
		TAG_HOMEWORLD = HOME_SYSTEM_DEEP_SPACE,
		TAG_FACTION =   FACTION_ABDUCTOR,
		TAG_RELIGION =  RELIGION_OTHER
	)

/datum/species/abductor/scientist
	name = SPECIES_ABDUCTOR_SCI
	name_plural = "Abductor"

	brute_mod = 2.5
	burn_mod =  2.5
	toxins_mod = 0

	hidden_from_codex = TRUE

	min_age = 60
	max_age = 850

	force_cultural_info = list(
		TAG_CULTURE =   CULTURE_ABDUCTOR_S,
		TAG_HOMEWORLD = HOME_SYSTEM_DEEP_SPACE,
		TAG_FACTION =   FACTION_ABDUCTOR,
		TAG_RELIGION =  RELIGION_OTHER
	)
