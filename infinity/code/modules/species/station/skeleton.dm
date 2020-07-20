/datum/species/skeleton
	name = SPECIES_SKELETON
	name_plural = "Skeletons"
	primitive_form = "Monkey"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	description = "A mystical species of skeletons."
	min_age = 17
	max_age = 89000
	hidden_from_codex = TRUE

	species_flags = SPECIES_FLAG_NO_MINOR_CUT | SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED
	appearance_flags = null

	spawn_flags = SPECIES_IS_RESTRICTED

	icobase = 'icons/mob/human_races/species/human/skeleton.dmi'
	deform = 'icons/mob/human_races/species/human/skeleton.dmi'

	cold_level_1 = -1 //Its a SPOOKY SCARY SKELETON
	cold_level_2 = 0
	cold_level_3 = 0

	radiation_mod = 0
	flash_mod =     0
	blood_oxy = 0

	warning_low_pressure = 50
	hazard_low_pressure = -1

	damage_overlays = null //no icons
	damage_mask =     null //no icons
	blood_mask =      null //no icons

	breath_type = null
	poison_types = null

	has_organ = list() //NO