/datum/job/captain
	title = "Captain"
	department = "Command"
	supervisors = "корпорацией"
	department_flag = COM
	head_position = 1
	minimal_player_age = 21
	economic_power = 20
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/captain
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	allowed_branches = list(
		/datum/mil_branch/employee
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/nt
	)
	min_skill = list(
		SKILL_BUREAUCRACY	=	SKILL_ADEPT,
		SKILL_PILOT			=	SKILL_ADEPT
	)

	max_skill = list(
		SKILL_PILOT			=	SKILL_MAX
	)


	skill_points = 25

	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/card_mod,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)
	good_genome_prob = 60

/datum/job/captain/get_description_blurb()
	return "Капитан ответственен за ИКН Сьерра и всё, что на нем находится.\
	Его обязанность заключается в том, чтобы убедиться, что ИКН Сьерра выполняет свою миссию и вернется обратно в порт СолПрава в целостности и сохранности.\
	От капитана ожидают проявления эффективных управленческих навыков, чтобы обеспечить бесперебойную работу всех отделов. Он является высшим авторитетом на Сьерре и имеет доступ к любому отсеку на борту, а также возможность выносить приказы практически без ограничений."

/datum/job/hop
	title = "Head of Personnel"
	supervisors = "Капитаном"
	department = "Command"
	department_flag = COM|SRV
	head_position = 1
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	minimal_player_age = 21
	economic_power = 12
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/hop
	allowed_branches = list(
		/datum/mil_branch/employee
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/nt
	)
	min_skill = list(
		SKILL_BUREAUCRACY	=	SKILL_ADEPT,
		SKILL_PILOT			=	SKILL_BASIC
	)

	max_skill = list(
		SKILL_PILOT			=	SKILL_MAX
	)

	skill_points = 20

	access = list(
		access_seceva, access_guard, access_security, access_brig, access_armory,
		access_forensics_lockers, access_heads, access_medical, access_morgue,
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks,
		access_emergency_storage, access_change_ids, access_ai_upload, access_teleporter,
		access_eva, access_bridge, access_all_personal_lockers, access_chapel_office,
		access_tech_storage, access_atmospherics, access_bar, access_janitor, access_crematorium,
		access_robotics, access_kitchen, access_cargo, access_construction, access_chemistry,
		access_cargo_bot, access_hydroponics, access_library, access_virology, access_cmo,
		access_qm, access_network, access_surgery, access_mailsorting, access_heads_vault,
		access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_gateway, access_sec_doors, access_psychiatrist, access_medical_equip, access_gun,
		access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_hangar,
		access_guppy_helm, access_expedition_shuttle_helm, access_explorer, access_el, access_tox,
		access_tox_storage, access_research, access_mining, access_mining_office, access_mining_station,
		access_xenobiology, access_xenoarch, access_petrov, access_petrov_helm, access_actor
	)

	minimal_access = list()

	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/card_mod,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)
	good_genome_prob = 60

/datum/job/hop/get_description_blurb()
	return "В роли Главы Персонала, или ГП, как Вас иногда будут звать, Вы обязаны отвечать за то, чтобы все отделы были укомплектованы персоналом и работали ради прибыли своей корпорации.\
	Вам доверена возможность менять должность и уровни доступа каждого члена экипажа на борту через программу модификации ID-карт, что еще могут делать только капитан и ИИ.\
	Вы также отвечаете за управление отделами снабжения и обслуживания, а также за управление любым персоналом без активного главы. Помните: корпорация рассчитывает на вас!"

/datum/job/rd
	title = "Research Director"
	supervisors = "Капитаном"
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
	allowed_branches = list(
		/datum/mil_branch/employee
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/nt
	)
	min_skill = list(
		SKILL_BUREAUCRACY	=	SKILL_ADEPT,
		SKILL_COMPUTER		=	SKILL_BASIC,
		SKILL_FINANCE		=	SKILL_ADEPT,
		SKILL_BOTANY		=	SKILL_BASIC,
		SKILL_ANATOMY		=	SKILL_BASIC,
		SKILL_DEVICES		=	SKILL_BASIC,
		SKILL_SCIENCE		=	SKILL_ADEPT
	)

	max_skill = list(
		SKILL_ANATOMY		=	SKILL_MAX,
		SKILL_DEVICES		=	SKILL_MAX,
		SKILL_SCIENCE		=	SKILL_MAX
	)
	skill_points = 36

	access = list(
		access_tox, access_tox_storage, access_emergency_storage,
		access_teleporter, access_bridge, access_rd, access_ai_upload,
		access_research, access_robotics, access_mining, access_mining_office,
		access_mining_station, access_xenobiology, access_RC_announce,
		access_keycard_auth, access_xenoarch, access_heads,
		access_sec_doors, access_medical, access_network,
		access_maint_tunnels, access_eva, access_expedition_shuttle, access_expedition_shuttle_helm,
		access_guppy, access_hangar, access_petrov, access_petrov_helm,
		access_guppy_helm
	)

	minimal_access = list()

	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/aidiag,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)
	good_genome_prob = 75

