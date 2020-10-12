/datum/job/senior_doctor
	title = "Surgeon"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 14
	ideal_character_age = 45
	total_positions = 2
	spawn_positions = 2
	supervisors = "Главврачом"
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

	access = list(	access_medical, access_morgue, access_virology, access_maint_tunnels, access_emergency_storage,
				access_crematorium, access_surgery, access_eva, access_external_airlocks,
				access_medical_equip, access_senmed, access_hangar, access_chemistry)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	good_genome_prob = 20

/datum/job/doctor
	title = "Doctor"
	department = "Medical"
	department_flag = MED

	total_positions = 3
	spawn_positions = 3
	supervisors = "Главврачом"
	economic_power = 7
	ideal_character_age = 40
	alt_titles = list(
		"Paramedic" = /decl/hierarchy/outfit/job/sierra/crew/medical/doctor/paramedic)

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

/datum/job/doctor_trainee
	title = "Intern"
	department = "Medical"
	department_flag = MED

	total_positions = 2
	spawn_positions = 2
	supervisors = "Главврачом и остальным медицинским персоналом"
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

/datum/job/chemist
	title = "Chemist"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	supervisors = "Главврачом"
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

/datum/job/psychiatrist
	title = "Counselor"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	ideal_character_age = 40
	economic_power = 8
	supervisors = "Главврачом"
	alt_titles = list(
		"Mentalist" = /decl/hierarchy/outfit/job/sierra/crew/medical/counselor/mentalist
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

	give_psionic_implant_on_join = FALSE

/datum/job/psychiatrist/equip(var/mob/living/carbon/human/H)
	if(H.mind.role_alt_title == "Counselor")
		psi_faculties = list("[PSI_REDACTION]" = PSI_RANK_OPERANT)
	if(H.mind.role_alt_title == "Mentalist")
		psi_faculties = list("[PSI_COERCION]" = PSI_RANK_OPERANT)
	return ..()

/datum/job/psychiatrist/get_description_blurb()
	return "Вы - друг, наставник, священник... Или обычный психотерапевт. Помимо своих прямых обязанностей в обеспечении \
	персонала качественной (насколько это возможно) психологической помощью, у вас имеется особенность - вы псионически \
	одарены. Корпорация хорошо платит вам за то, чтобы вы проводили псионическое обследования членов экипажа на \
	предмет обладания особыми силами, естественно, с отчетом об этом. Ваша зарплата превышает таковую у \
	среднестатистческого менталиста из Фонда, и, вероятно, не просто так.<hr>В то время, как Менталист склонен к \
	исправлению психологических недугов, поиску псионики и даже чтению мыслей, Советник может проводить медицинскую \
	диагностику и слабое лечение."
