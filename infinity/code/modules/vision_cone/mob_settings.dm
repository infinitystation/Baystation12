/* Species */

/datum/species
	var/species_use_vision_cone = TRUE

/datum/species/nabber
	species_use_vision_cone = FALSE

/datum/species/diona
	species_use_vision_cone = FALSE

/* Mobs */
/mob
	var/obj/screen/vision_cone_overlay = null
	var/use_vision_cone = FALSE

/mob/living/silicon
	use_vision_cone = TRUE

/mob/living/silicon/ai
	use_vision_cone = FALSE

/mob/living/carbon/human
	use_vision_cone = FALSE

/mob/living/simple_animal/chicken
	use_vision_cone = FALSE

/mob/living/silicon/pai
	use_vision_cone = FALSE
