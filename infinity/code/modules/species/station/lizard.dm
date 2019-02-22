/datum/species/unathi/erosan
	name = SPECIES_EROSAN
	name_plural = SPECIES_EROSAN
	icobase = 'infinity/icons/mob/human_races/species/erosan/body.dmi'
	deform = 'infinity/icons/mob/human_races/species/erosan/deformed_body.dmi'
	husk_icon = 'infinity/icons/mob/human_races/species/erosan/husk.dmi'
	preview_icon = 'infinity/icons/mob/human_races/species/erosan/preview.dmi'
	tail_animation = 'icons/mob/species/erosan/tail.dmi'
	limb_blend = ICON_MULTIPLY
	tail_blend = ICON_MULTIPLY

//we need to change almost all things below

	darksight_range = 3
	darksight_tint = DARKTINT_MODERATE
	gluttonous = GLUT_TINY
	strength = STR_HIGH
	slowdown = 0.5
	brute_mod = 0.8
	flash_mod = 1.2
	blood_volume = 800

	health_hud_intensity = 2
	hunger_factor = DEFAULT_HUNGER_FACTOR * 0.8

	min_age = 18
	max_age = 260

	description = "A heavily reptillian species, Unathi (or 'Sinta as they call themselves) hail from the \
	Uuosa-Eso system, which roughly translates to 'burning mother'.<br/><br/>Coming from a harsh, radioactive \
	desert planet, they mostly hold ideals of honesty, virtue, martial combat and bravery above all \
	else, frequently even their own lives. They prefer warmer temperatures than most species and \
	their native tongue is a heavy hissing laungage called Sinta'Unathi."

	override_limb_types = null //normal head

	base_auras = null //no fancy regeneration
	inherent_verbs = null //no fancy regeneration

	//humanlike height and build
	descriptors = list(
		/datum/mob_descriptor/height = 1.4,
		/datum/mob_descriptor/build = 1.2
		)

/datum/species/unathi/erosan/get_bodytype(var/mob/living/carbon/human/H)
	return SPECIES_EROSAN