// Submap shuttles.
// Mule - Shuttle One, Port Side
/obj/effect/overmap/visitable/ship/landable/mule
	name = "Mule"
	shuttle = "Mule"
	moving_state = "ship_moving"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	fore_dir = SOUTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_SMALL

/obj/machinery/computer/shuttle_control/explore/mule
	name = "shuttle control console"
	shuttle_tag = "Mule"

/obj/effect/shuttle_landmark/mule/start
	name = "Mule Docked"
	landmark_tag = "nav_hangar_mule"
	docking_controller = "mule_port_dock"
	base_area = /area/liberia/Mule
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

//Add Torck Docking Port for Mule
/obj/effect/shuttle_landmark/ascent_seedship/torch/mule
	name = "Mule Docking Port"
	landmark_tag = "nav_mule_altdock"

/datum/shuttle/autodock/overmap/mule
	name = "Mule"
	warmup_time = 5
	current_location = "nav_hangar_mule"
	range = 2
	dock_target = "mule_port_shuttle_dock"
	shuttle_area = /area/liberia/Mule
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_BASIC
