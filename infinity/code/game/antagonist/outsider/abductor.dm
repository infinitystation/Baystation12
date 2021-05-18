GLOBAL_DATUM_INIT(abductor,     /datum/antagonist/abductors, new)
GLOBAL_DATUM_INIT(abductor_sci, /datum/antagonist/abductors_sci, new)
GLOBAL_DATUM_INIT(abducted,     /datum/antagonist/abducted, new)

GLOBAL_LIST_INIT(agent_ship_names,     list("Alpha", "Beta", "Gamma"))
GLOBAL_LIST_INIT(scientist_ship_names, list("Alpha", "Beta", "Gamma"))

/datum/antagonist/abductors
	id = MODE_ABDUCTOR
	role_text = "Abductor Agent"
	role_text_plural = "Abductor Agents"
	landmark_id = "abductor_agent"
	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_VOTABLE
	antaghud_indicator = "hudwizard"

	welcome_text = "Вы - Похититель. Вы принадлежите высокотехнологичной расе пришельцев, что помешанна на экспериментах и каталогизировании всего живого. \
					Ваша задача - похищать разумных существ и доставлять их ученому, что бы тот проводил над ними эксперименты. Помните, все ваше оборудрование управляется ученым, так что кооперация с ним необходима.\
					Вы знаете как работает оборудование людей, но вам не рекомедуется использовать их оружие или вещи. В ином случае у вас могут быть проблемы с администрацией проекта."

	hard_cap = 2
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 1
	min_player_age = 18

	faction = "abductor"

	base_to_load = /datum/map_template/ruin/antag_spawn/abductors


/datum/antagonist/abductors/update_antag_mob(var/datum/mind/abductor)
	. = ..()

	abductor.current.real_name = "Mothership [GLOB.agent_ship_names[1]] Agent"
	GLOB.agent_ship_names.Remove(GLOB.agent_ship_names[1])

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

	abductor_mob.real_name = "Mothership [GLOB.agent_ship_names[1]] Agent"

	GLOB.agent_ship_names.Remove(GLOB.agent_ship_names[1])

	abductor_mob.SetName(abductor_mob.real_name)

	return 1

/datum/antagonist/abductors_sci
	id = MODE_ABDUCTOR_SCI
	role_text = "Abductor Scientist"
	role_text_plural = "Abductor Scientists"
	landmark_id = "abductor_sci"
	flags = ANTAG_OVERRIDE_JOB | ANTAG_OVERRIDE_MOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_VOTABLE
	antaghud_indicator = "hudwizard"

	welcome_text = "Вы - Похититель. Вы принадлежите высокотехнологичной расе пришельцев, что помешанна на экспериментах и каталогизировании всего живого. \
					Ваша задача - помогать Агенту в похищениях, наблюдая за ним через камеры и управляя его маскировкой через консоль. Эта роль командная и вам необходимо кооперироватся с агентом что бы успешно работать.\
					Вы знаете как работает оборудование людей, но вам не рекомедуется использовать их оружие или вещи. В ином случае у вас могут быть проблемы с администрацией проекта."

	hard_cap = 2
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 1
	min_player_age = 18

	faction = "abductor"


/datum/antagonist/abductors_sci/update_antag_mob(var/datum/mind/abductor)
	. = ..()

	abductor.current.real_name = "Mothership [GLOB.scientist_ship_names[1]] Scientist"
	GLOB.scientist_ship_names.Remove(GLOB.scientist_ship_names[1])

	abductor.current.SetName(abductor.current.real_name)


/datum/antagonist/abductors_sci/equip(var/mob/living/carbon/human/abductor_mob)

	if(!..())
		return 0

	abductor_mob.set_species("Abductor Scientist")

	var/outfit_type = pick(/decl/hierarchy/outfit/alien_sci)
	var/decl/hierarchy/outfit/abductor_outfit = outfit_by_type(outfit_type)
	abductor_outfit.equip(abductor_mob)
	var/obj/item/implant/abductors/imp = new
	imp.implant_in_mob(abductor_mob, BP_HEAD)

	for(var/language in ALL_NON_ANTAG_LANGUAGES)
		abductor_mob.add_language(language, 0)

	abductor_mob.real_name = "Mothership [GLOB.scientist_ship_names[1]] Scientist"

	abductor_mob.SetName(abductor_mob.real_name)

	return 1

/datum/antagonist/abducted
	id = MODE_ABDUCTED
	role_text = "Abducted"
	role_text_plural = "Abducted"

	hard_cap = 100 //There can be LOTS of them
	hard_cap_round = 100
	antaghud_indicator = "hudwizard"

	faction_role_text = "Abducted"
	faction_descriptor = "Mothership"
