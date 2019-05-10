/obj/machinery/computer/shuttle_control/explore/tajsciship
	name = "CCA EC Ship control console"
	req_access = list(access_tajsciship)
	shuttle_tag = "CCA NSV"

/obj/machinery/computer/shuttle_control/explore/tajscisshuttle
	name = "CCA EC shuttle control console"
	req_access = list(access_tajsciship)
	shuttle_tag = "CCA EC Shuttle"

/obj/effect/overmap/ship/landable/tajsciship
	name = "light tajaran station"
	shuttle = "CCA NSV"
	fore_dir = WEST
	vessel_mass = 80000
	base = TRUE
	color = "#800080"
	icon_state = "ship"
	moving_state = "ship_moving"


/obj/effect/overmap/ship/landable/tajsciship/New()
	name = "CCA NSV Ir'Shira-13"
	..()

/obj/effect/overmap/ship/landable/tajscishuttle
	name = "CCA EC Shuttle"
	shuttle = "CCA EC Shuttle"
	fore_dir = WEST
	color = "#800080"
	vessel_mass = 15000

/datum/shuttle/autodock/overmap/tajsciship
	name = "CCA NSV"
	warmup_time = 5
	multiz = 1
	range = 1
	knockdown = 0 //INFINITY'S CHANGE!
	current_location = "nav_tajsciship_start"
	current_dock_target = "tajsciship_dock"
	shuttle_area = list(/area/tajsciship/tajsciship, /area/tajsciship/dorms, /area/tajsciship/meatbay,
	/area/tajsciship/botany, /area/tajsciship/kitchen, /area/tajsciship/hangar, /area/tajsciship/engines,
	/area/tajsciship/sklad1, /area/tajsciship/solari, /area/tajsciship/tajscishuttle)
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/torch

/obj/effect/shuttle_landmark/tajsciship/start
	name = "Start Zone"
	landmark_tag = "nav_tajsciship_start"

/datum/shuttle/autodock/overmap/tajscishuttle
	name = "CCA EC Shuttle"
	warmup_time = 5
	current_location = "nav_tajscishuttle_dock"
	range = 2
	current_dock_target = "tajsciship_shuttle"
	shuttle_area = /area/tajsciship/tajscishuttle
	logging_home_tag = "nav_tajscishuttle_dock"
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/torch
	mothershuttle = "CCA NSV"

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



