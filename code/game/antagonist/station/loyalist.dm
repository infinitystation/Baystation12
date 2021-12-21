GLOBAL_DATUM_INIT(loyalists, /datum/antagonist/loyalists, new)

/datum/antagonist/loyalists
	id = MODE_LOYALIST
	role_text = "Head Loyalist"
	role_text_plural = "Loyalists"
	feedback_tag = "loyalist_objective"
	antag_indicator = "hud_loyal_head"
	victory_text = "Главы остались на своих должностях! Лоялисты победили!"
	loss_text = "Главы не смогли остановить революцию!"
	victory_feedback_tag = "Победа - главные заговорщики убиты"
	loss_feedback_tag = "Поражение - Главы убиты"
	antaghud_indicator = "hud_loyal"
	flags = 0

	hard_cap = 2
	hard_cap_round = 4
	initial_spawn_req = 2
	initial_spawn_target = 4

	// Inround loyalists.
	faction_role_text = "Loyalist"
	faction_descriptor = "COMPANY"
	faction_verb = /mob/living/proc/convert_to_loyalist
	faction_indicator = "hud_loyal"
	faction_invisible = 1
	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/submap)
	skill_setter = /datum/antag_skill_setter/station

	faction = MODE_LOYALIST
	ambitious = 0 //INF

/datum/antagonist/loyalists/Initialize()
	..()
	welcome_text = "Вы верны [GLOB.using_map.company_name] телом и душой. Защитите их интересы от заговорщиков среди экипажа."
	faction_welcome = "Защитите интересы [GLOB.using_map.company_short] от предателей-рецидивистов среди экипажа. Защитите Глав ценой собственной жизни."
	faction_descriptor = "[GLOB.using_map.company_name]"

/datum/antagonist/loyalists/create_global_objectives()
	if(!..())
		return

	var/objectives_count = round(count_living()/config.traitor_objectives_scaling) + 1

	global_objectives = list()
	for(var/mob/living/carbon/human/player in SSmobs.mob_list)
		if(!player.mind || player.stat==2 || !(player.mind.assigned_role in SSjobs.titles_by_department(COM)))
			continue
		var/datum/objective/protect/loyal_obj = new
		loyal_obj.target = player.mind
		loyal_obj.explanation_text = "Защитите [player.real_name], [player.mind.assigned_role]."
		global_objectives += loyal_obj

	for (var/count in 1 to objectives_count)
		var/datum/objective/anti_revolution/additional_objective = null
		switch (rand(1,100))
			if (1 to 45)
				additional_objective = new /datum/objective/anti_revolution/demote
			if (46 to 89)
				additional_objective = new /datum/objective/anti_revolution/brig
			if (90 to 100)
				additional_objective = new /datum/objective/anti_revolution/execute
		if (!additional_objective.find_target(global_objectives))
			qdel(additional_objective)
			continue
		global_objectives += additional_objective
