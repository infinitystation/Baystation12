#include "yacht_areas.dm"

/obj/effect/overmap/visitable/ship/yacht
	name = "private yacht"
	desc = "Sensor array is detecting a small vessel with unknown lifeforms on board"
	color = "#ffc966"
	vessel_mass = 3000
	max_speed = 1/(2 SECONDS)

	initial_restricted_waypoints = list(
		"Charon" = list("nav_yacht_charon")
	)

	initial_generic_waypoints = list(
		"nav_yacht_1",
		"nav_yacht_2",
		"nav_yacht_3",
		"nav_yacht_antag"
	)

/obj/effect/overmap/visitable/ship/yacht/New(nloc, max_x, max_y)
	name = "IPV [pick("Razorshark", "Aurora", "Lighting", "Pequod", "Anansi")], \a [name]"
	..()

/datum/map_template/ruin/away_site/yacht
	name = "Yacht"
	id = "awaysite_yach"
	description = "Tiny movable ship with ~spiders~ riches."
	prefix = "maps/away_inf/"
	suffixes = list("yacht/yacht.dmm")
	cost = 0.5
	area_usage_test_exempted_root_areas = list(/area/yacht)

/obj/effect/shuttle_landmark/nav_yacht/nav1
	name = "Small Yacht Navpoint #1"
	landmark_tag = "nav_yacht_1"

/obj/effect/shuttle_landmark/nav_yacht/nav2
	name = "Small Yacht Navpoint #2"
	landmark_tag = "nav_yacht_2"

/obj/effect/shuttle_landmark/nav_yacht/nav3
	name = "Small Yacht Navpoint #3"
	landmark_tag = "nav_yacht_3"

/obj/effect/shuttle_landmark/nav_yacht/aquila
	name = "Small Yacht Navpoint Charon Dock"
	landmark_tag = "nav_yacht_charon"

/obj/effect/shuttle_landmark/nav_yacht/nav4
	name = "Small Yacht Navpoint #4"
	landmark_tag = "nav_yacht_antag"

/decl/submap_archetype/yacht
	descriptor = "established yacht"
	crew_jobs = list(/datum/job/submap/yachtman)

/datum/job/submap/yachtman
	title = "Yachtman"
	info = "Ты, устав от богатой жизни, с друзьями путешествуешь по бескрайнему космосу, в поисках интересной жизни."
	total_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/yachtman

/decl/hierarchy/outfit/job/yachtman
	name = OUTFIT_JOB_NAME("Yachtman")
	id_type = null
	pda_type = null

/obj/effect/submap_landmark/spawnpoint/yachtman_spawn
	name = "Yachtman"

/obj/effect/submap_landmark/joinable_submap/yachtman
	name = "established yacht"
	archetype = /decl/submap_archetype/yacht

/obj/machinery/power/smes/buildable/preset/yacht
	uncreated_component_parts = list(
		/obj/item/weapon/stock_parts/smes_coil/super_io = 2,
		/obj/item/weapon/stock_parts/smes_coil/super_capacity = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

/obj/machinery/power/apc/yacht
	req_access = list()

/obj/machinery/alarm/yacht
	req_access = list()
