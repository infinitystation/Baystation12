/datum/map/sierra
	species_to_job_whitelist = list(
		/datum/species/nabber = list(/datum/job/ai, /datum/job/cyborg, /datum/job/janitor, /datum/job/scientist_assistant, /datum/job/chemist,
		/datum/job/roboticist, /datum/job/cargo_assistant, /datum/job/chef, /datum/job/engineer, /datum/job/doctor, /datum/job/bartender),
		/datum/species/vox = list(/datum/job/ai, /datum/job/cyborg, /datum/job/merchant, /datum/job/stowaway)
	)

#define HUMAN_ONLY_JOBS /datum/job/captain, /datum/job/hos, /datum/job/pathfinder, /datum/job/warden
	species_to_job_blacklist = list(
		/datum/species/unathi  = list(HUMAN_ONLY_JOBS, /datum/job/iaa), //Other jobs unavailable via branch restrictions,
		/datum/species/skrell  = list(HUMAN_ONLY_JOBS),
		/datum/species/tajaran = list(HUMAN_ONLY_JOBS),
		/datum/species/machine = list(HUMAN_ONLY_JOBS),
		/datum/species/resomi  = list(HUMAN_ONLY_JOBS, /datum/job/iaa, /datum/job/officer),
		/datum/species/diona   = list(HUMAN_ONLY_JOBS, /datum/job/officer),	//Other jobs unavailable via branch restrictions,
	)
#undef HUMAN_ONLY_JOBS

	allowed_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos,
						/datum/job/iaa, /datum/job/adjutant,
						/datum/job/pathfinder, /datum/job/explorer, /datum/job/explorer_pilot, /datum/job/explorer_medic, /datum/job/explorer_engineer,
						/datum/job/senior_engineer, /datum/job/engineer, /datum/job/engineer_trainee,
						/datum/job/officer, /datum/job/warden, /datum/job/detective,
						/datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee,/datum/job/chemist, /datum/job/psychiatrist,
						/datum/job/qm, /datum/job/cargo_tech,  /datum/job/cargo_assistant, /datum/job/mining,
						/datum/job/janitor, /datum/job/chef, /datum/job/bartender,
						/datum/job/senior_scientist, /datum/job/scientist, /datum/job/roboticist, /datum/job/nt_pilot, /datum/job/scientist_assistant,
						/datum/job/ai, /datum/job/cyborg,
						/datum/job/assistant,
						/datum/job/merchant, /datum/job/stowaway
						)

/datum/map/sierra/setup_map()
	..()
	for(var/job_type in GLOB.using_map.allowed_jobs)
		var/datum/job/job = decls_repository.get_decl(job_type)
		// Most species are restricted from SCG security and command roles
		if((job.department_flag & (COM)) && job.allowed_branches.len && !(/datum/mil_branch/civilian in job.allowed_branches))
			for(var/species_name in list(SPECIES_IPC, SPECIES_TAJARA, SPECIES_SKRELL, SPECIES_UNATHI))
				var/datum/species/S = all_species[species_name]
				var/species_blacklist = species_to_job_blacklist[S.type]
				if(!species_blacklist)
					species_blacklist = list()
					species_to_job_blacklist[S.type] = species_blacklist
				species_blacklist |= job.type

