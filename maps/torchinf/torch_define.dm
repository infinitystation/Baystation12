/datum/map/torch
	name = "Torch"
	full_name = "SEV Torch"
	path = "torch"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK

	admin_levels = list(7,8)
	empty_levels = list(9)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1,"4"=1,"5"=1,"6"=1,"9"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("torch.ec.scg", "torch.fleet.mil", "freemail.net", "torch.scg")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "SEV Torch"
	station_short = "Torch"
	dock_name     = "TBD"
	boss_name     = "Expeditionary Command"
	boss_short    = "Command"
	company_name  = "Sol Central Government"
	company_short = "SolGov"

	map_admin_faxes = list("Corporate Central Office")

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	num_exoplanets = 0
	planet_size = list(129,129)

	away_site_budget = 2
	id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'

/datum/map/torch/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/torch/map_info(victim)
	to_chat(victim, "<h2>Current map information</h2>")
	to_chat(victim, "Вы находитесь на борту [station_name] - корабле Экспедиционного Корпуса ЦПСС. Основной задачей корабл&#255; &#255;вл&#255;етс&#255; поиск неизвестных разумных форм жизни и исследование космоса.")
	to_chat(victim, "Корабль укомплектован персоналом из ЦПСС, сотрудниками Организации Экспедиционного Корпуса и наемными контрактниками.")
	to_chat(victim, "Это неисследованна&#255; область космического пространства вдали от территории ЦПСС, поэтому Вы можете встретить лишь небольшие аванпосты и дрейфующие суда. Ни одно известное правительство не претендует на этот сектор.")
	to_chat(victim, "Полезные статьи:")
	to_chat(victim, "Устав (руководство по военке): https://wiki.infinity-ss13.info/index.php?title=Руководство_военного")
	to_chat(victim, "Военный закон: https://wiki.infinity-ss13.info/index.php?title=Военно-юридический_кодекс_ПСС")
	to_chat(victim, "Закон ЦПСС: https://wiki.infinity-ss13.info/index.php?title=Закон_ЦПСС")
	to_chat(victim, "Униформа экипажа: https://wiki.infinity-ss13.info/index.php?title=Униформа_экипажа")

/datum/map/torch/send_welcome()
	var/welcome_text = "<center><img src = sollogo.png /><br /><font size = 3><b>SEV Torch</b> Показани&#255; Сенсоров:</font><hr />"
	welcome_text += "Отчет сгенерирован [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "Текуща&#255; система: <b>[system_name()]</b><br />"
	welcome_text += "Следующа&#255; система дл&#255; прыжка: <b>[generate_system_name()]</b><br />"
	welcome_text += "Дней до Солнечной Системы: <b>[rand(15,45)]</b><br />"
	welcome_text += "Дней с последнего визита в порт: <b>[rand(60,180)]</b><br />"
	welcome_text += "Результаты сканировани&#255; показали следующие потенциальные объекты дл&#255; исследовани&#255;:<br />"
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
		if(O.has_distress_beacon)
			LAZYADD(distress_calls, "[O.has_distress_beacon][location_desc]")
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

	if(LAZYLEN(distress_calls))
		welcome_text += "<br><b>Обнаружены сигналы бедстви&#255;:</b><br>[jointext(distress_calls, "<br>")]<br>"
	else
		welcome_text += "<br>Сигналов бедстви&#255; не обнаружено.<br />"
	welcome_text += "<hr>"

	post_comm_message("SEV Torch Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")

/turf/simulated/wall //landlubbers go home
	name = "bulkhead"

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"

/obj/machinery/computer/rdconsole/petrov
	name = "petrov fabricator console"
	id = 3

/turf/simulated/floor/shuttle_ceiling/torch
	color = COLOR_HULL

/turf/simulated/floor/shuttle_ceiling/torch/air
	initial_gas = list("oxygen" = MOLES_O2STANDARD, "nitrogen" = MOLES_N2STANDARD)