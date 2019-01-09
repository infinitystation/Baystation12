/datum/map/sierra
	name = "Sierra"
	full_name = "NSV Sierra"
	path = "sierra"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK

	load_legacy_saves = TRUE

	station_levels = list(1,2,3)
	contact_levels = list(1,2,3)
	player_levels = list(1,2,3,6)
	admin_levels = list(4,5)
	empty_levels = list(6)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"6"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("freemail.net")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "NSV Sierra"
	station_short = "Sierra"
	dock_name     = "TBD"
	boss_name     = "Central Command"
	boss_short    = "Centcomm"
	company_name  = "NanoTrasen"
	company_short = "NT"

	map_admin_faxes = list("NanoTrasen Central Office")

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/nanotrasen
	use_overmap = 1
	num_exoplanets = 1
	planet_size = list(129,129)

	away_site_budget = 2
	id_hud_icons = 'maps/sierra/icons/assignment_hud.dmi'

	available_cultural_info = list(
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_VENUS,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_HELIOS,
			HOME_SYSTEM_TERRA,
			HOME_SYSTEM_TERSTEN,
			HOME_SYSTEM_LORRIMAN,
			HOME_SYSTEM_CINU,
			HOME_SYSTEM_YUKLID,
			HOME_SYSTEM_LORDANIA,
			HOME_SYSTEM_KINGSTON,
			HOME_SYSTEM_GAIA,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_SOL_CENTRAL,
			FACTION_TERRAN_CONFED,
			FACTION_NANOTRASEN,
			FACTION_HEPHAESTUS,
			FACTION_WARD_TAKAHASHI,
			FACTION_SEPTENERGO,
			FACTION_FOCAL_POINT,
			FACTION_AERTHER,
			FACTION_DAIS,
			FACTION_XION,
			FACTION_GRAYSON,
			FACTION_MAJOR_BILL,
			FACTION_BISHOP,
			FACTION_MORPHEUS,
			FACTION_VEY_MED,
			FACTION_ZENG_HU,
			FACTION_ZPCI,
			FACTION_PCRC,
			FACTION_SAARE,
			FACTION_SCP,
			FACTION_XYNERGY,
			FACTION_FREETRADE,
			FACTION_OTHER
		),
		TAG_CULTURE = list(
			CULTURE_HUMAN,
			CULTURE_HUMAN_MARTIAN,
			CULTURE_HUMAN_MARSTUN,
			CULTURE_HUMAN_LUNAPOOR,
			CULTURE_HUMAN_LUNARICH,
			CULTURE_HUMAN_VENUSIAN,
			CULTURE_HUMAN_VENUSLOW,
			CULTURE_HUMAN_BELTER,
			CULTURE_HUMAN_PLUTO,
			CULTURE_HUMAN_EARTH,
			CULTURE_HUMAN_CETI,
			CULTURE_HUMAN_SPACER,
			CULTURE_HUMAN_SPAFRO,
			CULTURE_HUMAN_CONFED,
			CULTURE_HUMAN_OTHER,
			CULTURE_OTHER
		),
		TAG_RELIGION = list(
			RELIGION_OTHER,
			RELIGION_JUDAISM,
			RELIGION_HINDUISM,
			RELIGION_BUDDHISM,
			RELIGION_ISLAM,
			RELIGION_CHRISTIANITY,
			RELIGION_AGNOSTICISM,
			RELIGION_DEISM,
			RELIGION_ATHEISM,
			RELIGION_THELEMA,
			RELIGION_SPIRITUALISM
		),
		TAG_EDUCATION = list(
			EDUCATION_NONE,
			EDUCATION_DROPOUT,
			EDUCATION_HIGH_SCHOOL,
			EDUCATION_TRADE_SCHOOL,
			EDUCATION_UNDERGRAD,
			EDUCATION_MASTERS,
			EDUCATION_DOCTORATE,
			EDUCATION_MEDSCHOOL
		)
	)

/datum/map/sierra/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/sierra/map_info(victim)
	to_chat(victim, "<h2>Информаци&#255; о карте</h2>")
	to_chat(victim, "Вы находитесь на борту <b>[station_name]</b>, исследовательского судна корпорации НаноТрейзен. Основна&#255; мисси&#255; вашего объекта - проведение исследований на нейтральной территории, как правило, на известной границе космоса с целью нахождени&#255; новых залежей форона, космических объектов, артефактов и останков инопланетных цивилизаций.")
	to_chat(victim, "Охрана судна укомплектована сотрудниками Службы Безопасности НаноТрайзен и частных предпри&#255;тий.")
	to_chat(victim, "Помимо ЧВК в охране, в остальных отделах также присутствуют подр&#255;дчики. Их нан&#255;ли как выдающихс&#255; специалистов в своей области, что превзошли корпоративного кандидата. Как правило, они либо работают на себ&#255; (civilian), либо на другую корпорацию (contractor). Полезные ссылки:")
	to_chat(victim, "<a href=\"https://wiki.infinity-ss13.info/index.php?title=Стандартные_процедуры_НТ\">Процедуры НТ</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=Корпоративные_законы\">Регул&#255;ции НТ</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=Коды_угрозы_НТ\">Коды угроз НТ</a>, <a href=\"https://wiki.infinity-ss13.info/index.php?title=Итак,_Вы_хотите_узнать_о_мире_корпораций%3F\">Список корпораций</a>.")
	to_chat(victim, "Техническа&#255; информаци&#255;: если у вас не играет музыка от инструментов и проигрывателей, то вам стоит откатить версию бьенда с самой последней до 1456.")

/datum/map/sierra/send_welcome()
	var/welcome_text = "<center><img src = ntlogo.png /><br /><font size = 3><b>NSV Sierra</b> Показани&#255; Сенсоров:</font><hr />"
	welcome_text += "Отчет сгенерирован [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "Текуща&#255; система: <b>[system_name()]</b><br />"
	welcome_text += "Следующа&#255; система дл&#255; прыжка: <b>[generate_system_name()]</b><br />"
	welcome_text += "Дней до Солнечной Системы: <b>[rand(15,45)]</b><br />"
	welcome_text += "Дней с последнего визита в порт: <b>[rand(60,180)]</b><br />"
	welcome_text += "Результаты сканировани&#255; показали следующие потенциальные объекты дл&#255; исследовани&#255;:<br />"
	var/list/space_things = list()
	var/obj/effect/overmap/sierra = map_sectors["1"]
	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/O = map_sectors[zlevel]
		if(O.name == sierra.name)
			continue
		if(istype(O, /obj/effect/overmap/ship/landable))
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/effect/overmap/O in space_things)
		var/location_desc = " на текущем квадрате."
		if(O.loc != sierra.loc)
			var/bearing = round(90 - Atan2(O.x - sierra.x, O.y - sierra.y),5) //fucking triangles how do they work
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

	post_comm_message("NSV Sierra Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
