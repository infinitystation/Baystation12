/datum/map_template/ruin/away_site/mining_asteroid
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/data_capsule)

/obj/effect/shuttle_landmark/mining/nav_hiden
	name = "Mining Asteroid ???"
	landmark_tag = "nav_mining_hiden"
	base_area = /area/mine/unexplored
	base_turf = /turf/simulated/floor/asteroid

/area/shuttle/abadoned_data_capsule
	name = "Data Capsule"
	icon_state = "shuttlegrn"
	requires_power = 1
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/datum/shuttle/autodock/overmap/data_capsule
	name = "Data Capsule"
	move_time = 30
	shuttle_area = list(/area/shuttle/abadoned_data_capsule)
	current_location = "nav_mining_hiden"
	landmark_transition = "nav_transit_blueriver"

	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'

	range = 1
	fuel_consumption = 2
	warmup_time = 5
	defer_initialisation = TRUE
	skill_needed = SKILL_BASIC

	ceiling_type = /turf/simulated/floor/shuttle_ceiling


/obj/machinery/computer/shuttle_control/explore/data_capsule
	name = "data capsule control console"
	shuttle_tag = "Data Capsule"

/obj/effect/overmap/visitable/ship/landable/data_capsule
	name = "Data Capsule"
	shuttle = "Data Capsule"
	max_speed = 1/10
	burn_delay = 2 SECONDS
	vessel_mass = 250
	fore_dir = SOUTH
	vessel_size = SHIP_SIZE_TINY
	skill_needed = SKILL_BASIC
