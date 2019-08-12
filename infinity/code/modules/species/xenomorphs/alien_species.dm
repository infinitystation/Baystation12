//Stand-in until this is made more lore-friendly.
/datum/species/xenos
	name = SPECIES_XENO
	name_plural = "Xenophages"

	unarmed_types = list(/datum/unarmed_attack/claws/strong, /datum/unarmed_attack/bite/strong)
	hud_type = /datum/hud_data/alien
	rarity_value = 3
	health_hud_intensity = 1

	slowdown = 0
	total_health = 100

	natural_armour_values = list(melee = 30, bullet = 28, laser = 25, energy = 0, bomb = 0, bio = 100, rad = 100)

	icon_template = 'infinity/icons/mob/human_races/species/xenophage/template.dmi'

	damage_overlays = null //no icons
	damage_mask =     null //no icons
	blood_mask =      null //no icons

	darksight_range = 8
	darksight_tint = DARKTINT_GREAT

	antaghud_offset_x = -16
	pixel_offset_x = -16
	has_fine_manipulation = 0
	siemens_coefficient = 0.25
	gluttonous = GLUT_ANYTHING
	stomach_capacity = MOB_MEDIUM

//	brute_mod =     0.75 // Hardened carapace.
//	burn_mod =      0.75 // ~~Weak to fire.~~ scratch that, we :original_character: now
	radiation_mod = 0    // No feasible way of curing radiation.
	flash_mod =     0    // Denied.
	stun_mod =      0.25  // Halved stun times.
	paralysis_mod = 0.25 // Quartered paralysis times.
	weaken_mod =    0    // Cannot be weakened.
	virus_immune = 1
	blood_oxy = 0

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED | SPECIES_FLAG_NO_TANGLE
	appearance_flags = HAS_EYE_COLOR | HAS_SKIN_COLOR

	spawn_flags = SPECIES_IS_RESTRICTED

	reagent_tag = IS_XENOS

	blood_color = "#05ee05"
	flesh_color = "#282846"
	base_color =  "#000000"

	gibbed_anim = "gibbed-a"
	dusted_anim = "dust-a"
	death_message = "lets out a waning guttural screech, green blood bubbling from its maw."
	death_sound = 'sound/voice/hiss6.ogg'

	speech_sounds = list('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
	speech_chance = 100

	breath_type = null
	poison_types = null

	vision_flags = SEE_SELF|SEE_MOBS

	has_organ = list(
		BP_EYES =     /obj/item/organ/internal/eyes/xeno,
		BP_HEART =    /obj/item/organ/internal/heart/open,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_BRAIN =    /obj/item/organ/internal/brain/xeno,
		BP_PLASMA =   /obj/item/organ/internal/xeno/plasmavessel,
		BP_HIVE =     /obj/item/organ/internal/xeno/hivenode,
		)

	move_intents = list(/decl/move_intent/walk)
	var/list/started_healing = list()
	var/accelerated_healing_threshold = 10 SECONDS

	has_limbs = list(
		"chest" =  list("path" = /obj/item/organ/external/chest/unbreakable/xeno),
		"groin" =  list("path" = /obj/item/organ/external/groin/unbreakable/xeno),
		"head" =   list("path" = /obj/item/organ/external/head/unbreakable/xeno),
		"l_arm" =  list("path" = /obj/item/organ/external/arm/unbreakable/xeno),
		"r_arm" =  list("path" = /obj/item/organ/external/arm/right/unbreakable/xeno),
		"l_leg" =  list("path" = /obj/item/organ/external/leg/unbreakable/xeno),
		"r_leg" =  list("path" = /obj/item/organ/external/leg/right/unbreakable/xeno),
		"l_hand" = list("path" = /obj/item/organ/external/hand/unbreakable/xeno),
		"r_hand" = list("path" = /obj/item/organ/external/hand/right/unbreakable/xeno),
		"l_foot" = list("path" = /obj/item/organ/external/foot/unbreakable/xeno),
		"r_foot" = list("path" = /obj/item/organ/external/foot/right/unbreakable/xeno)
		)

	bump_flag = ALIEN
	swap_flags = ~HEAVY
	push_flags = (~HEAVY) ^ ROBOT

	var/weeds_heal_rate = 1.5     // Health regen on weeds.
	var/weeds_plasma_rate = 5   // Plasma regen on weeds.

	genders = list(NEUTER)

	force_cultural_info = list(
		TAG_CULTURE =   CULTURE_XENOPHAGE_D,
		TAG_HOMEWORLD = HOME_SYSTEM_DEEP_SPACE,
		TAG_FACTION =   FACTION_XENOPHAGE,
		TAG_RELIGION =  RELIGION_OTHER
	)

	move_trail = /obj/effect/decal/cleanable/blood/tracks/claw

/datum/species/xenos/drone
	name = "Xenophage Drone"

//	brute_mod =     0.6
//	burn_mod =      0.6
	weeds_plasma_rate = 15
	slowdown = 0.5

	rarity_value = 5
	base_color = "#000d1a"
	icobase = 'infinity/icons/mob/human_races/species/xenophage/body_drone.dmi'
	deform =  'infinity/icons/mob/human_races/species/xenophage/body_drone.dmi'

	has_organ = list(
		BP_EYES =     /obj/item/organ/internal/eyes/xeno,
		BP_HEART =    /obj/item/organ/internal/heart/open,
		BP_BRAIN =    /obj/item/organ/internal/brain/xeno,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_PLASMA =   /obj/item/organ/internal/xeno/plasmavessel/queen,
		BP_ACID =     /obj/item/organ/internal/xeno/acidgland,
		BP_HIVE =     /obj/item/organ/internal/xeno/hivenode,
		BP_RESIN =    /obj/item/organ/internal/xeno/resinspinner,
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/plant,
		/mob/living/carbon/human/proc/transfer_plasma,
		/mob/living/carbon/human/proc/evolve,
		/mob/living/carbon/human/proc/resin,
		/mob/living/carbon/human/proc/corrosive_acid
		)
/*
/datum/species/xenos/drone/handle_post_spawn(var/mob/living/carbon/human/H)

	var/mob/living/carbon/human/A = H
	if(!istype(A))
		return ..()
	..()
*/
/datum/species/xenos/hunter

	name = "Xenophage Hunter"
	total_health = 150
//	base_color = "#001a33"

	icobase = 'infinity/icons/mob/human_races/species/xenophage/body_hunter.dmi'
	deform =  'infinity/icons/mob/human_races/species/xenophage/body_hunter.dmi'

//	brute_mod =     0.8
//	burn_mod =      0.8
//	weeds_plasma_rate = 10
//	slowdown = -0.5

	has_organ = list(
		BP_EYES =     /obj/item/organ/internal/eyes/xeno,
		BP_HEART =    /obj/item/organ/internal/heart/open,
		BP_BRAIN =    /obj/item/organ/internal/brain/xeno,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_PLASMA =   /obj/item/organ/internal/xeno/plasmavessel/hunter,
		BP_HIVE =     /obj/item/organ/internal/xeno/hivenode,
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/plant,
		/mob/living/carbon/human/proc/pry_open,
		/mob/living/carbon/human/proc/tackle,
		/mob/living/carbon/human/proc/leap,
		/mob/living/carbon/human/proc/psychic_whisper
		)

	force_cultural_info = list(
		TAG_CULTURE =   CULTURE_XENOPHAGE_H,
		TAG_HOMEWORLD = HOME_SYSTEM_DEEP_SPACE,
		TAG_FACTION =   FACTION_XENOPHAGE,
		TAG_RELIGION =  RELIGION_OTHER
	)


/datum/species/xenos/sentinel
	name = "Xenophage Sentinel"
	base_color = "#00284d"
	total_health = 220
	icobase = 'infinity/icons/mob/human_races/species/xenophage/body_sentinel.dmi'
	deform =  'infinity/icons/mob/human_races/species/xenophage/body_sentinel.dmi'

	weeds_plasma_rate = 15
	slowdown = 0.5

	has_organ = list(
		BP_EYES =     /obj/item/organ/internal/eyes/xeno,
		BP_HEART =    /obj/item/organ/internal/heart/open,
		BP_BRAIN =    /obj/item/organ/internal/brain/xeno,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_PLASMA =   /obj/item/organ/internal/xeno/plasmavessel/sentinel,
		BP_ACID =     /obj/item/organ/internal/xeno/acidgland,
		BP_HIVE =     /obj/item/organ/internal/xeno/hivenode,
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/plant,
		/mob/living/carbon/human/proc/pry_open,
		/mob/living/carbon/human/proc/tackle,
		/mob/living/carbon/human/proc/transfer_plasma,
		/mob/living/carbon/human/proc/corrosive_acid,
		/mob/living/carbon/human/proc/neurotoxin
		)

	force_cultural_info = list(
		TAG_CULTURE =   CULTURE_XENOPHAGE_S,
		TAG_HOMEWORLD = HOME_SYSTEM_DEEP_SPACE,
		TAG_FACTION =   FACTION_XENOPHAGE,
		TAG_RELIGION =  RELIGION_OTHER
	)

/datum/species/xenos/queen

	name = "Xenophage Queen"
	total_health = 300
	rarity_value = 10

//	brute_mod =     0.6
//	burn_mod =      0.6
	weeds_heal_rate = 2.5 //thicc
	weeds_plasma_rate = 20
	slowdown = 1

	icobase = 'infinity/icons/mob/human_races/species/xenophage/body_queen.dmi'
	deform =  'infinity/icons/mob/human_races/species/xenophage/body_queen.dmi'

	has_organ = list(
		BP_EYES =     /obj/item/organ/internal/eyes/xeno,
		BP_HEART =    /obj/item/organ/internal/heart/open,
		BP_BRAIN =    /obj/item/organ/internal/brain/xeno,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_EGG =      /obj/item/organ/internal/xeno/eggsac,
		BP_PLASMA =   /obj/item/organ/internal/xeno/plasmavessel/queen,
		BP_ACID =     /obj/item/organ/internal/xeno/acidgland,
		BP_HIVE =     /obj/item/organ/internal/xeno/hivenode,
		BP_RESIN =    /obj/item/organ/internal/xeno/resinspinner,
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/pry_open,
		/mob/living/carbon/human/proc/psychic_whisper,
		/mob/living/carbon/human/proc/lay_egg,
		/mob/living/carbon/human/proc/plant,
		/mob/living/carbon/human/proc/transfer_plasma,
		/mob/living/carbon/human/proc/corrosive_acid,
		/mob/living/carbon/human/proc/neurotoxin,
		/mob/living/carbon/human/proc/resin,
		/mob/living/carbon/human/proc/xeno_infest
		)

	genders = list(FEMALE)

	force_cultural_info = list(
		TAG_CULTURE =   CULTURE_XENOPHAGE_Q,
		TAG_HOMEWORLD = HOME_SYSTEM_DEEP_SPACE,
		TAG_FACTION =   FACTION_XENOPHAGE,
		TAG_RELIGION =  RELIGION_OTHER
	)