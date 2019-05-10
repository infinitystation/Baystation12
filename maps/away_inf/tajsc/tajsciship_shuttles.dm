


/obj/effect/overmap/ship/tajsciship
	name = "light tajaran station"
	fore_dir = WEST
	vessel_mass = 64000
	base = TRUE
	color = "#800080"
	icon_state = "ship"
	moving_state = "ship_moving"
	start_x = 23
	start_y = 27
	initial_generic_waypoints = list("nav_tajsciship_start", "nav_tajbase_1", "nav_tajbase_2")
	initial_restricted_waypoints = list(
	"CCA EC Shuttle" = list("nav_tajscishuttle_dock")
	)

/obj/effect/overmap/ship/landable/tajscishuttle
	name = "CCA EC Shuttle"
	shuttle = "CCA EC Shuttle"
	fore_dir = WEST
	color = "#800080"
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS

/datum/shuttle/autodock/overmap/tajscishuttle
	name = "CCA EC Shuttle"
	warmup_time = 5
	shuttle_area = /area/tajsciship/tajscishuttle
	current_location = "nav_tajscishuttle_dock"
	range = 2
	logging_home_tag = "Hangar"
	logging_access =  access_tajsciship
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/sierra
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'

/obj/effect/shuttle_landmark/tajscishuttle/start
	name = "Dock"
	landmark_tag = "nav_tajscishuttle_dock"
	base_area = /area/tajsciship/tajsciship
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/tajscishuttle/nav1
	name = "Space near light station"
	landmark_tag = "nav_tajbase_1"

/obj/effect/shuttle_landmark/tajscishuttle/hang
	name = "Hangar"
	landmark_tag = "nav_tajbase_2"

/*
 * Infinity: Presets from torch (map's author, I hate you) hz che tam nizhe tupo kopipast s zhab da lol
 */
/obj/machinery/power/apc/shuttle
	req_access = list(access_tajsciship)

/obj/machinery/vending/medical/torch
	req_access = list(access_tajsciship)

/obj/machinery/power/smes/buildable/preset/torch/engine_main/configure_and_install_coils()
	component_parts += new /obj/item/weapon/smes_coil/super_io(src)
	component_parts += new /obj/item/weapon/smes_coil/super_io(src)
	component_parts += new /obj/item/weapon/smes_coil/super_capacity(src)
	component_parts += new /obj/item/weapon/smes_coil/super_capacity(src)
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



