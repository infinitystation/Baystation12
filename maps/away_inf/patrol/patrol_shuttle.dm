/obj/effect/overmap/visitable/ship/landable/patrol
	name = "Sol Patrol Corvette"
	desc = "Космический объект шириной 19,5 метра, длиной 34,2 метра и высотой около 4,3 метра. \
	Сигнал самоидентификации классифицирует цель как Sol Patrol Corvet, собственность третьего флота \
	оборонительных сил ЦПСС. Патрульный корверт \"Страж\"."
	shuttle = "Sol Patrol Corvette"
//	color = "#990000"
	fore_dir = EAST
	vessel_mass = 4400

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
	shuttle_tag = "Sol Patrol Corvette"

/obj/effect/shuttle_landmark/scgpatrol
	name = "Uncharted Space"
	landmark_tag = "nav_scgpatrol_start"

/turf/simulated/floor/shuttle_ceiling/hull
	color = COLOR_HULL

#undef WEBHOOK_SUBMAP_LOADED_SOL