/datum/map/colony/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/colony/map_info(victim)
	to_chat(victim, "<h2>Информация о карте</h2>")
	to_chat(victim, "Вы находитесь на борту <b>[station_name]</b>, исследовательского судна корпорации НаноТрейзен. Основная миссия вашего объекта - проведение исследований на нейтральной территории, как правило, на известной границе космоса с целью нахождения новых залежей форона, космических объектов, артефактов и останков инопланетных цивилизаций.")
	to_chat(victim, "Охрана судна укомплектована сотрудниками Службы Безопасности НаноТрайзен и частных предприятий.")
	to_chat(victim, "Помимо ЧВК в охране, в остальных отделах также присутствуют подрядчики. Их наняли как выдающихся специалистов в своей области, что превзошли корпоративного кандидата. Как правило, они либо работают на себя (civilian), либо на другую корпорацию (contractor). Полезные ссылки:")
	to_chat(victim, "<a href=\"https://wiki.infinity-ss13.info/index.php?title=Стандартные_процедуры_НТ\">Процедуры НТ</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=Корпоративные_законы\">Регуляции НТ</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=Коды_угрозы_НТ\">Коды угроз НТ</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=Итак,_Вы_хотите_узнать_о_мире_корпораций%3F\">Список корпораций</a>.")
	to_chat(victim, "<br><strong>Внимание! Год игры был изменён. Теперь в игре не 2563, а 2307 (-256 лет).")

/datum/map/colony/send_welcome()
	var/welcome_text = "<center><img src = ntlogo.png /><br /><font size = 3><b>NSV Colony</b> Показания Сенсоров:</font><hr />"
	welcome_text += "Отчет сгенерирован [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "Текущая система: <b>[system_name()]</b><br />"
	welcome_text += "Следующая система для прыжка: <b>[generate_system_name()]</b><br />"
	welcome_text += "Дней до Солнечной Системы: <b>[rand(15,45)]</b><br />"
	welcome_text += "Дней с последнего визита в порт: <b>[rand(60,180)]</b><br />"
	welcome_text += "Результаты сканирования показали следующие потенциальные объекты для исследования:<br />"
	var/list/space_things = list()
	var/obj/effect/overmap/colony = map_sectors["1"]
	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/O = map_sectors[zlevel]
		if(O.name == colony.name)
			continue
		if(istype(O, /obj/effect/overmap/visitable/ship/landable))
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/effect/overmap/O in space_things)
		var/location_desc = " на текущем квадрате."
		if(O.loc != colony.loc)
			var/bearing = round(90 - Atan2(O.x - colony.x, O.y - colony.y),5) //fucking triangles how do they work
			if(bearing < 0)
				bearing += 360
			location_desc = ", по азимуту [bearing]."
		if(O.has_distress_beacon)
			LAZYADD(distress_calls, "[O.has_distress_beacon][location_desc]")
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

	if(LAZYLEN(distress_calls))
		welcome_text += "<br><b>Обнаружены сигналы бедствия:</b><br>[jointext(distress_calls, "<br>")]<br>"
	else
		welcome_text += "<br>Сигналов бедствия не обнаружено.<br />"
	welcome_text += "<hr>"

	post_comm_message("NSV Colony Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
