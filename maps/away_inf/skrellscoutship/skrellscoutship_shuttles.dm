/obj/machinery/computer/shuttle_control/explore/skrellscoutship
	name = "SSV control console"
	req_access = list(access_skrellscoutship)
	shuttle_tag = "Skrellian Scout"

/obj/machinery/computer/shuttle_control/explore/skrellscoutshuttle
	name = "SSV Shuttle control console"
	req_access = list(access_skrellscoutship)
	shuttle_tag = "Skrellian Shuttle"

/obj/effect/overmap/ship/landable/skrellscoutship
	name = "light skrellian vessel"
	shuttle = "Skrellian Scout"
	multiz = 1
	icon_state = "ship"
	moving_state = "ship_moving"
	fore_dir = WEST
	color = "#ff00ff"
	vessel_mass = 1000
	initial_restricted_waypoints = list(
		"Skrellian Shuttle" = list("nav_skrellscoutsh_dock")
	)


/obj/effect/overmap/ship/landable/skrellscoutship/New()
	name = "SSV [pick("Xilvuxix", "Zuuvixix", "Quizuu", "Vulzxixvuu","Quumzoox","Quuvuzxuu")]"
	..()

/obj/effect/overmap/ship/landable/skrellscoutshuttle
	name = "SSV-S"
	shuttle = "Skrellian Shuttle"
	fore_dir = WEST
	color = "#880088"
	vessel_mass = 750

/datum/shuttle/autodock/overmap/skrellscoutship
	name = "Skrellian Scout"
	warmup_time = 5
	multiz = 1
	range = 1
	knockdown = 0
	current_location = "nav_skrellscout_start"
	current_dock_target = "xil_dock"
	shuttle_area = list(
		/area/ship/skrellscoutship/solars, /area/ship/skrellscoutship/crew/quarters, /area/ship/skrellscoutship/crew/hallway/d1,
		/area/ship/skrellscoutship/crew/hallway/d2, /area/ship/skrellscoutship/crew/kitchen, /area/ship/skrellscoutship/crew/toilets,
		/area/ship/skrellscoutship/crew/medbay, /area/ship/skrellscoutship/dock, /area/ship/skrellscoutship/dock/alt,
		/area/ship/skrellscoutship/hangar, /area/ship/skrellscoutship/robotics, /area/ship/skrellscoutship/maintenance/atmos,
		/area/ship/skrellscoutship/maintenance/power, /area/ship/skrellscoutship/command/bridge, /area/ship/skrellscoutship/crew/fit,
		/area/ship/skrellscoutship/command/armory, /area/ship/skrellscoutship/crew/rec
		)
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/hull

/obj/effect/shuttle_landmark/skrellscoutship/start
	name = "Uncharted Space"
	landmark_tag = "nav_skrellscout_start"

/datum/shuttle/autodock/overmap/skrellscoutshuttle
	name = "Skrellian Shuttle"
	warmup_time = 5
	current_location = "nav_skrellscoutsh_dock"
	range = 2
	current_dock_target = "xil_shuttle"
	shuttle_area = /area/ship/skrellscoutshuttle
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/hull
	mothershuttle = "Skrellian Scout"

/obj/effect/shuttle_landmark/skrellscoutshuttle/start
	name = "Dock"
	landmark_tag = "nav_skrellscoutsh_dock"
	base_area = /area/ship/skrellscoutship/hangar
	base_turf = /turf/simulated/floor/tiled/skrell
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/shuttle_landmark/skrellscoutshuttle/altdock
	name = "Docking Port"
	landmark_tag = "nav_skrellscoutsh_altdock"

/*
 * Infinity: Presets from torch (map's author, I hate you)
 */
/obj/machinery/power/apc/shuttle
	req_access = list(access_engine_equip)

/obj/machinery/vending/medical/torch
	req_access = list(access_medical)

/obj/machinery/power/smes/buildable/preset/torch/engine_main
	uncreated_component_parts = list(/obj/item/weapon/stock_parts/smes_coil/super_io = 2,
									/obj/item/weapon/stock_parts/smes_coil/super_capacity = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

/obj/effect/paint/expeditionary
	color = "#68099e"

/*
 * Infinity: Presets from torch: Ending
 */
