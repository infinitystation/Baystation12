/datum/species/bionic
	name = SPECIES_BIONIC
	name_plural = "bionic"

	blurb = "..."

	icobase = 'icons/mob/human_races/r_bionic.dmi'
	deform = 'icons/mob/human_races/r_bionic.dmi'

	eye_icon_location = 'icons/mob/infinity_human_face.dmi'
	eye_icon = "blank_eyes"

	language = LANGUAGE_EAL
	secondary_langs = list(LANGUAGE_SOL_COMMON, LANGUAGE_INDEPENDENT, LANGUAGE_SPACER, \
		LANGUAGE_LUNAR, LANGUAGE_SIGN)
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch)
	rarity_value = 2
	num_alternate_languages = 2
	strength = STR_HIGH
	name_language = LANGUAGE_EAL
	min_age = 30
	max_age = 200 
	brute_mod = 1.3 
	burn_mod = 1.3  
	slowdown = -0.8
	warning_low_pressure = -1 
	hazard_low_pressure = -1
	cold_level_1 = SYNTH_COLD_LEVEL_1
	cold_level_2 = SYNTH_COLD_LEVEL_2
	cold_level_3 = SYNTH_COLD_LEVEL_3
	heat_level_1 = SYNTH_HEAT_LEVEL_1
	heat_level_2 = SYNTH_HEAT_LEVEL_2
	heat_level_3 = SYNTH_HEAT_LEVEL_3
	body_temperature = null
	passive_temp_gain = -5  
	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_LACE
	appearance_flags = HAS_EYE_COLOR //IPCs can wear undies too :(
	blood_color = "#000000"
	flesh_color = "#000000"
	virus_immune = 1
	has_organ = list(
		BP_BRAIN =    /obj/item/organ/internal/brain,	
		BP_OPTICS = /obj/item/organ/internal/eyes/optics
		)
	vision_organ = BP_OPTICS
	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/no_eyes),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
	heat_discomfort_level = 600 
	genders = list(MALE)


/datum/species/bionic/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(E.robotic < ORGAN_ROBOT)
			E.robotize("Bionic")
	return