/datum/job/rd/get_description_blurb()
	return "Директор Исследований несет ответственность за рабочую деятельность Научно-Исследовательского Отдела на борту объекта,\
	а также других научных сотрудников, для обеспечения успешного развития корпоративных технологий и получения максимально возможной прибыли с этого развития."

/datum/job/cmo
	title = "Chief Medical Officer"
	supervisors = "Капитаном"
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
	allowed_branches = list(
		/datum/mil_branch/employee
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/nt
	)
	min_skill = list(
		SKILL_BUREAUCRACY	=	SKILL_BASIC,
		SKILL_MEDICAL		=	SKILL_ADEPT,
		SKILL_ANATOMY		=	SKILL_EXPERT,
		SKILL_CHEMISTRY		=	SKILL_BASIC,
		SKILL_VIROLOGY		=	SKILL_BASIC
	)

	max_skill = list(
		SKILL_MEDICAL		=	SKILL_MAX,
		SKILL_ANATOMY		=	SKILL_MAX,
		SKILL_CHEMISTRY		=	SKILL_MAX,
		SKILL_VIROLOGY		=	SKILL_MAX
	)
	skill_points = 36

	access = list(
		access_medical, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_heads,
		access_sec_doors,access_chapel_office, access_crematorium,
		access_chemistry, access_virology, access_cmo, access_surgery,
		access_RC_announce, access_keycard_auth, access_psychiatrist,
		access_medical_equip, access_senmed, access_hangar
	)

	minimal_access = list()

	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/suit_sensors,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)
	good_genome_prob = 55

/datum/job/cmo/get_description_blurb()
	return "Главный врач или CMO, является высшим авторитетом, когда речь заходит о сохранении здоровья экипажа.\
	Он следит за тем, чтобы врачи медотдела эффективно лечили пациентов, чтобы парамедики реагировали на экстренные вызовы, чтобы химики производили необходимые лекарства, и чтобы консультанты оказывали психологическую поддержку.\
	Весь медицинский отдел находится в руках главного врача."

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "Капитаном"
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
	allowed_branches = list(
		/datum/mil_branch/employee
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/nt
	)
	min_skill = list(
		SKILL_BUREAUCRACY	=	SKILL_BASIC,
		SKILL_COMPUTER		=	SKILL_ADEPT,
		SKILL_EVA			=	SKILL_ADEPT,
		SKILL_CONSTRUCTION	=	SKILL_ADEPT,
		SKILL_ELECTRICAL	=	SKILL_ADEPT,
		SKILL_ATMOS			=	SKILL_ADEPT,
		SKILL_ENGINES		=	SKILL_EXPERT
	)

	max_skill = list(
		SKILL_CONSTRUCTION	=	SKILL_MAX,
		SKILL_ELECTRICAL	=	SKILL_MAX,
		SKILL_ATMOS			=	SKILL_MAX,
		SKILL_ENGINES		=	SKILL_MAX
	)
	skill_points = 30

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_ai_upload, access_teleporter, access_eva,
		access_bridge, access_heads,access_tech_storage,
		access_atmospherics, access_janitor, access_construction,
		access_sec_doors, access_medical, access_network, access_ce,
		access_RC_announce, access_keycard_auth, access_tcomsat,
		access_seneng, access_hangar
	)

	minimal_access = list()

	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/ntnetmonitor,
		/datum/computer_file/program/power_monitor,
		/datum/computer_file/program/supermatter_monitor,
		/datum/computer_file/program/alarm_monitor,
		/datum/computer_file/program/atmos_control,
		/datum/computer_file/program/rcon_console,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/shields_monitor,
		/datum/computer_file/program/reports
	)
	good_genome_prob = 65

/datum/job/chief_engineer/get_description_blurb()
	return "Главный инженер - руководитель и администратор инженерного отдела, \
	он командует инженерами, а также требует от них отчеты о проведенных работах. \
	Отвечает за то, что реактор благополучно запустили, что щиты корабля правильно настроили, \
	и что любые механические неисправности устраняются быстро и эффективно."

/datum/job/hos
	title = "Head of Security"
	supervisors = "Капитаном"
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
	min_skill = list(
		SKILL_BUREAUCRACY	=	SKILL_ADEPT,
		SKILL_EVA			=	SKILL_BASIC,
		SKILL_COMBAT		=	SKILL_ADEPT,
		SKILL_WEAPONS		=	SKILL_ADEPT,
		SKILL_FORENSICS		=	SKILL_BASIC
	)

	max_skill = list(
		SKILL_COMBAT	=	SKILL_MAX,
		SKILL_WEAPONS	=	SKILL_MAX,
		SKILL_FORENSICS	=	SKILL_MAX
	)
	skill_points = 28

	access = list(
		access_seceva, access_guard, access_security,
		access_medical, access_brig, access_armory,
		access_forensics_lockers, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge,
		access_heads, access_hos, access_RC_announce,
		access_keycard_auth, access_sec_doors, access_hangar,
		access_gun, access_warden
	)
	minimal_access = list()

	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/digitalwarrant,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)
	good_genome_prob = 80

