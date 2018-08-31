/datum/species/machine
	name = SPECIES_IPC
	name_plural = "machines"

	description = "Positronic intelligence really took off in the 26th century, and it is not uncommon to see independant, free-willed \
	robots on many human stations, particularly in fringe systems where standards are slightly lax and public opinion less relevant \
	to corporate operations. IPCs (Integrated Positronic Chassis) are a loose category of self-willed robots with a humanoid form, \
	generally self-owned after being 'born' into servitude; they are reliable and dedicated workers, albeit more than slightly \
	inhuman in outlook and perspective."
	cyborg_noun = null

	preview_icon = 'icons/mob/human_races/species/ipc/preview.dmi'

	unarmed_types = list(/datum/unarmed_attack/punch)
	rarity_value = 2
	strength = STR_HIGH

	min_age = 1
	max_age = 90

	brute_mod = 1 // Because of the introduction of FBPs, IPCs are rebalanced back to 1.
	burn_mod = 1  //

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = SYNTH_COLD_LEVEL_1
	cold_level_2 = SYNTH_COLD_LEVEL_2
	cold_level_3 = SYNTH_COLD_LEVEL_3

	heat_level_1 = SYNTH_HEAT_LEVEL_1		// Gives them about 25 seconds in space before taking damage
	heat_level_2 = SYNTH_HEAT_LEVEL_2
	heat_level_3 = SYNTH_HEAT_LEVEL_3

	body_temperature = null
	passive_temp_gain = 5  // This should cause IPCs to stabilize at ~80 C in a 20 C environment.

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_LACE
	appearance_flags = HAS_UNDERWEAR | HAS_EYE_COLOR //IPCs can wear undies too :(

	blood_color = "#1f181f"
	flesh_color = "#575757"
	virus_immune = 1

	has_organ = list(
		BP_POSIBRAIN = /obj/item/organ/internal/posibrain,
		BP_OPTICS = /obj/item/organ/internal/eyes/optics
		)

	vision_organ = BP_OPTICS

	override_limb_types = list(BP_HEAD = /obj/item/organ/external/head/no_eyes)

	heat_discomfort_level = 373.15
	heat_discomfort_strings = list(
		"Your CPU temperature probes warn you that you are approaching critical heat levels!"
		)
	genders = list(NEUTER)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_POSITRONICS
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_ROOT,
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_VENUS,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_POSITRONICS,
			FACTION_SOL_CENTRAL,
			FACTION_TERRAN_CONFED,
			FACTION_NANOTRASEN,
			FACTION_FREETRADE,
			FACTION_XYNERGY,
			FACTION_EXPEDITIONARY,
			FACTION_OTHER
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_POSITRONICS,
		TAG_HOMEWORLD = HOME_SYSTEM_ROOT,
		TAG_FACTION = FACTION_POSITRONICS
	)

/datum/species/machine/handle_death(var/mob/living/carbon/human/H)
	..()
	if(istype(H.wear_mask,/obj/item/clothing/mask/monitor))
		var/obj/item/clothing/mask/monitor/M = H.wear_mask
		M.monitor_state_index = "blank"
		M.update_icon()

/datum/species/machine/post_organ_rejuvenate(var/obj/item/organ/org, var/mob/living/carbon/human/H)
	var/obj/item/organ/external/E = org
	if(istype(E) && !BP_IS_ROBOTIC(E))
		E.robotize("Morpheus")

/datum/species/machine/get_blood_name()
	return "oil"

/datum/species/machine/disfigure_msg(var/mob/living/carbon/human/H)
	var/datum/gender/T = gender_datums[H.get_gender()]
	return "<span class='danger'>[T.His] monitor is completely busted!</span>\n"

/datum/species/machine/terminator
	name = "Terminator"
	name_plural = "Terminators"
	description = "\[REDACTED\]"

	preview_icon = 		'icons/mob/human_races/species/terminator/preview.dmi'

	spawn_flags = SPECIES_IS_RESTRICTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_LACE

	unarmed_types = list(/datum/unarmed_attack/terminator)
	rarity_value = 20
	strength = STR_VHIGH
	brute_mod = 0.3
	burn_mod = 0.5
	flash_mod = 0
	siemens_coefficient = 0

	show_ssd = "laying inert, its activation glyph dark"
	death_sound = 'sound/effects/bang.ogg'
	death_message = "collapses to the ground with a CLUNK, and begins to beep ominously."

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/terminator),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/terminator),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/terminator),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/terminator),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/terminator),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/terminator),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/terminator),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/terminator),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/terminator),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/terminator),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/terminator)
		)

	heat_level_1 = 1500
	heat_level_2 = 2000
	heat_level_3 = 5000

	passive_temp_gain = 20

	has_organ = list(
		BP_POSIBRAIN = /obj/item/organ/internal/posibrain/terminator,
		BP_OPTICS = /obj/item/organ/internal/eyes/optics/terminator
		)

	heat_discomfort_level = 2000
	slowdown = 1

/datum/species/machine/terminator/handle_death(var/mob/living/carbon/human/H)
	..()
	playsound(H.loc, 'sound/items/countdown.ogg', 125, 1)
	spawn(15)
		explosion(H.loc, -1, 1, 3)
		H.gib()

/datum/species/machine/terminator/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(!BP_IS_ROBOTIC(E))
			E.robotize("Terminator")
	return