/datum/job/captain
	title = "Captain"
	department = "Command"
	supervisors = "the NanoTrasen"
	department_flag = COM
	head_position = 1
	minimal_player_age = 21
	economic_modifier = 15
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/captain
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_SCIENCE     = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_ADEPT)
	skill_points = 36

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "You are the Captain. You are the top dog. You are an experienced professional officer in control of an entire ship, and ultimately responsible for all that happens onboard. Your job is to make sure [GLOB.using_map.full_name] fulfils its space exploration mission. Delegate to your Head of Personnel, your department heads, and your Senior Enlisted Advisor to effectively manage the ship, and listen to and trust their expertise."

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
	economic_modifier = 10
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/hop
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_COMPUTER    = SKILL_BASIC,
						SKILL_PILOT       = SKILL_BASIC)
	skill_points = 36

	access = list(access_security, access_brig, access_armory, access_forensics_lockers,
			            access_medical, access_morgue, access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_change_ids, access_ai_upload, access_teleporter, access_eva, access_heads,
			            access_all_personal_lockers, access_chapel_office, access_tech_storage, access_atmospherics, access_bar, access_janitor, access_crematorium, access_robotics,
			            access_kitchen, access_cargo, access_construction, access_chemistry, access_cargo_bot, access_hydroponics, access_library, access_virology,
			            access_cmo, access_qm, access_network, access_surgery, access_mailsorting, access_heads_vault, access_ce,
			            access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_sec_doors, access_psychiatrist,
			            access_medical_equip, access_gun, access_expedition_shuttle, access_guppy,
			            access_seneng, access_senmed, access_hangar, access_guppy_helm, access_expedition_shuttle_helm, access_explorer, access_pathfinder)
	minimal_access = list(access_security, access_brig, access_armory, access_forensics_lockers,
			            access_medical, access_morgue, access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_change_ids, access_ai_upload, access_teleporter, access_eva, access_heads,
			            access_all_personal_lockers, access_chapel_office, access_tech_storage, access_atmospherics, access_bar, access_janitor, access_crematorium,
			            access_kitchen, access_cargo, access_construction, access_chemistry, access_cargo_bot, access_hydroponics, access_library, access_virology,
			            access_cmo, access_qm, access_network, access_surgery, access_mailsorting, access_heads_vault, access_ce,
			            access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_sec_doors, access_psychiatrist,
			            access_medical_equip, access_gun, access_expedition_shuttle, access_guppy,
			            access_seneng, access_senmed, access_hangar, access_guppy_helm, access_explorer, access_pathfinder,
			            access_expedition_shuttle_helm)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hop/get_description_blurb()
	return "You are the Head of Personnel. You are an experienced senior officer, second in command of the ship, and are responsible for the smooth operation of the ship under your Captain. In his absence, you are expected to take his place. Your primary duty is directly managing department heads and all those outside a department heading. You are also responsible for the contractors and passengers aboard the ship. Consider the Senior Enlisted Advisor and Bridge Officers tools at your disposal."

/datum/job/rd
	title = "Research Director"
	supervisors = "NanoTrasen and the Captain"
	department = "Science"
	department_flag = SCI|COM
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	economic_modifier = 20
	minimal_player_age = 14
	ideal_character_age = 60
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/rd
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_COMPUTER    = SKILL_BASIC,
						SKILL_FINANCE     = SKILL_ADEPT,
						SKILL_BOTANY      = SKILL_BASIC,
						SKILL_ANATOMY     = SKILL_BASIC,
						SKILL_DEVICES     = SKILL_BASIC,
						SKILL_SCIENCE     = SKILL_ADEPT)
	skill_points = 36

	access = list(access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_heads, access_rd,
						access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology,
						access_RC_announce, access_keycard_auth, access_xenoarch,
						access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/aidiag,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/rd/get_description_blurb()
	return "You are the Research Director. You are responsible for the research department. You handle both the science part of the mission but are also responsible for ensuring Nanotrasen's interests along with your Nanotrasen iaa. Make sure science gets done, do some yourself, and get your prospectors and scientists on away missions to find things to benefit NT. Don’t put NT’s position on board in jeopardy.  Advise the CO on science matters."

/datum/job/cmo
	title = "Chief Medical Officer"
	supervisors = "the Captain and the Head of Personnel"
	head_position = 1
	department = "Medical"
	department_flag = MED|COM
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	economic_modifier = 10
	minimal_player_age = 21
	ideal_character_age = 48
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/cmo
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_MEDICAL     = SKILL_ADEPT,
						SKILL_ANATOMY     = SKILL_EXPERT,
						SKILL_CHEMISTRY   = SKILL_BASIC,
						SKILL_VIROLOGY    = SKILL_BASIC)
	skill_points = 36

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_heads,
			            access_chapel_office, access_crematorium, access_chemistry, access_virology,
			            access_cmo, access_surgery, access_RC_announce, access_keycard_auth, access_psychiatrist,
			            access_medical_equip, access_senmed, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/cmo/get_description_blurb()
	return "You are the Chief Medical Officer. You manage the medical department. You ensure all members of medical are skilled, tasked and handling their duties. Ensure your doctors are staffing your infirmary and your corpsman/paramedics are ready for response. Act as a second surgeon or backup chemist in the absence of either. You are expected to know medical very well, along with general regulations."

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "the Captain and the Head of Personnel"
	head_position = 1
	department = "Engineering"
	department_flag = ENG|COM
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	economic_modifier = 9
	ideal_character_age = 40
	minimal_player_age = 21
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/chief_engineer
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY  = SKILL_BASIC,
						SKILL_COMPUTER     = SKILL_ADEPT,
						SKILL_EVA          = SKILL_ADEPT,
						SKILL_CONSTRUCTION = SKILL_ADEPT,
						SKILL_ELECTRICAL   = SKILL_ADEPT,
						SKILL_ATMOS        = SKILL_ADEPT,
						SKILL_ENGINES      = SKILL_EXPERT)
	skill_points = 30

	access = list(access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_ai_upload, access_teleporter, access_eva, access_heads,
			            access_tech_storage, access_robotics, access_atmospherics, access_janitor, access_construction,
			            access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_seneng, access_hangar, access_robotics)
	minimal_access = list(access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_ai_upload, access_teleporter, access_eva, access_heads,
			            access_tech_storage, access_atmospherics, access_janitor, access_construction,
			            access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_seneng, access_hangar, access_robotics)

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

