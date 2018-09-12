#include "gunboat_areas.dm"
#include "gunboat_crew.dm"
#include "gunboat_define.dm"

/obj/effect/overmap/ship/gunboat
	name = "gunboat"
	desc = "Sensor array is detecting a small vessel with heavy armor."
	color = "#ffc966"
	fore_dir = WEST
	vessel_mass = 30
	default_delay = 35 SECONDS
	speed_mod = 5 SECONDS
	start_x = 5
	start_y = 5
	initial_generic_waypoints = list(
		"nav_gunboat_1",
		"nav_gunboat_2",
		"nav_gunboat_3",
		"nav_gunboat_antag"
		)

/obj/effect/overmap/ship/gunboat/New()
	name = "SGC [pick("Bearcat", "Firebug", "Defiant", "Unsinkable","Horizon","Vagrant")]"
	..()

/datum/map_template/ruin/away_site/gunboat
	name = "Sol Gunboat Craft"
	id = "awaysite_gunboat"
	description = "Property of SCG - carrier of torpedos, one laser and a small crew."
	prefix = "maps/away_inf/"
	suffixes = list("gunboat/gunboat-1.dmm", "gunboat/gunboat-2.dmm")
	cost = 1000

/obj/effect/shuttle_landmark/nav_gunboat/nav1
	name = "Gunboat Navpoint #1"
	landmark_tag = "nav_gunboat_1"

/obj/effect/shuttle_landmark/nav_gunboat/nav2
	name = "Gunboat Navpoint #2"
	landmark_tag = "nav_gunboat_2"

/obj/effect/shuttle_landmark/nav_gunboat/nav3
	name = "Gunboat Navpoint #3"
	landmark_tag = "nav_gunboat_3"

/obj/effect/shuttle_landmark/nav_gunboat/nav4
	name = "Gunboat Navpoint #4"
	landmark_tag = "nav_gunboat_antag"
