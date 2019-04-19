/datum/job/warden
	title = "Warden"
	department = "Security"
	department_flag = SEC
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Head of Security"
	economic_power = 8
	minimal_player_age = 14
	ideal_character_age = 35
	alt_titles = list(
		"Security Sergeant",
		)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/security/warden
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_HAULING	  = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 25

	access = list(access_seceva, access_guard, access_security, access_brig, access_armory, access_forensics_lockers,
			            access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_eva, access_sec_doors, access_gun, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

/datum/job/detective
	title = "Detective"
	department = "Security"
	department_flag = SEC
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Head of Security"
	economic_power = 5
	minimal_player_age = 7
	ideal_character_age = 35
	skill_points = 14
	alt_titles = list(
		"Criminal Investigator",
		"Forensic Technician"
		)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/security/detective
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/civilian, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_FORENSICS   = SKILL_ADEPT)

	max_skill = list(   SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 22

	access = list(access_seceva, access_security, access_brig, access_forensics_lockers,
			            access_maint_tunnels, access_emergency_storage,
			            access_sec_doors, access_morgue, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

/datum/job/officer
	title = "Security Guard"
	department = "Security"
	department_flag = SEC
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Head of Security"
	economic_power = 6
	minimal_player_age = 10
	ideal_character_age = 25
	alt_titles = list(
		"Junior Guard")

	skill_points = 20

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/security/officer
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)

	access = list(access_seceva, access_guard, access_security, access_brig, access_maint_tunnels,
						access_external_airlocks, access_emergency_storage,
			            access_eva, access_sec_doors, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)