/datum/job/chief_engineer/get_description_blurb()
	return "You are the Chief Engineer. You manage the Engineering Department. You are responsible for the Senior engineer, who is your right hand and (should be) an experienced, skilled engineer. Delegate to and listen to them. Manage your engineers, ensure vessel power stays on, breaches are patched and problems are fixed. Advise the CO on engineering matters. You are also responsible for the maintenance and control of any vessel synthetics. You are an experienced engineer with a wealth of theoretical knowledge. You should also know vessel regulations to a reasonable degree."

/datum/job/hos
	title = "Head of Security"
	supervisors = "the Captain and the Head of Personnel"
	head_position = 1
	department = "Security"
	department_flag = SEC|COM
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	economic_modifier = 8
	minimal_player_age = 21
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/hos
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_EVA         = SKILL_BASIC,
						SKILL_COMBAT      = SKILL_BASIC,
						SKILL_WEAPONS     = SKILL_ADEPT,
						SKILL_FORENSICS   = SKILL_BASIC)
	skill_points = 28

	access = list(access_security, access_brig, access_armory, access_forensics_lockers,
			            access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_heads,
			            access_hos, access_RC_announce, access_keycard_auth, access_sec_doors,
			            access_gun)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hos/get_description_blurb()
	return "You are the Head of Security. You manage ship security. The Masters at Arms and the Military Police, as well as the Brig Officer and the Forensic Technician. You keep the vessel safe. You handle both internal and external security matters. You are the law. You are subordinate to the CO and the XO. You are expected to know the SCMJ and Sol law and Alert Procedure to a very high degree along with general regulations."

/datum/job/iaa
	title = "Internal Affairs Agent"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "NanoTrasen and Corporate Regulations"
	selection_color = "#2f2f7f"
	economic_modifier = 15
	minimal_player_age = 10
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/iaa
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY	= SKILL_EXPERT,
						SKILL_FINANCE		= SKILL_BASIC)
	skill_points = 20

	access = list(access_iaa, access_tox, access_tox_storage, access_heads, access_research,
						access_mining, access_mining_office, access_mining_station, access_xenobiology,
						access_xenoarch,
						access_hangar, access_petrov, access_petrov_helm)

	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/iaa/get_description_blurb()
	return "You are the Nanotrasen iaa. You are a civilian employee of Nanotrasen assigned to the vessel to promote, protect and ensure the interests of the corporation on board. You are not internal affairs. You assume command of the Research Department in the absence of the RD and the Senior Researcher. You advise the RD on NT matters and try to push NT interests on the CO. Maximise profit. Be the rich corporate lawyer you always wanted to be."

/datum/job/adjutant
	title = "Adjutant"
	department = "Support"
	department_flag = SPT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Captain and heads of staff"
	selection_color = "#2f2f7f"
	minimal_player_age = 18
	economic_modifier = 7
	ideal_character_age = 24
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/adjutant
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_PILOT       = SKILL_ADEPT)
	skill_points = 20


	access = list(access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
			            access_heads, access_janitor, access_kitchen, access_cargo, access_RC_announce, access_keycard_auth,
			            access_guppy, access_guppy_helm, access_external_airlocks,
			            access_eva, access_hangar, access_cent_creed, access_explorer)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/adjutant/get_description_blurb()
	return "You are an Adjutant. You do not give orders of your own. You are subordinate to all of command. You handle matters on the bridge and report directly to the Captain and Head of Personnel. You take the sierra's helm. You monitor bridge computer programs and communications and report relevant information to command. Sometimes you can also give support for vessel's departments - you have radio keys in bridge's storage for that purpose.."

