/datum/job/senior_engineer
	title = "Senior Engineer"
	department = "Engineering"
	department_flag = ENG
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Engineer"
	selection_color = "#5b4d20"
	economic_power = 7
	minimal_player_age = 14
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/senior_engineer
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
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
	skill_points = 24

	access = list(	access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			        access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
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

/datum/job/senior_engineer/get_description_blurb()
	return "You are the Senior Engineer. You are a veteran SNCO. You are subordinate to the Chief Engineer though you may have many years more experience than them and your subordinates are the rest of engineering. You should be an expert in practically every engineering area and familiar and possess leadership skills. Coordinate the team and ensure the smooth running of the department along with the Chief Engineer."

/datum/job/engineer
	title = "Engineer"
	department = "Engineering"
	department_flag = ENG

	total_positions = 4
	spawn_positions = 4
	supervisors = "the Chief Engineer"
	minimal_player_age = 7
	selection_color = "#5b4d20"
	alt_titles = list(
		"Maintenance Technician" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints,
		"Structural Integrity Specialist" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints,
		"Electrician",
		"Information Systems Technician" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/tcomms,
		"Reactor Technician" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints,,
		"Atmospheric Technician" = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/atmos)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	economic_power = 6
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
	skill_points = 20

	access = list(	access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks,
			       	access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor,
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

/datum/job/engineer/get_description_blurb()
	return "You are an Engineer. You operate under one of many titles and may be highly specialised in a specific area of engineering. You probably have at least a general familiarity with most other areas though this is not expected. You are subordinate to the Senior Engineer and the Chief Engineer and are expected to follow them."

/datum/job/engineer_trainee
	title = "Engineer Trainee"
	department = "Engineering"
	department_flag = ENG

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Engineer and Engineering Personnel"
	selection_color = "#5b4d20"
	ideal_character_age = 20
	economic_power = 3

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer/maints
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	skill_points = 16
	no_skill_buffs = TRUE

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

/datum/job/engineer_trainee/get_description_blurb()
	return "You are an Engineer Trainee. You are learning how to operate the various onboard engineering systems from senior engineering staff. You are subordinate to all of the other engineers aboard."
