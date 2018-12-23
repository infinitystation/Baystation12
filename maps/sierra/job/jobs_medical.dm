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
	economic_power = 8
	alt_titles = list(
		"Xenosurgeon" = /decl/hierarchy/outfit/job/sierra/crew/medical/senior/xenosurgeon,
		"Trauma Surgeon" = /decl/hierarchy/outfit/job/sierra/crew/medical/senior/traumasurgeon)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/senior
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_ADEPT,
	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
	                    SKILL_VIROLOGY    = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX)
	skill_points = 26

	access = list(access_medical, access_morgue, access_virology, access_maint_tunnels, access_emergency_storage,
			            access_crematorium, access_chemistry, access_surgery, access_eva,
			            access_medical_equip, access_senmed, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	required_education = EDUCATION_TIER_MEDSCHOOL

/datum/job/doctor
	title = "Doctor"
	department = "Medical"
	department_flag = MED

	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief Medical Officer"
	economic_power = 7
	ideal_character_age = 40
	alt_titles = list(
		"Paramedic" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/paramedic,
		"Virologist" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/virologist)

	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_EVA     = SKILL_BASIC,
	                    SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)
	access = list(	access_medical, access_morgue, access_virology, access_maint_tunnels, access_external_airlocks,
					access_emergency_storage,
			        access_eva, access_surgery, access_medical_equip, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	skill_points = 22
	required_education = EDUCATION_TIER_TRADE

/datum/job/doctor_trainee
	title = "Intern"
	department = "Medical"
	department_flag = MED

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Medical Officer and Medical Personnel"
	selection_color = "#013d3b"
	economic_power = 3
	ideal_character_age = 30
	alt_titles = list(
		"Orderly" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/orderly,
		"Nurse" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/nurse)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_EVA     = SKILL_BASIC,
	                    SKILL_MEDICAL = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL	= SKILL_MAX)
	skill_points = 18

	access = list(	access_medical, access_morgue, access_surgery,
					access_medical_equip,
		            access_maint_tunnels, access_emergency_storage,
		            access_external_airlocks, access_hangar)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	required_education = EDUCATION_TIER_BASIC
	maximum_education = EDUCATION_TIER_BACHELOR

/datum/job/chemist
	title = "Chemist"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Medical Officer"
	selection_color = "#013d3b"
	economic_power = 5
	ideal_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/chemist
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_MEDICAL   = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_ADEPT)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 18

	access = list(access_medical, access_maint_tunnels, access_emergency_storage, access_medical_equip, access_chemistry)

	minimal_access = list()
	required_education = EDUCATION_TIER_BACHELOR

/datum/job/psychiatrist
	title = "Counselor"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	ideal_character_age = 40
	economic_power = 5
	supervisors = "the Chief Medical Officer"
	alt_titles = list(
		"Psychiatrist" = /decl/hierarchy/outfit/job/sierra/crew/medical/counselor/psychiatrist,
		"Chaplain" = /decl/hierarchy/outfit/job/sierra/crew/medical/counselor/chaplain,
	)
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/medical/counselor
	allowed_branches = list(/datum/mil_branch/employee, /datum/mil_branch/civilian, /datum/mil_branch/contractor)
	allowed_ranks = list(/datum/mil_rank/civ/nt, /datum/mil_rank/civ/contractor, /datum/mil_rank/civ/civ)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX)

	access = list(access_medical, access_morgue, access_chapel_office, access_crematorium, access_psychiatrist)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	required_education = EDUCATION_TIER_BASIC