/datum/job/pathfinder
	title = "Pathfinder"
	department = "Exploration"
	department_flag = EXP

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain and the Sol Central Government"
	selection_color = "#68099e"
	minimal_player_age = 7
	economic_modifier = 7
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/exploration/pathfinder
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/ec/o1
		)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_EVA         = SKILL_ADEPT,
						SKILL_SCIENCE     = SKILL_ADEPT,
						SKILL_PILOT       = SKILL_BASIC)
	skill_points = 22

	access = list(access_pathfinder, access_explorer, access_eva, access_maint_tunnels, access_heads, access_emergency_storage, access_tech_storage, access_guppy_helm, access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar, access_cent_creed)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/pathfinder/get_description_blurb()
	return "You are the Pathfinder. Your duty is to organize and lead the expeditions to away sites. You command Explorers. You make sure that expedition has the supplies and personnel it needs. You can pilot Charon if you'll not have your pilot and NT doesn't provide their one. Once on the away mission, your duty is to ensure that anything of scientific interest is brought back to the ship and passed to the relevant research lab."

/datum/job/explorer
	title = "Explorer"
	department = "Exploration"
	department_flag = EXP
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Captain and the Pathfinder"
	selection_color = "#68099e"
	ideal_character_age = 20
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/exploration/explorer
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5
		)
	min_skill = list(	SKILL_EVA = SKILL_BASIC)

	access = list(access_explorer, access_maint_tunnels, access_eva, access_emergency_storage, access_guppy_helm, access_expedition_shuttle, access_guppy, access_hangar, access_cent_creed)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer/get_description_blurb()
	return "You are an Explorer. Your duty is to go on expeditions to away sites. The Pathfinder is your team leader. You are to look for anything of economic or scientific interest to the SCG - mineral deposits, alien flora/fauna, artifacts. You will also likely encounter hazardous environments, aggressive wildlife or malfunctioning defense systems, so tread carefully."

/datum/job/explorer_pilot
	title = "Expeditionary Pilot"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain and the Pathfinder"
	selection_color = "#68099e"
	ideal_character_age = 24
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/exploration/pilot
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5
		)
	min_skill = list(	SKILL_EVA	= SKILL_BASIC,
						SKILL_PILOT	= SKILL_ADEPT)

	access = list(	access_explorer, access_maint_tunnels, access_eva, access_emergency_storage, access_guppy_helm,
					access_expedition_shuttle, access_guppy, access_hangar, access_expedition_shuttle_helm)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer_pilot/get_description_blurb()
	return "You are an Explorer. Your duty is to go on expeditions to away sites. The Pathfinder is your team leader. You are to look for anything of economic or scientific interest to the SCG - mineral deposits, alien flora/fauna, artifacts. You will also likely encounter hazardous environments, aggressive wildlife or malfunctioning defense systems, so tread carefully."

/datum/job/explorer_medic
	title = "Field Medic"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain and the Pathfinder"
	selection_color = "#68099e"
	ideal_character_age = 34
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/exploration/medic
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5
		)
	min_skill = list(	SKILL_EVA	= SKILL_BASIC,
						SKILL_MEDICAL = SKILL_BASIC,
						SKILL_HAULING = SKILL_BASIC)

	access = list(	access_explorer, access_maint_tunnels, access_eva, access_emergency_storage,
					access_guppy_helm, access_expedition_shuttle, access_guppy, access_hangar,
					access_medical)


	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer_medic/get_description_blurb()
	return "You are an Explorer. Your duty is to go on expeditions to away sites. The Pathfinder is your team leader. You are to look for anything of economic or scientific interest to the SCG - mineral deposits, alien flora/fauna, artifacts. You will also likely encounter hazardous environments, aggressive wildlife or malfunctioning defense systems, so tread carefully."

/datum/job/explorer_engineer
	title = "Field Engineer"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain and the Pathfinder"
	selection_color = "#68099e"
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/exploration/engineer
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5
		)
	min_skill = list(	SKILL_EVA			= SKILL_BASIC,
						SKILL_CONSTRUCTION	= SKILL_BASIC,
						SKILL_ELECTRICAL	= SKILL_BASIC,
						SKILL_HAULING		= SKILL_BASIC,
						SKILL_COMPUTER		= SKILL_BASIC)

	access = list(	access_explorer, access_maint_tunnels, access_eva, access_emergency_storage,
	 				access_guppy_helm, access_expedition_shuttle, access_guppy, access_hangar, access_engine)



	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer_engineer/get_description_blurb()
	return "You are an Explorer. Your duty is to go on expeditions to away sites. The Pathfinder is your team leader. You are to look for anything of economic or scientific interest to the SCG - mineral deposits, alien flora/fauna, artifacts. You will also likely encounter hazardous environments, aggressive wildlife or malfunctioning defense systems, so tread carefully."


