/datum/shuttle/autodock/overmap/albatross
	name = "Albatross"
	move_time = 60
	shuttle_area = /area/albatros_hangar/start
	current_location = "nav_hangar_albatross"
	landmark_transition = "nav_transit_albatross"
	dock_target = "albatross_shuttle"
	range = 2

/area/albatros_hangar/start
	name = "\improper Albatross"
	icon_state = "shuttlered"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

/obj/effect/shuttle_landmark/albatross
	name = "Albatross Hangar"
	landmark_tag = "nav_hangar_albatross"
	base_area = /area/ship/patrol/command/hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/albatross/transit
	name = "In transit"
	landmark_tag = "nav_transit_albatross"

/obj/machinery/computer/shuttle_control/albatross/patrol
	name = "Albatross control console"
	shuttle_tag = "Albatross"