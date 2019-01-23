/datum/job/senior_scientist
	title = "Senior Researcher"
	department = "Science"
	department_flag = SCI

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Research Director"
	selection_color = "#633d63"
	economic_power = 12
	minimal_player_age = 10
	ideal_character_age = 50
	alt_titles = list(
		"Research Supervisor")
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/senior_scientist
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)

	access = list(access_tox, access_tox_storage, access_research, access_mining, access_mining_office,
						access_mining_station, access_xenobiology, access_xenoarch, access_robotics,
						access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm)

	minimal_access = list()

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_ADEPT,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 30
	required_education = EDUCATION_TIER_DOCTORATE

/datum/job/scientist
	title = "Scientist"
	department = "Science"
	department_flag = SCI
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Research Director"
	economic_power = 10
	ideal_character_age = 45
	alt_titles = list(
		"Xenoarcheologist",
		"Anomalist",
		"Researcher",
		"Xenobiologist",
		"Xenobotanist",
		"Psychologist" = /decl/hierarchy/outfit/job/sierra/crew/research/scientist/psych)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/scientist
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)

	access = list(access_tox, access_tox_storage, access_research, access_petrov, access_petrov_helm,
						access_mining_office, access_mining_station, access_xenobiology, access_guppy_helm,
						access_xenoarch, access_expedition_shuttle, access_guppy, access_hangar)

	minimal_access = list()
	skill_points = 22
	required_education = EDUCATION_TIER_MASTERS

/datum/job/roboticist
	title = "Roboticist"
	department = "Science"
	department_flag = SCI

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Research Director"
	selection_color = "#633d63"
	economic_power = 6
	alt_titles = list(
		"Biomechanical Engineer",
		"Mechsuit Technician")
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/roboticist
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_COMPUTER		= SKILL_ADEPT,
	                    SKILL_MECH          = SKILL_ADEPT,
	                    SKILL_DEVICES		= SKILL_ADEPT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
						SKILL_COMPUTER	   = SKILL_MAX,
						SKILL_MECH		   = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_MEDICAL      = SKILL_MAX)

	access = list(access_robotics, access_research, access_tech_storage)

	minimal_access = list()
	required_education = EDUCATION_TIER_TRADE
	maximum_education = EDUCATION_TIER_DOCTORATE

/datum/job/scientist_assistant
	title = "Research Assistant"
	department = "Science"
	department_flag = SCI

	total_positions = 4
	spawn_positions = 4
	supervisors = "the Research Director and Science Personnel"
	selection_color = "#633d63"
	economic_power = 3
	ideal_character_age = 30
	alt_titles = list(
		"Testing Assistant" = /decl/hierarchy/outfit/job/sierra/crew/research/assist/testsubject,
		"Laboratory Technician",
		"Science Intern",
		"Clerk",
		"Field Assistant")

	max_skill = list(   SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)


	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/assist
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)

	access = list(access_research, access_mining_office, access_petrov, access_expedition_shuttle, access_guppy, access_hangar)

	minimal_access = list()
	required_education = EDUCATION_TIER_DROPOUT
	maximum_education = EDUCATION_TIER_BACHELOR