/datum/job/senior_engineer
	title = "Senior Engineer"
	department = "Engineering"
	department_flag = ENG
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Engineer"
	selection_color = "#5b4d20"
	economic_modifier = 6
	minimal_player_age = 14
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/senior_engineer
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_COMPUTER     = SKILL_BASIC,
						SKILL_EVA          = SKILL_ADEPT,
						SKILL_CONSTRUCTION = SKILL_ADEPT,
						SKILL_ELECTRICAL   = SKILL_ADEPT,
						SKILL_ATMOS        = SKILL_BASIC,
						SKILL_ENGINES      = SKILL_ADEPT)
	skill_points = 24

	access = list(	access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			        access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
			        access_tcomsat, access_seneng, access_hangar)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/senior_engineer/get_description_blurb()
	return "You are the Senior Engineer. You are a veteran SNCO. You are subordinate to the Chief Engineer though you may have many years more experience than them and your subordinates are the rest of engineering. You should be an expert in practically every engineering area and familiar and possess leadership skills. Coordinate the team and ensure the smooth running of the department along with the Chief Engineer."

/datum/job/engineer
	title = "Engineer"
	department = "Engineering"
	department_flag = ENG

	total_positions = 2
	spawn_positions = 2
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
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_COMPUTER     = SKILL_BASIC,
						SKILL_EVA          = SKILL_BASIC,
						SKILL_CONSTRUCTION = SKILL_ADEPT,
						SKILL_ELECTRICAL   = SKILL_BASIC,
						SKILL_ATMOS        = SKILL_BASIC,
						SKILL_ENGINES      = SKILL_BASIC)
	skill_points = 20

	access = list(	access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			       	access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
			        access_hangar)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

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

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/engineer
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	skill_points = 4
	no_skill_buffs = TRUE

	min_skill = list(	SKILL_COMPUTER     = SKILL_BASIC,
						SKILL_HAULING      = SKILL_ADEPT,
						SKILL_EVA          = SKILL_ADEPT,
						SKILL_CONSTRUCTION = SKILL_ADEPT,
						SKILL_ELECTRICAL   = SKILL_ADEPT,
						SKILL_ATMOS        = SKILL_ADEPT,
						SKILL_ENGINES      = SKILL_ADEPT)

	access = list(access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_eva, access_tech_storage, access_janitor, access_construction,
			            access_hangar)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/engineer_trainee/get_description_blurb()
	return "You are an Engineer Trainee. You are learning how to operate the various onboard engineering systems from senior engineering staff. You are subordinate to all of the other engineers aboard."


/datum/job/roboticist
	title = "Roboticist"
	department = "Engineering"
	department_flag = ENG|MED

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Engineer and the Chief Medical Officer"
	selection_color = "#5b4d20"
	economic_modifier = 6
	alt_titles = list(
		"Biomechanical Engineer",
		"Mechsuit Technician")
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/engineering/roboticist
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_COMPUTER		= SKILL_ADEPT,
						SKILL_MECH = SKILL_ADEPT,
						SKILL_DEVICES		= SKILL_ADEPT)

	access = list(access_robotics, access_tech_storage, access_morgue, access_medical)
	minimal_access = list()

/datum/job/roboticist/get_description_blurb()
	return "You are the Roboticist. You are responsible for repairing, upgrading and handling ship synthetics as well as the repair of all synthetic crew on board. You are also responsible for placing brains into MMI’s and giving them bodies and the production of exosuits(mechs) for various departments. You answer to the Chief Engineer."

