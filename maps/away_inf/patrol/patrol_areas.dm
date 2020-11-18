/area/ship/patrol/operations_center
	name = "\improper SP - Operations Center"
	icon_state = "shuttle2"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	base_turf = /turf/simulated/floor/plating
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	req_access = list(access_away_patrol)

/area/ship/patrol/armory
	name ="\improper SP - Armory"
	icon_state = "shuttlered"
/area/ship/patrol/crew
	name = "\improper SP - Crew Quarters"
	icon_state = "shuttlegrn2"
/area/ship/patrol/medbay
	name = "\improper SP - Medical"
	icon_state = "shuttle3"
/area/ship/patrol/engine
	name = "\improper SP - Engineering"
	icon_state = "shuttlegrn"
/area/ship/patrol/storage
	name = "\improper SP - Storage Hallway"
/area/ship/patrol/cockpit
	name = "\improper SP - Cockpit"
	icon_state = "shuttle"
	req_access = list(access_away_patrol_captain)
/area/ship/patrol/hallway
	name = "\improper SP - Main Hallway"
	icon_state = "shuttlered2"
