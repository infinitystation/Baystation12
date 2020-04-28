GLOBAL_DATUM_INIT(abductor, /datum/antagonist/abductors, new)
GLOBAL_DATUM_INIT(abductor_sci, /datum/antagonist/abductors_sci, new)

GLOBAL_LIST_INIT(agent_ship_names,     list("Alpha", "Beta", "Gamma"))
GLOBAL_LIST_INIT(scientist_ship_names, list("Alpha", "Beta", "Gamma"))

/datum/antagonist/abductors
	id = MODE_ABDUCTOR
	role_text = "Abductor Agent"
	role_text_plural = "Abductors"
	landmark_id = "abductor_agent"
	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_VOTABLE
	antaghud_indicator = "hudwizard"

	hard_cap = 1
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 2
	min_player_age = 18

	faction = "abductor"
	base_to_load = /datum/map_template/ruin/antag_spawn/abductors


/datum/antagonist/abductors/update_antag_mob(var/datum/mind/abductor)
	. = ..()

	abductor.current.real_name = "Mothership [GLOB.agent_ship_names[0]] Agent"

	GLOB.agent_ship_names.Remove(GLOB.agent_ship_names[0])

	abductor.current.SetName(abductor.current.real_name)


/datum/antagonist/abductors/equip(var/mob/living/carbon/human/abductor_mob)

	if(!..())
		return 0

	abductor_mob.set_species("Abductor Agent")

	var/outfit_type = pick(/decl/hierarchy/outfit/alien)
	var/decl/hierarchy/outfit/abductor_outfit = outfit_by_type(outfit_type)
	abductor_outfit.equip(abductor_mob)

	for(var/language in ALL_NON_ANTAG_LANGUAGES)
		abductor_mob.add_language(language, 0)

	return 1

/datum/antagonist/abductors_sci
	id = MODE_ABDUCTOR_SCI
	role_text = "Abductor Scientist"
	role_text_plural = "Abductors"
	landmark_id = "abductor_sci"
	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_VOTABLE
	antaghud_indicator = "hudwizard"

	hard_cap = 1
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 2
	min_player_age = 18

	faction = "abductor"


/datum/antagonist/abductors_sci/update_antag_mob(var/datum/mind/abductor)
	. = ..()

	abductor.current.real_name = "Mothership [GLOB.scientist_ship_names[0]] Scientist"
	GLOB.scientist_ship_names.Remove(GLOB.scientist_ship_names[0])

	abductor.current.SetName(abductor.current.real_name)


/datum/antagonist/abductors_sci/equip(var/mob/living/carbon/human/abductor_mob)

	if(!..())
		return 0

	abductor_mob.set_species("Abductor Scientist")

	var/outfit_type = pick(/decl/hierarchy/outfit/alien_sci)
	var/decl/hierarchy/outfit/abductor_outfit = outfit_by_type(outfit_type)
	abductor_outfit.equip(abductor_mob)
	var/obj/item/weapon/implant/abductors/imp = new
	imp.implant_in_mob(abductor_mob, BP_HEAD)

	for(var/language in ALL_NON_ANTAG_LANGUAGES)
		abductor_mob.add_language(language, 0)

	return 1