/datum/shuttle/autodock/overmap/albatross
	name = "Albatross"
	warmup_time = 15
	move_time = 60
	shuttle_area = /area/albatros_hangar/start
	current_location = "nav_hangar_albatross"
	landmark_transition = "nav_transit_albatross"
	dock_target = "albatross_shuttle"
	range = 2
	defer_initialisation = TRUE

/area/albatros_hangar/start
	name = "\improper Albatross"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

	////////
	//TAGS//
	////////

/obj/effect/shuttle_landmark/albatross/hangar
	name = "Albatross Hangar"
	landmark_tag = "nav_hangar_albatross"
	base_area = /area/ship/patrol/command/hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/albatross/transit
	name = "In transit"
	landmark_tag = "nav_transit_albatross"

/obj/effect/shuttle_landmark/albatross/tdock
	name = "SEV Torch Dock"
	landmark_tag = "nav_albatross_dock"
	docking_controller = "nuke_shuttle_dock_airlock"




/obj/effect/shuttle_landmark/nav_patrol/nav1
	name = "Patrol Ship Fore"
	landmark_tag = "nav_patrol_1"

/obj/effect/shuttle_landmark/nav_patrol/nav2
	name = "Patrol Ship Aft"
	landmark_tag = "nav_patrol_2"

/obj/effect/shuttle_landmark/nav_patrol/nav3
	name = "Patrol Ship Port"
	landmark_tag = "nav_patrol_3"

/obj/effect/shuttle_landmark/nav_patrol/nav4
	name = "Patrol Ship Starboard"
	landmark_tag = "nav_patrol_4"