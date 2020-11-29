/datum/job/assistant
	title = "Crewman"
	total_positions = 12
	spawn_positions = 12
	department = "Civilian"
	department_flag = CIV
	supervisors = "Главой Персонала"
	selection_color = "#515151"
//	economic_power = 6
	announced = FALSE
	alt_titles = list(
		"Journalist" = /decl/hierarchy/outfit/job/sierra/passenger/passenger/journalist,
		"Historian",
		"Botanist",
		"Naturalist",
		"Ecologist",
		"Sociologist",
		"Off-Duty",
		"Trainer"
		)
	outfit_type = /decl/hierarchy/outfit/job/sierra/passenger/passenger
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor, /datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/nt
	)

/datum/job/assistant/get_description_blurb()
	return "Вы - Матрос... Или, по крайней мере, одна из его подпрофессий. От Вас не ждут серьезного участия в раунде. \
	Вы можете спокойно исследовать судно и попытаться найти себе занятие, или же посидеть в баре, пока Вас не \
	позовут помочь с чёрной работой. Проявите креативность в своих подпрофессиях - например, журналисту следует \
	искать сенсационные события, такие как незаконный арест охраны, изобретение нового супероружия в РНД или \
	грубое нарушение техники безопасности... А возможно, даже попроситься в экспедицию."

/datum/job/cyborg
	total_positions = 3
	spawn_positions = 3
	supervisors = "установленными Вам законами"

/*
/datum/job/stowaway
	title = "Stowaway"
	department = "Civilian"
	department_flag = CIV

	total_positions = 2
	spawn_positions = 2
	selection_color = "#515151"
	ideal_character_age = 30
	minimal_player_age = 7
	create_record = 0
	account_allowed = 0
	outfit_type = /decl/hierarchy/outfit/job/sierra/stowaway
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	latejoin_at_spawnpoints = 1
	announced = FALSE

	access = list(access_maint_tunnels, access_emergency_storage)
	minimal_access = list()
*/