/datum/job/warden
	title = "Security Sergeant"
	department = "Security"
	department_flag = SEC
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Head of Security"
	economic_modifier = 5
	minimal_player_age = 14
	ideal_character_age = 35
	alt_titles = list(
		"Warden",
		)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/security/warden
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_EVA         = SKILL_BASIC,
						SKILL_COMBAT      = SKILL_BASIC,
						SKILL_WEAPONS     = SKILL_BASIC,
						SKILL_FORENSICS   = SKILL_BASIC)
	skill_points = 20

	access = list(access_security, access_brig, access_armory, access_forensics_lockers,
			            access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_eva, access_sec_doors, access_gun)
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
	economic_modifier = 5
	minimal_player_age = 7
	ideal_character_age = 35
	skill_points = 14
	alt_titles = list(
		"Criminal Investigator",
		"Forensic Technician"
		)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/security/detective
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_COMPUTER    = SKILL_BASIC,
						SKILL_EVA         = SKILL_BASIC,
						SKILL_COMBAT      = SKILL_BASIC,
						SKILL_WEAPONS     = SKILL_BASIC,
						SKILL_FORENSICS   = SKILL_ADEPT)
	skill_points = 20

	access = list(access_security, access_brig, access_forensics_lockers,
			            access_maint_tunnels, access_emergency_storage,
			            access_sec_doors, access_morgue)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

/datum/job/officer
	title = "Security Operator"
	department = "Security"
	department_flag = SEC
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Head of Security"
	economic_modifier = 4
	minimal_player_age = 10
	ideal_character_age = 25
	alt_titles = list(
		"Security Officer",
		"Junior Officer")
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/security/officer
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_EVA         = SKILL_BASIC,
						SKILL_COMBAT      = SKILL_BASIC,
						SKILL_WEAPONS     = SKILL_ADEPT,
						SKILL_FORENSICS   = SKILL_BASIC)

	access = list(access_security, access_brig, access_maint_tunnels,
						access_external_airlocks, access_emergency_storage,
			            access_eva, access_sec_doors)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

/datum/job/senior_doctor
	title = "Surgeon"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 14
	ideal_character_age = 45
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Medical Officer"
	selection_color = "#013d3b"
	economic_modifier = 8
	alt_titles = list(
		"Xeno Surgeon" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/xenosurgeon,
		"Trauma Surgeon" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/traumasurgeon)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/senior
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_MEDICAL     = SKILL_ADEPT,
						SKILL_ANATOMY     = SKILL_EXPERT,
						SKILL_CHEMISTRY   = SKILL_BASIC,
						SKILL_VIROLOGY    = SKILL_BASIC)
	skill_points = 32

	access = list(access_medical, access_morgue, access_virology, access_maint_tunnels, access_emergency_storage,
			            access_crematorium, access_chemistry, access_surgery, access_eva,
			            access_medical_equip, access_senmed)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

/datum/job/doctor
	title = "Doctor"
	department = "Medical"
	department_flag = MED

	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief Medical Officer"
	economic_modifier = 7
	ideal_character_age = 40
	alt_titles = list(
		"Paramedic" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/paramedic,
		"Virologist" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/virologist)

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_EVA     = SKILL_BASIC,
						SKILL_MEDICAL = SKILL_BASIC,
						SKILL_ANATOMY = SKILL_BASIC)
	access = list(	access_medical, access_morgue, access_virology, access_maint_tunnels, access_external_airlocks,
					access_emergency_storage,
			        access_eva, access_surgery, access_medical_equip, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	skill_points = 26

/datum/job/doctor_trainee
	title = "Intern"
	department = "Medical"
	department_flag = MED

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Medical Officer and Medical Personnel"
	selection_color = "#013d3b"
	economic_modifier = 3
	ideal_character_age = 30
	alt_titles = list(
		"Orderly" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/orderly,
		"Nurse" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/nurse)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_EVA     = SKILL_BASIC,
						SKILL_MEDICAL = SKILL_BASIC,
						SKILL_ANATOMY = SKILL_BASIC)
	skill_points = 32

	access = list(	access_medical, access_morgue, access_surgery,
					access_medical_equip,
		            access_maint_tunnels, access_emergency_storage,
		            access_external_airlocks, access_hangar)

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_eva, access_surgery, access_medical_equip, access_hangar)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

/datum/job/doctor_trainee/get_description_blurb()
	return "You are an Intern. You are learning how to treat and recover wounded crew from the more experienced medical personnel aboard. You are subordinate to the rest of the medical team."


/datum/job/chemist
	title = "Chemist"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Medical Officer and Medical Personnel"
	selection_color = "#013d3b"
	economic_modifier = 4
	ideal_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/chemist
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_MEDICAL   = SKILL_BASIC,
						SKILL_CHEMISTRY = SKILL_ADEPT)
	skill_points = 26

	access = list(access_medical, access_maint_tunnels, access_emergency_storage, access_medical_equip, access_chemistry)
	minimal_access = list()

