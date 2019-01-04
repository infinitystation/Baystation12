/obj/effect/shuttle_landmark/nav_blueriv
	base_area = /area/bluespaceriver/ground
	base_turf = /turf/simulated/floor/exoplanet/snow

/obj/effect/shuttle_landmark/nav_blueriv/nav1
	name = "Arctic Planet Landing Point #1"
	landmark_tag = "nav_blueriv_1"

/obj/effect/shuttle_landmark/nav_blueriv/nav2
	name = "Arctic Planet Landing Point #2"
	landmark_tag = "nav_blueriv_2"

/obj/effect/shuttle_landmark/nav_blueriv/nav3
	name = "Arctic Planet Landing Point #3"
	landmark_tag = "nav_blueriv_3"

/obj/effect/shuttle_landmark/nav_blueriv/nav4
	name = "Arctic Planet Navpoint #4"
	landmark_tag = "nav_blueriv_antag"

/obj/effect/shuttle_landmark/nav_blueriv/blueriver_shuttle
	name = "Arctic Planet Landing Point #4"
	landmark_tag = "nav_blueriver_shuttle"

/datum/shuttle/autodock/overmap/blueriver_shuttle
	name = "Cometa"
	move_time = 90
	shuttle_area = list(/area/bluespaceriver/ship/cockpit, /area/bluespaceriver/ship/power, /area/bluespaceriver/ship/medical, /area/bluespaceriver/ship/cargo, /area/bluespaceriver/ship/restroom, /area/bluespaceriver/ship/storage, /area/bluespaceriver/ship/sec_storage, /area/bluespaceriver/ship/airlock, /area/bluespaceriver/ship/autolathe)
	dock_target = "blueriver_shuttle"
	current_location = "nav_blueriver_shuttle"
	landmark_transition = "nav_transit_blueriver"
	range = 3
	fuel_consumption = 3
	logging_home_tag = "nav_blueriver_shuttle"
	logging_access = list(151)
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	defer_initialisation = TRUE

/obj/machinery/computer/shuttle_control/explore/blueriver_shuttle
	name = "cometa control console"
	shuttle_tag = "Cometa"
	req_access = list(151)
