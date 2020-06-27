/obj/effect/overmap/visitable/ship/landable/patrol
	name = "Sol Rescue Shuttle"
	desc = "A space object with wide of 19.5 meters, length of 34.2 meters and high near 4.3 meters. \
	A Self Indentification Signal classifices the target as Sol Rescue Shuttle, a property of third fleet of \
	Sol Central Government  Defencive Forces. Additional signature reports about the mothership, \
	Sol Patrol Ship \"Sentinel\"."
	shuttle = "Sol Rescue Shuttle"
//	color = "#990000"
	fore_dir = EAST
	vessel_mass = 400

/datum/shuttle/autodock/overmap/scgpatrol
	name = "Sol Rescue Shuttle"
	warmup_time = 5
	current_location = "nav_scgpatrol_start"
	range = 2
	shuttle_area = list(/area/ship/patrol/cargo,
						/area/ship/patrol/medbay,
						/area/ship/patrol/atmos,
						/area/ship/patrol/power,
						/area/ship/patrol/cockpit,
						/area/ship/patrol/airlock)
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/hull

/obj/machinery/computer/shuttle_control/explore/scgpatrol
	name = "shuttle control console"
	req_access = list(access_away_patrol)
	shuttle_tag = "Sol Rescue Shuttle"

/obj/effect/shuttle_landmark/scgpatrol
	name = "Uncharted Space"
	landmark_tag = "nav_scgpatrol_start"

/turf/simulated/floor/shuttle_ceiling/hull
	color = COLOR_HULL

#undef WEBHOOK_SUBMAP_LOADED_SOL
