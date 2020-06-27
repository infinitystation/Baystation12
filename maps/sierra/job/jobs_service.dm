/datum/job/chaplain
	title = "Chaplain"
	department = "Service"
	department_flag = SRV

	total_positions = 1
	spawn_positions = 1
	ideal_character_age = 40
	economic_power = 4
	minimal_player_age = 0
	supervisors = "Главой Персонала"
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/service/chaplain
	allowed_branches = list(/datum/mil_branch/civilian, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	min_skill = list(SKILL_BUREAUCRACY = SKILL_BASIC)

	access = list(access_chapel_office)
	minimal_access = list()

/datum/job/janitor
	title = "Janitor"
	department = "Service"
	department_flag = SRV

	total_positions = 2
	spawn_positions = 2
	supervisors = "Главой Персонала"
	ideal_character_age = 20
	alt_titles = list(
		"Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/service/janitor
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/civilian, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	min_skill = list(	SKILL_HAULING = SKILL_BASIC)

	access = list(access_maint_tunnels, access_emergency_storage, access_janitor)

	minimal_access = list()

/datum/job/chef
	title = "Chef"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "Главой Персонала"
	alt_titles = list(
		"Cook",
		"Culinary Specialist"
		)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/service/cook
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/civilian, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	min_skill = list(	SKILL_COOKING   = SKILL_ADEPT,
						SKILL_BOTANY    = SKILL_BASIC,
						SKILL_CHEMISTRY = SKILL_BASIC)

	access = list(access_maint_tunnels, access_hydroponics, access_kitchen, access_commissary)

	minimal_access = list()

/datum/job/bartender
	department = "Service"
	department_flag = SRV
	supervisors = "Главой Персонала"
	ideal_character_age = 30
	selection_color = "#515151"
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/service/bartender
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/civilian, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)

	access = list(access_hydroponics, access_bar, access_commissary)

	minimal_access = list()
	min_skill = list(	SKILL_COOKING   = SKILL_BASIC,
						SKILL_BOTANY    = SKILL_BASIC,
						SKILL_CHEMISTRY = SKILL_BASIC)

/datum/job/actor
	title = "Actor"
	total_positions = 2
	spawn_positions = 2
	department = "Service"
	department_flag = SRV
	supervisors = "Главой Персонала"
	ideal_character_age = 24
	selection_color = "#515151"
	minimal_player_age = 15
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/service/actor
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/civilian, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)

	access = list(access_actor)