/datum/job/psychiatrist
	title = "Counselor"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	ideal_character_age = 40
	economic_modifier = 5
	supervisors = "the Chief Medical Officer"
	alt_titles = list(
		"Psychiatrist" = /decl/hierarchy/outfit/job/sierra/crew/medical/counselor/psychiatrist,
		"Chaplain" = /decl/hierarchy/outfit/job/sierra/crew/medical/counselor/chaplain,
	)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/counselor
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_MEDICAL     = SKILL_BASIC)

	access = list(access_medical, access_morgue, access_chapel_office, access_crematorium, access_psychiatrist)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

/datum/job/qm
	title = "Quartermaster"
	department = "Supply"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Head of Personnel"
	economic_modifier = 5
	minimal_player_age = 7
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/supply/quartermaster
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_ADEPT,
						SKILL_FINANCE     = SKILL_BASIC,
						SKILL_HAULING     = SKILL_BASIC,
						SKILL_EVA         = SKILL_BASIC,
						SKILL_PILOT       = SKILL_BASIC)
	skill_points = 18

	access = list(access_maint_tunnels, access_heads, access_emergency_storage, access_tech_storage,  access_cargo, access_guppy_helm,
						access_cargo_bot, access_qm, access_mailsorting, access_expedition_shuttle, access_guppy, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/cargo_tech
	title = "Cargo Technician"
	department = "Supply"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Quartermaster and Head of Personnel"
	ideal_character_age = 24
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/supply/tech
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_FINANCE     = SKILL_BASIC,
						SKILL_HAULING     = SKILL_BASIC)

	access = list(access_maint_tunnels, access_emergency_storage, access_cargo, access_guppy_helm,
						access_cargo_bot, access_mailsorting, access_expedition_shuttle, access_guppy, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/mining
	title = "Prospector"
	department = "Supply"
	department_flag = SUP
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Quartermaster and Head of Personnel"
	selection_color = "#515151"
	economic_modifier = 7
	ideal_character_age = 25
	alt_titles = list(
		"Drill Technician",
		"Shaft Miner",
		"Salvage Technician")
	min_skill = list(	SKILL_MECH    = SKILL_BASIC,
						SKILL_HAULING = SKILL_ADEPT,
						SKILL_EVA     = SKILL_BASIC)

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/prospector
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)

	access = list(access_research, access_mining, access_mining_office, access_mining_station,
						access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_guppy_helm)
	minimal_access = list()



/datum/job/cargo_assistant
	title = "Cargo Assistant"
	department = "Supply"
	department_flag = SUP

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Quartermaster and Supply Personnel"
	ideal_character_age = 20
	selection_color = "#515151"
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/supply/assistant
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_FINANCE     = SKILL_BASIC,
						SKILL_HAULING     = SKILL_BASIC)

	access = list(access_maint_tunnels, access_cargo, access_cargo_bot, access_mailsorting, access_hangar, access_guppy, access_guppy_helm)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/janitor
	title = "Janitor"
	department = "Service"
	department_flag = SRV

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Head of Personnel"
	ideal_character_age = 20
	alt_titles = list(
		"Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/service/janitor
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_HAULING = SKILL_BASIC)

	access = list(access_maint_tunnels, access_emergency_storage, access_janitor)
	minimal_access = list()

/datum/job/chef
	title = "Chef"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Head of Personnel"
	alt_titles = list(
		"Cook",
		"Culinary Specialist"
		)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/service/cook
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(	SKILL_COOKING   = SKILL_ADEPT,
						SKILL_BOTANY    = SKILL_BASIC,
						SKILL_CHEMISTRY = SKILL_BASIC)

	access = list(access_maint_tunnels, access_hydroponics, access_kitchen, access_bar)
	minimal_access = list()


/datum/job/bartender
	department = "Service"
	department_flag = SRV
	supervisors = "the Head of Personnel"
	ideal_character_age = 30
	selection_color = "#515151"
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/service/bartender
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list()
	min_skill = list(	SKILL_COOKING   = SKILL_BASIC,
						SKILL_BOTANY    = SKILL_BASIC,
						SKILL_CHEMISTRY = SKILL_BASIC)


