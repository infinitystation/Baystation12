/datum/species/machine/terminator
	name = "Terminator"
	name_plural = "Terminators"
	description = "\[REDACTED\]"

	preview_icon = 		'infinity/icons/mob/human_races/species/terminator/preview.dmi'

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
