/area/ship/patrol
	icon_state = "shuttle2"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	base_turf = /turf/simulated/floor/plating
	req_access = list(access_away_patrol)

/area/ship/patrol/center
	name = "\improper SP - Operations Center"

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