/datum/job/senior_scientist
	title = "Senior Researcher"
	department = "Science"
	department_flag = SCI

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Research Director"
	selection_color = "#633d63"
	economic_modifier = 12
	minimal_player_age = 10
	ideal_character_age = 50
	alt_titles = list(
		"Research Supervisor")
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/senior_scientist
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	access = list(access_tox, access_tox_storage, access_research, access_mining, access_mining_office,
						access_mining_station, access_xenobiology, access_xenoarch,
						access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_COMPUTER    = SKILL_BASIC,
						SKILL_FINANCE     = SKILL_BASIC,
						SKILL_BOTANY      = SKILL_BASIC,
						SKILL_ANATOMY     = SKILL_BASIC,
						SKILL_DEVICES     = SKILL_ADEPT,
						SKILL_SCIENCE     = SKILL_ADEPT)
	skill_points = 20

/datum/job/nt_pilot
	title = "NanoTrasen Pilot"
	supervisors = "the Research Director"
	department = "Science"
	department_flag = SCI

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Research Director and NanoTrasen Personnel"
	selection_color = "#633d63"
	economic_modifier = 10
	minimal_player_age = 5
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/nt_pilot
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	access = list(access_research, access_mining_office,
						access_mining_station, access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy,
						access_hangar, access_petrov, access_petrov_helm, access_guppy_helm, access_mining)
	min_skill = list(	SKILL_EVA   = SKILL_BASIC,
						SKILL_PILOT = SKILL_ADEPT)

/datum/job/scientist
	title = "Scientist"
	department = "Science"
	department_flag = SCI
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Research Director"
	economic_modifier = 10
	ideal_character_age = 45
	alt_titles = list(
		"Xenoarcheologist",
		"Anomalist",
		"Researcher",
		"Xenobiologist",
		"Xenobotanist",
		"Psychologist" = /decl/hierarchy/outfit/job/sierra/crew/research/scientist/psych)
	min_skill = list(	SKILL_BUREAUCRACY = SKILL_BASIC,
						SKILL_COMPUTER    = SKILL_BASIC,
						SKILL_DEVICES     = SKILL_BASIC,
						SKILL_SCIENCE     = SKILL_ADEPT)

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/scientist
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	access = list(access_tox, access_tox_storage, access_research, access_petrov, access_petrov_helm,
						access_mining_office, access_mining_station, access_xenobiology, access_guppy_helm,
						access_xenoarch, access_expedition_shuttle, access_guppy, access_hangar)
	minimal_access = list()
	skill_points = 20

/datum/job/scientist_assistant
	title = "Research Assistant"
	department = "Science"
	department_flag = SCI

	total_positions = 4
	spawn_positions = 4
	supervisors = "the Research Director and NanoTrasen Personnel"
	selection_color = "#633d63"
	economic_modifier = 3
	ideal_character_age = 30
	alt_titles = list(
		"Testing Assistant" = /decl/hierarchy/outfit/job/sierra/crew/research/assist/testsubject,
		"Laboratory Technician",
		"Science Intern",
		"Clerk",
		"Field Assistant")

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/assist
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/nt)

	access = list(access_research, access_mining_office, access_petrov, access_expedition_shuttle, access_guppy, access_hangar)


/datum/job/assistant
	title = "Passenger"
	total_positions = 12
	spawn_positions = 12
	department = "Civilian"
	department_flag = CIV
	supervisors = "the Head of Personnel"
	selection_color = "#515151"
	economic_modifier = 6
	announced = FALSE
	alt_titles = list(
		"Journalist" = /decl/hierarchy/outfit/job/sierra/passenger/journalist,
		"Historian",
		"Botanist",
		"Naturalist",
		"Ecologist",
		"Entertainer",
		"Sociologist",
		"Off-Duty",
		"Trainer")
	outfit_type = /decl/hierarchy/outfit/job/sierra/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/nt
	)

/datum/job/cyborg
	total_positions = 3
	spawn_positions = 3
	supervisors = "your laws"

/datum/job/ai
	total_positions = 0
	spawn_positions = 0

/datum/job/merchant
	title = "Merchant"
	department = "Civilian"
	department_flag = CIV

	total_positions = 2
	spawn_positions = 2
	supervisors = "the invisible hand of the market"
	selection_color = "#515151"
	ideal_character_age = 30
	minimal_player_age = 7
	create_record = 0
	outfit_type = /decl/hierarchy/outfit/job/sierra/merchant
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	latejoin_at_spawnpoints = 1
	access = list(access_merchant)
	announced = FALSE
	min_skill = list(	SKILL_FINANCE = SKILL_ADEPT,
						SKILL_PILOT	  = SKILL_BASIC)
	skill_points = 24

/datum/job/stowaway
	title = "Stowaway"
	department = "Civilian"
	department_flag = CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "yourself"
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
