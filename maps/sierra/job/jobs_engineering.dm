/datum/job/senior_engineer
	title = "Senior Engineer"
	department = "Engineering"
	department_flag = ENG
	supervisors = "the Chief Engineer"
	selection_color = "#5b4d20"

	total_positions = 1
	spawn_positions = 1
	economic_power = 7
	minimal_player_age = 14
	ideal_character_age = 34

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/senior_engineer
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)

	skill_points = 24
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_ADEPT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
						SKILL_COMPUTER     = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)

	access = list(	access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			        access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
			        access_tcomsat, access_seneng, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)
	required_education = EDUCATION_TIER_TRADE
	maximum_education = EDUCATION_TIER_BACHELOR

/datum/job/engineer
	title = "Engineer"
	department = "Engineering"
	department_flag = ENG
	supervisors = "the Chief Engineer and the Senior Engineer"
	selection_color = "#5b4d20"

	total_positions = 4
	spawn_positions = 4
	minimal_player_age = 7
	ideal_character_age = 25
	economic_power = 6

	alt_titles = list(
		"Maintenance Technician" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints,
		"Structural Integrity Specialist" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints,
		"Electrician",
		"Reactor Technician" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints,,
		"Atmospheric Technician" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/atmos)

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)

	skill_points = 20
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_ADEPT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_COMPUTER	   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)


	access = list(	access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks,
			       	access_eva, access_tech_storage, access_atmospherics, access_janitor,
			        access_construction, access_hangar, access_emergency_storage)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)
	required_education = EDUCATION_TIER_TRADE
	maximum_education = EDUCATION_TIER_BACHELOR


/datum/job/engineer_trainee
	title = "Engineer Trainee"
	department = "Engineering"
	department_flag = ENG
	supervisors = "the Chief Engineer and Engineering Personnel"
	selection_color = "#5b4d20"

	total_positions = 2
	spawn_positions = 2
	ideal_character_age = 20
	economic_power = 3

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)

	no_skill_buffs = TRUE
	skill_points = 16
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_BASIC,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)

	access = list(		access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_eva, access_tech_storage, access_janitor, access_construction,
			            access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)
	required_education = EDUCATION_TIER_BASIC
	maximum_education = EDUCATION_TIER_TRADE

/datum/job/infsys
	title = "Information Technician"
	department = "Engineering"
	department_flag = ENG
	supervisors = "the Chief Engineer and the Senior Engineer"
	selection_color = "#5b4d20"

	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	ideal_character_age = 24
	economic_power = 6

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/tcomms
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)

	skill_points = 12
	min_skill = list(   SKILL_COMPUTER     = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_BASIC,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT)

	max_skill = list(   SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_COMPUTER	   = SKILL_MAX)

	access = list(	access_maint_tunnels, access_network,
			       	access_tech_storage, access_emergency_storage, access_tcomsat)
	minimal_access = list()

	required_education = EDUCATION_TIER_TRADE
	maximum_education = EDUCATION_TIER_BACHELOR
