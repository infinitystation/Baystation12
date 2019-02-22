/datum/job/captain
	title = "Captain"
	department = "Command"
	supervisors = "the NanoTrasen"
	department_flag = COM
	head_position = 1
	minimal_player_age = 21
	economic_power = 20
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/captain
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)


	skill_points = 25

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BACHELOR
	maximum_education = EDUCATION_TIER_DOCTORATE

/datum/job/hop
	title = "Head of Personnel"
	supervisors = "the Captain"
	department = "Command"
	department_flag = COM
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	minimal_player_age = 21
	economic_power = 12
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/hop
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	skill_points = 20

	access = list(		access_seceva, access_guard, access_security, access_brig, access_armory, access_forensics_lockers, access_heads,
			            access_medical, access_morgue, access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_change_ids, access_ai_upload, access_teleporter, access_eva, access_bridge,
			            access_all_personal_lockers, access_chapel_office, access_tech_storage, access_atmospherics, access_bar, access_janitor, access_crematorium, access_robotics,
			            access_kitchen, access_cargo, access_construction, access_chemistry, access_cargo_bot, access_hydroponics, access_library, access_virology,
			            access_cmo, access_qm, access_network, access_surgery, access_mailsorting, access_heads_vault, access_ce,
			            access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_sec_doors, access_psychiatrist,
			            access_medical_equip, access_gun, access_expedition_shuttle, access_guppy,
			            access_seneng, access_senmed, access_hangar, access_guppy_helm, access_expedition_shuttle_helm, access_explorer, access_el,
						access_tox, access_tox_storage, access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_xenoarch,
						access_petrov, access_petrov_helm)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BACHELOR
	maximum_education = EDUCATION_TIER_MASTERS

/datum/job/rd
	title = "Research Director"
	supervisors = "NanoTrasen and the Captain"
	department = "Science"
	department_flag = SCI|COM
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	economic_power = 20
	minimal_player_age = 14
	ideal_character_age = 60
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/rd
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_ADEPT,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 36

	access = list(access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge, access_rd,
						access_research, access_robotics, access_mining, access_mining_office, access_mining_station, access_xenobiology,
						access_RC_announce, access_keycard_auth, access_xenoarch, access_heads,
						access_sec_doors, access_medical, access_network, access_maint_tunnels,
						access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/aidiag,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_DOCTORATE

/datum/job/cmo
	title = "Chief Medical Officer"
	supervisors = "the Captain and the Head of Personnel"
	head_position = 1
	department = "Medical"
	department_flag = MED|COM
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	economic_power = 10
	minimal_player_age = 21
	ideal_character_age = 48
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/cmo
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_ADEPT,
	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
	                    SKILL_VIROLOGY    = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)
	skill_points = 36

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_heads,
			            access_sec_doors,
			            access_chapel_office, access_crematorium, access_chemistry, access_virology,
			            access_cmo, access_surgery, access_RC_announce, access_keycard_auth, access_psychiatrist,
			            access_medical_equip, access_senmed, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_MEDSCHOOL

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "the Captain and the Head of Personnel"
	head_position = 1
	department = "Engineering"
	department_flag = ENG|COM
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	economic_power = 10
	ideal_character_age = 40
	minimal_player_age = 21
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/chief_engineer
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(   SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_ADEPT,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_EXPERT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 30

	access = list(access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
			            access_tech_storage, access_atmospherics, access_janitor, access_construction,
			            access_sec_doors, access_medical,
			            access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_seneng, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_MASTERS
	maximum_education = EDUCATION_TIER_DOCTORATE

/datum/job/hos
	title = "Head of Security"
	supervisors = "the Captain and the Head of Personnel"
	head_position = 1
	department = "Security"
	department_flag = SEC|COM
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	economic_power = 10
	minimal_player_age = 21
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/hos
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_ADEPT,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 28

	access = list(	access_seceva, access_guard, access_security, access_medical, access_brig, access_armory, access_forensics_lockers,
			            access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_heads,
			            access_hos, access_RC_announce, access_keycard_auth, access_sec_doors,
			            access_hangar, access_gun)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BACHELOR
	maximum_education = EDUCATION_TIER_MASTERS

/datum/job/iaa
	title = "Internal Affairs Agent"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "NanoTrasen and Corporate Regulations"
	selection_color = "#2f2f7f"
	economic_power = 15
	minimal_player_age = 10
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/iaa
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY	= SKILL_EXPERT,
						SKILL_FORENSICS 	= SKILL_BASIC,
						SKILL_FINANCE		= SKILL_BASIC)
	skill_points = 20

	access = list(		access_security, access_sec_doors, access_medical, access_iaa, access_research, access_xenoarch, access_heads, access_bridge,
						access_hangar, access_petrov, access_commissary, access_maint_tunnels)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/reports)
	required_education = EDUCATION_TIER_BACHELOR
	maximum_education = EDUCATION_TIER_MASTERS

/datum/job/adjutant
	title = "Adjutant"
	department = "Support"
	department_flag = SPT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Captain and heads of staff"
	selection_color = "#2f2f7f"
	minimal_player_age = 18
	economic_power = 7
	ideal_character_age = 24
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/adjutant
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	skill_points = 20


	access = list(	access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
					access_heads, access_bridge, access_janitor, access_kitchen, access_cargo, access_RC_announce, access_keycard_auth,
					access_guppy, access_guppy_helm, access_external_airlocks, access_expedition_shuttle,
					access_eva, access_hangar, access_explorer, access_expedition_shuttle_helm, access_gun)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)
	required_education = EDUCATION_TIER_BASIC
	maximum_education = EDUCATION_TIER_BACHELOR

/datum/job/adjutant/get_description_blurb()
	return "You are an Adjutant. You do not give orders of your own. You are subordinate to all of command. You handle matters on the bridge and report directly to the Captain and Head of Personnel. You take the sierra's helm. You monitor bridge computer programs and communications and report relevant information to command. Sometimes you can also give support for vessel's departments - you have radio keys in bridge's storage for that purpose."
