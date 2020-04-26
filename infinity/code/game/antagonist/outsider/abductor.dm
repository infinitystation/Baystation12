GLOBAL_DATUM_INIT(abductor, /datum/antagonist/abductors, new)
GLOBAL_DATUM_INIT(abductor_sci, /datum/antagonist/abductors, new)

/datum/antagonist/abductors
	id = MODE_ABDUCTOR
	role_text = "Abductor"
	role_text_plural = "Abductors"
	landmark_id = "abductor_agent"
	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_VOTABLE
	antaghud_indicator = "hudwizard"

	hard_cap = 1
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 1
	min_player_age = 18

	faction = "abductor"
	base_to_load = /datum/map_template/ruin/antag_spawn/abductors

	var/caste_name = "Agent"


/datum/antagonist/abductors/update_antag_mob(var/datum/mind/abductor)
	. = ..()

	abductor.current.real_name = "Mothership Alpha [caste_name]"

	abductor.current.SetName(abductor.current.real_name)


/datum/antagonist/abductors/equip(var/mob/living/carbon/human/abductor_mob)

	if(!..())
		return 0

	abductor_mob.set_species("Abductor [caste_name]")

	var/outfit_type = pick(subtypesof(/decl/hierarchy/outfit/merchant))
	var/decl/hierarchy/outfit/wizard_outfit = outfit_by_type(outfit_type)
	wizard_outfit.equip(abductor_mob)

	return 1

/datum/antagonist/abductors/sci
	id = MODE_ABDUCTOR_SCI

	landmark_id = "abductor_sci"

	caste_name = "Scientist"

/datum/antagonist/abductors/sci/update_antag_mob(var/datum/mind/abductor_sci)
	. = ..()

	abductor_sci.current.real_name = "Mothership Alpha [caste_name]"

	abductor_sci.current.SetName(abductor_sci.current.real_name)

/datum/antagonist/abductors/sci/equip(var/mob/living/carbon/human/abductor_mob)

	if(!..())
		return 0

	abductor_mob.set_species("Abductor [caste_name]")

	var/outfit_type = pick(subtypesof(/decl/hierarchy/outfit/wizard))
	var/decl/hierarchy/outfit/wizard_outfit = outfit_by_type(outfit_type)
	wizard_outfit.equip(abductor_mob)

	return 1///obj/item/clothing/under/thermal/heat/abductor