#include "../away/ascent_caulship/_ascent_caulship.dm"

//		Non-Torch files, that requires Torch. Shame on you...
#include "items\clothing\solgov-infinity.dm"

/datum/map/torch
	minimum_players = 10

#define HUMAN_ONLY_JOBS /datum/job/captain, /datum/job/hop, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos, /datum/job/representative, /datum/job/sea, /datum/job/pathfinder
	species_to_job_blacklist = list(
		/datum/species/unathi         = list(HUMAN_ONLY_JOBS, /datum/job/liaison, /datum/job/warden),
		/datum/species/unathi/erosan  = list(HUMAN_ONLY_JOBS, /datum/job/liaison, /datum/job/warden),
		/datum/species/skrell  = list(HUMAN_ONLY_JOBS),
		/datum/species/machine = list(HUMAN_ONLY_JOBS),
		/datum/species/tajaran = list(HUMAN_ONLY_JOBS),
		/datum/species/diona   = list(HUMAN_ONLY_JOBS, /datum/job/officer, /datum/job/rd, /datum/job/liaison, /datum/job/warden),
		/datum/species/resomi  = list(HUMAN_ONLY_JOBS, /datum/job/officer, /datum/job/rd, /datum/job/liaison, /datum/job/warden),
	)
#undef HUMAN_ONLY_JOBS
	species_to_branch_whitelist = list(
		/datum/species/diona          = list(/datum/mil_branch/civilian),
		/datum/species/nabber         = list(/datum/mil_branch/civilian),
		/datum/species/skrell         = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps, /datum/mil_branch/skrell_fleet),
		/datum/species/unathi         = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
		/datum/species/unathi/erosan  = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
		/datum/species/adherent       = list(/datum/mil_branch/civilian),
		/datum/species/vox            = list(/datum/mil_branch/alien),
		/datum/species/tajaran        = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
		/datum/species/resomi         = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
	)
	species_to_rank_whitelist = list(
		/datum/species/machine = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/e7,
				/datum/mil_rank/ec/o1
			),
			/datum/mil_branch/fleet = list(
				/datum/mil_rank/fleet/e1,
				/datum/mil_rank/fleet/e2,
				/datum/mil_rank/fleet/e3,
				/datum/mil_rank/fleet/e4,
				/datum/mil_rank/fleet/e5,
				/datum/mil_rank/fleet/e6,
				/datum/mil_rank/fleet/e7,
				/datum/mil_rank/fleet/o1
			),
			/datum/mil_branch/solgov = list(
				/datum/mil_rank/sol/agent
			)
		),
		/datum/species/skrell = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/e7,
				/datum/mil_rank/ec/o1
			)
		),
		/datum/species/tajaran = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/e7,
				/datum/mil_rank/ec/o1
			)
		),
		/datum/species/unathi = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5
			)
		),
		/datum/species/unathi/erosan = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5
			)
		),
		/datum/species/resomi = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5
			)
		),
		/datum/species/vox = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		)
	)

/datum/map/torch/setup_job_lists()
	for(var/job_type in allowed_jobs)
		var/datum/job/job = SSjobs.get_by_path(job_type)
		// Most species are restricted from SCG security and command roles
		if(job && (job.department_flag & COM) && job.allowed_branches.len && !(/datum/mil_branch/civilian in job.allowed_branches))
			for(var/species_name in list(SPECIES_IPC, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_RESOMI, SPECIES_TAJARA))
				var/datum/species/S = all_species[species_name]
				var/species_blacklist = species_to_job_blacklist[S.type]
				if(!species_blacklist)
					species_blacklist = list()
					species_to_job_blacklist[S.type] = species_blacklist
				species_blacklist |= job.type

/datum/map/torch/map_info(victim)
	to_chat(victim, "<h2>Информация о карте</h2>")
	to_chat(victim, "Вы находитесь на борту [station_name] - корабле Экспедиционного Корпуса ЦПСС. Основной задачей корабля является поиск неизвестных разумных форм жизни и исследование космоса.")
	to_chat(victim, "Корабль укомплектован персоналом из ЦПСС, сотрудниками Организации Экспедиционного Корпуса и наемными контрактниками.")
	to_chat(victim, "Это неисследованная область космического пространства вдали от территории ЦПСС, поэтому Вы можете встретить лишь небольшие аванпосты и дрейфующие суда. Ни одно известное правительство не претендует на этот сектор.")
	to_chat(victim, "<b>Полезные статьи:</b>")
	to_chat(victim, "Устав (руководство по военке): https://sierra.ss220.space/index.php?title=Руководство_военного")
	to_chat(victim, "Закон ЦПСС (действует на борту): https://sierra.ss220.space/index.php?title=Закон_ЦПСС")
	to_chat(victim, "Доп.закон для военных: https://sierra.ss220.space/index.php?title=Военно-юридический_кодекс_ПСС")
	to_chat(victim, "Униформа экипажа: https://sierra.ss220.space/index.php?title=Униформа_экипажа")

/datum/map/torch/send_welcome()
	var/welcome_text = "<center><img src = sollogo.png /><br /><font size = 3><b>SEV Torch</b> Показания Сенсоров:</font><hr />"
	welcome_text += "Отчет сгенерирован [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "Текущая система: <b>[system_name()]</b><br />"
	welcome_text += "Следующая система для прыжка: <b>[generate_system_name()]</b><br />"
	welcome_text += "Дней до Солнечной Системы: <b>[rand(15,45)]</b><br />"
	welcome_text += "Дней с последнего визита в порт: <b>[rand(60,180)]</b><br />"
	welcome_text += "Результаты сканирования показали следующие потенциальные объекты для исследования:<br />"
	var/list/space_things = list()
	var/obj/effect/overmap/torch = map_sectors["1"]
	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/O = map_sectors[zlevel]
		if(O.name == torch.name)
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/effect/overmap/O in space_things)
		var/location_desc = " на текущем квадрате."
		if(O.loc != torch.loc)
			var/bearing = round(90 - Atan2(O.x - torch.x, O.y - torch.y),5) //fucking triangles how do they work
			if(bearing < 0)
				bearing += 360
			location_desc = ", по азимуту [bearing]."
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

	if(LAZYLEN(distress_calls))
		welcome_text += "<br><b>Обнаружены сигналы бедствия:</b><br>[jointext(distress_calls, "<br>")]<br>"
	else
		welcome_text += "<br>Сигналов бедствия не обнаружено.<br />"
	welcome_text += "<hr>"

	post_comm_message("SEV Torch Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
