/datum/map/sierra
	name = "Sierra"
	full_name = "NSV Sierra"
	path = "sierra"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK

	station_levels = list(1,2,3)
	contact_levels = list(1,2,3)
	player_levels = list(1,2,3,6)
	admin_levels = list(4,5)
	empty_levels = list(6)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"6"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("sierra.ec.scg","freemail.nt","sierra.scg")

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

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/nanotrasen
	use_overmap = 1
	num_exoplanets = 0
	planet_size = list(129,129)

	away_site_budget = 0

	id_hud_icons = 'maps/sierra/icons/assignment_hud.dmi'

	citizenship_choices = list(
		"Earth",
		"Luna",
		"Mars",
		"Pluto",
		"Ceti Epsilon",
		"Eos",
		"Tiamat",
		"Terra",
		"Novaya Zemlya",
		"Gaia",
		"Moghes",
		"Ahdomai",
		"Qerrbalak",
		"Tau-Wilo",
		"Avalon",
		"Tersten",
		"Magnitka",
		"Yuklid V",
		"Cinu"
		)

	home_system_choices = list(
		"Sol",
		"Tau Ceti",
		"Helios",
		"Alpha Centuri",
		"Gilgamesh",
		"Galilei",
		"Uuoea-Esa",
		"Zamsiin-lr",
		"Qerr'Valis",
		"XX-168",
		"Klaudof",
		"Gavil",
		"Ursa",
		"Yuklid",
		"Lucinaer"
		)

	faction_choices = list(
		"Sol Central Government",
		"Terran Colonial Confederation",
		"NanoTrasen",
		"Xynergy",
		"Vey Med",
		"Einstein Engines",
		"Ward-Takahashi GMB",
		"Gilthari Exports",
		"Grayson Manufactories Ltd.",
		"Aether Atmospherics",
		"Zeng-Hu Pharmaceuticals",
		"Hephaestus Industries",
		"Free Trade Union",
		"Commonwealth of Ahdomai",
		"Positronic Union"
		)

	religion_choices = list(
		"Jewish",
		"Hinduism",
		"Buddhist",
		"Islamic",
		"Christian",
		"Agnostic",
		"Deist",
		"Athiest",
		"Thelema",
		"Spiritualist"
		)

/datum/map/sierra/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/sierra/map_info(victim)
	to_chat(victim, "<h2>���������&#255; � �����</h2>")
	to_chat(victim, "�� ���������� �� ����� <b>[station_name]</b>, ������������������ ����� ���������� �����������. �������&#255; �����&#255; ������ ������� - ���������� ���������� ������������ �� �������� ���������� �������.� ����� ���������&#255; ����� ����� ������, ����������� ��������, ���������� � �������� ������������ �����������.")
	to_chat(victim, "������ ��������� �����������, �� ����� ����� ������������ ������������� �� ������������� ��������� �������, �����������&#255; ����� ��������� ��������� ����������� �������� � �� ����������� �����������������.")
	to_chat(victim, "������ ����� �������������� �������������� ���������� �� ������������ ������ ������������ ����������� � ������������ ������� �������&#255;��� ���������&#255;���� ������ ����� � ��� ���������, � ��� �� ����������&#255; ���&#255;��� � �������� �� �����������.")


/datum/map/sierra/send_welcome()
	var/welcome_text = "<center><img src = ntlogo.png /><br /><font size = 3><b>NSV Sierra</b> Sensor Readings:</font><hr />"
	welcome_text += "Report generated on [stationdate2text()] at [stationtime2text()]</center><br /><br />"
	welcome_text += "Current system:<br /><b>[system_name()]</b><br />"
	welcome_text += "Next system targeted for jump:<br /><b>[generate_system_name()]</b><br />"
	welcome_text += "Travel time to Sol:<br /><b>[rand(15,45)] days</b><br />"
	welcome_text += "Time since last port visit:<br /><b>[rand(60,180)] days</b><br />"
	welcome_text += "Scan results show the following points of interest:<br />"
	var/list/space_things = list()
	var/obj/effect/overmap/sierra = map_sectors["1"]
	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/O = map_sectors[zlevel]
		if(O.name == sierra.name)
			continue
		space_things |= O

	for(var/obj/effect/overmap/O in space_things)
		var/location_desc = " at present co-ordinates."
		if (O.loc != sierra.loc)
			var/bearing = round(90 - Atan2(O.x - sierra.x, O.y - sierra.y),5) //fucking triangles how do they work
			if(bearing < 0)
				bearing += 360
			location_desc = ", bearing [bearing]."
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"
	welcome_text += "<br>No distress calls logged.<br />"

	post_comm_message("NSV Sierra Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")

/turf/simulated/wall //landlubbers go home
	name = "bulkhead"

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"