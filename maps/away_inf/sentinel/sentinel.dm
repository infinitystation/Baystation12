#include "sentinel_areas.dm"
#include "sentinel_crew.dm"
#include "sentinel_datums.dm"
#include "sentinel_items.dm"
#include "sentinel_presets.dm"
#include "sentinel_shuttle.dm"
#include "sentinel_structures.dm"
#include "sentinel_turbolift.dm"

	///////////
	//OVERMAP//
	///////////

/obj/effect/overmap/ship/patrol
	name = "Cobra-Class Craft"
	color = "#990000"
	fore_dir = WEST
	vessel_mass = 100
	default_delay = 30 SECONDS
	speed_mod = 4 SECONDS
	start_x = 2
	start_y = 2

	initial_generic_waypoints = list(
		"nav_patrol_1",
		"nav_patrol_2",
		"nav_patrol_3",
		"nav_patrol_4",
		"nav_hangar_albatross"
		)

	initial_restricted_waypoints = list(
	"Albatross" = list("nav_hangar_albatross")
		)

/obj/effect/overmap/ship/patrol/New()
	name = "SPC [pick("Sentinel","Swordfish","Rescuer","Cavalry","Anchor","Scarabaeus","Purposeful","Helios")], \a [name]"
	for(var/area/ship/patrol/A)
		A.name = "\improper [name] - [A.name]"
		GLOB.using_map.area_purity_test_exempt_areas += A.type
	..()


/datum/map_template/ruin/away_site/patrol
	name = "Sol Patrol Ship (ERT)"
	id = "awaysite_patrol_ship"
	description = "A saviour for souls of SEV Torch's crew."
	prefix = "maps/away_inf/"
	suffixes = list("sentinel/sentinel-1.dmm", "sentinel/sentinel-2.dmm")
	cost = 1000
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/albatross)


/obj/effect/shuttle_landmark/nav_patrol/nav1
	name = "Patrol Ship Fore"
	landmark_tag = "nav_patrol_1"

/obj/effect/shuttle_landmark/nav_patrol/nav2
	name = "Patrol Ship Aft"
	landmark_tag = "nav_patrol_2"

/obj/effect/shuttle_landmark/nav_patrol/nav3
	name = "Patrol Ship Port"
	landmark_tag = "nav_patrol_3"

/obj/effect/shuttle_landmark/nav_patrol/nav4
	name = "Patrol Ship Starboard"
	landmark_tag = "nav_patrol_4"

/obj/machinery/door/airlock/autoname/command
	icon = 'icons/obj/doors/Doorhatchele.dmi'
	req_access = list(access_heads)

/obj/machinery/door/airlock/autoname/engineering
	req_access = list(access_engine)

/obj/machinery/door/airlock/autoname/marine
	req_access = list(access_security)

/obj/machinery/computer/shuttle_control/explore/albatross
	name = "albatross control console"
	shuttle_tag = "Albatross"
	req_access = list(access_albatross)
