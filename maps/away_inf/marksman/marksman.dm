#include "marksman_areas.dm"
#include "marksman_targets.dm"

	///////////
	//OVERMAP//
	///////////

/obj/effect/overmap/ship/marksman
	name = "Cobra-Class Craft"
	desc = "A drifting SCG military ship. Visible external damage on blue hull."
	color = "#990000"
	fore_dir = WEST
	vessel_mass = 100
	default_delay = 30 SECONDS
	speed_mod = 4 SECONDS
	start_x = 2
	start_y = 2

	initial_generic_waypoints = list(
		"nav_marksman_1",
		"nav_marksman_2",
		"nav_marksman_3",
		"nav_marksman_4",
		"nav_marksman_albatross"
		)

	initial_restricted_waypoints = list(
	"Albatross" = list("nav_marksman_albatross")
		)

/obj/effect/overmap/ship/patrol/New()
	name = "SPC [pick("Marksman","Hammerfish","Grey Hawk","Kalatan","Box","Searcher","Legio")], \a [name]"
	for(var/area/ship/patrol/A)
		A.name = "\improper [name] - [A.name]"
		GLOB.using_map.area_purity_test_exempt_areas += A.type
	..()

/datum/map_template/ruin/away_site/marksman
	name = "Broken Sol Patrol Ship"
	id = "awaysite_patrol_ship_marksman"
	description = "A broken, drifting ship. They had a mission to save SEV Torch's crew."
	prefix = "maps/away_inf/"
	suffixes = list("marksman/marksman-1.dmm", "marksman/marksman-2.dmm")
	cost = 1000

/obj/effect/shuttle_landmark/marksman/nav1
	name = "Drifting Ship Fore"
	landmark_tag = "nav_marksman_1"

/obj/effect/shuttle_landmark/marksman/nav2
	name = "Drifting Ship Aft"
	landmark_tag = "nav_marksman_2"

/obj/effect/shuttle_landmark/marksman/nav3
	name = "Drifting Ship Port"
	landmark_tag = "nav_marksman_3"

/obj/effect/shuttle_landmark/marksman/nav4
	name = "Drifting Ship Starboard"
	landmark_tag = "nav_marksman_4"

/obj/effect/shuttle_landmark/marksman/hangar
	name = "Albatross Hangar"
	landmark_tag = "nav_marksman_albatross"
	base_area = /area/ship/marksman/command/hangar
	base_turf = /turf/simulated/floor/plating