/datum/job/hos/get_description_blurb()
	return "Глава службы безопасности, или ГСБ, является главой правоохранительных органов и главным защитником членов экипажа на борту корабля.\
	В конечном итоге, его задача - обеспечить, чтобы любые грязные предатели предстали перед судом, чтобы любые враждебные террористические организации были ликвидированы, и чтобы любые опасные чужеродные формы жизни вымывались в ближайший шлюз.\
	Он отвечает за координацию усилий офицеров службы безопасности корабля, чтобы обеспечить быстрое сдерживание любой угрозы, устанавливает патрули, состоящие из робких кадетов \
	отвечает за надзор за деятельностью сержанта для обеспечения соблюдения законов корпорации и за тем,\
	чтобы детектив не скрывал никаких необходимых улик."

/datum/job/iaa
	title = "Internal Affairs Agent"
	department = "Support"
	department_flag = SPT
	total_positions = 2
	spawn_positions = 2
	supervisors = "Центральным Командованием"
	selection_color = "#2f2f7f"
	economic_power = 15
	minimal_player_age = 10
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/research/iaa
	allowed_branches = list(
		/datum/mil_branch/employee
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/nt
	)
	min_skill = list(
		SKILL_BUREAUCRACY	=	SKILL_EXPERT,
		SKILL_FORENSICS		=	SKILL_BASIC,
		SKILL_FINANCE		=	SKILL_BASIC
	)
	skill_points = 20

	access = list(
		access_security, access_sec_doors, access_medical,
		access_iaa, access_research, access_xenoarch,
		access_heads, access_bridge, access_hangar,
		access_petrov, access_commissary, access_maint_tunnels
	)

	minimal_access = list()

	software_on_spawn = list(
		/datum/computer_file/program/reports
	)
	good_genome_prob = 85

/datum/job/iaa/get_description_blurb()
	return "Агент Внутренних Дел - уникальная роль для Вас на борту ИКН Сьерра. Он выступает от лица Центрального Командования NanoTrasen на борту корабля,\
	будучи низшим бюрократом Командования, и высшим - среди экипажа, несет ответственность за его работу и за максимальную прибыльность и безопасность объекта от некомпетентных сотрудников.\
	АВД расследует возможные нарушения Корпоративных законов, связывается с ЦентКоммом NanoTrasen через факс и действует в соответствии с распоряжениями корпорации, проверяет глав,\
	но в отсутствие капитана Агент Внутренних Дел, все ещё, не имеет высшей власти над всеми сотрудниками NanoTrasen на борту.\
	Заполняйте бумаги, следите за прибылью и приказам ЦК - и не переставайте наблюдать."

/datum/job/adjutant
	title = "Adjutant"
	department = "Support"
	department_flag = SPT
	total_positions = 2
	spawn_positions = 2
	supervisors = "Капитаном и остальными главами"
	selection_color = "#2f2f7f"
	minimal_player_age = 18
	economic_power = 7
	ideal_character_age = 24
	outfit_type = /decl/hierarchy/outfit/job/sierra/crew/command/adjutant
	allowed_branches = list(/datum/mil_branch/employee)
	allowed_ranks = list(/datum/mil_rank/civ/nt)
	min_skill = list(
		SKILL_BUREAUCRACY	=	SKILL_BASIC,
		SKILL_PILOT			=	SKILL_ADEPT
	)

	max_skill = list(
		SKILL_PILOT			=	SKILL_MAX
	)

	skill_points = 20


	access = list(
		access_sec_doors, access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
		access_heads, access_bridge, access_janitor, access_kitchen, access_actor, access_cargo,
		access_RC_announce, access_keycard_auth, access_guppy, access_guppy_helm,
		access_external_airlocks, access_expedition_shuttle, access_eva, access_hangar,
		access_explorer, access_expedition_shuttle_helm, access_gun
	)

	minimal_access = list()

	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/suit_sensors,
		/datum/computer_file/program/power_monitor,
		/datum/computer_file/program/supermatter_monitor,
		/datum/computer_file/program/alarm_monitor,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/shields_monitor,
		/datum/computer_file/program/reports,
		/datum/computer_file/program/deck_management
	)
	good_genome_prob = 45

/datum/job/adjutant/get_description_blurb()
	return "Адъютант является помощником для командующего состава и персонала. Он отвечает за мониторинг различных систем и коммуникаций корабля, пилотирование Сьерры и привлечение ко вниманию соответствующего персонала при возникновении проблем или вопросов.\
	Адъютант — хорошее начало для желающих вникнуть в работу командования."
