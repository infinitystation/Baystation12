#include "yacht_areas.dm"

/obj/effect/overmap/ship/yacht
	name = "Small ship"
	desc = "Sensor array is detecting a small vessel with unknown lifeforms on board"
	name = "Yacht"
	color = "#FFC966"
	vessel_mass = 30
	default_delay = 35 SECONDS
	speed_mod = 10 SECONDS

	restricted_waypoints = list(
		"Aquila" = list("nav_yacht_aquila")
	)

	generic_waypoints = list(
		"nav_yacht_1",
		"nav_yacht_2",
		"nav_yacht_3",
		"nav_yacht_antag"
	)

/datum/map_template/ruin/away_site/yacht
	name = "Yacht"
	id = "awaysite_yach"
	description = "Tiny movable ship with spiders."
	suffixes = list("yacht/yacht.dmm")
	cost = 1

/obj/effect/shuttle_landmark/nav_yacht/nav1
	name = "Small Yacht Navpoint #1"
	landmark_tag = "nav_yacht_1"

/obj/effect/shuttle_landmark/nav_yacht/nav2
	name = "Small Yacht Navpoint #2"
	landmark_tag = "nav_yacht_2"

/obj/effect/shuttle_landmark/nav_yacht/nav3
	name = "Small Yacht Navpoint #3"
	landmark_tag = "nav_yacht_3"

/obj/effect/shuttle_landmark/nav_yacht/aquila
	name = "Small Yacht Navpoint Aquila Dock"
	landmark_tag = "nav_yacht_aquila"

/obj/effect/shuttle_landmark/nav_yacht/nav4
	name = "Small Yacht Navpoint #4"
	landmark_tag = "nav_yacht_antag"
