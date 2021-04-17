#include "sentinel_areas.dm"
#include "sentinel_crew.dm"
#include "sentinel_items.dm"
#include "sentinel_presets.dm"
#include "sentinel_shuttle.dm"
#include "sentinel_structures.dm"
#include "sentinel_turbolift.dm"

	///////////
	//OVERMAP//
	///////////

/obj/effect/overmap/visitable/ship/patrol
	name = "Multipurpose Patrol Craft"
	desc = "Nagashino-class Multipurpose Patrol Craft. Fine example of human fleet brilliant technologies with 5th Fleet designation and massive heat footprint."
	color = "#990000"
	fore_dir = WEST
	vessel_mass = 500
	vessel_size = SHIP_SIZE_SMALL
	start_x = 1
	start_y = 1

	initial_generic_waypoints = list(
		"nav_patrol_1",
		"nav_patrol_2",
		"nav_patrol_3",
		"nav_patrol_4",
		"nav_hangar_reaper"
		)

	initial_restricted_waypoints = list(
	"Reaper" = list("nav_hangar_reaper")
		)

/obj/effect/overmap/visitable/ship/patrol/New()
	name = "SFV [pick("Sentinel","Cavalry","Scarabaeus","Helios","Heretic","Apocalypse","Calamatious","Terror","Pandemonium","Anubis","Hound","Stalker","Avatar","Ultimatum","Goliath","Tyrant","Nemesis","Hydra","Stormhawk","Manticore","Basilisk")], \a [name]"
	for(var/area/ship/patrol/A)
		A.name = "\improper [name] - [A.name]"
		GLOB.using_map.area_purity_test_exempt_areas += A.type
	..()


/datum/map_template/ruin/away_site/patrol
	name = "Sol Patrol Ship (MPC)"
	id = "awaysite_patrol_ship"
	description = "Nagashino-class Multipurpose Patrol Craft."
	prefix = "maps/away_inf/"
	suffixes = list("sentinel/sentinel-1.dmm", "sentinel/sentinel-2.dmm")
	cost = 0.5
	spawn_weight = 0.5 //INF
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/reaper)


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

/obj/effect/submap_landmark/joinable_submap/patrol
	name = "Sol Patrol Ship"
	archetype = /decl/submap_archetype/away_scg_patrol

//obj/machinery/door/airlock/autoname/command
	//req_access = list(access_heads)

//obj/machinery/door/airlock/autoname/engineering
	//req_access = list(access_engine)

//obj/machinery/door/airlock/autoname/marine
	//req_access = list(access_security)

/* TCOMMS
 * ======
 */

/obj/machinery/telecomms/allinone/away_scg_patrol
	listening_freqs = list(SCG_FREQ)
	channel_color = COMMS_COLOR_CENTCOMM
	channel_name = "SCG Patrol"
	circuitboard = /obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/away_scg_patrol

/obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/away_scg_patrol
	build_path = /obj/machinery/telecomms/allinone/away_scg_patrol

/obj/item/device/radio/headset/away_scg_patrol
	name = "SCG Patrol headset"
	icon_state = "nt_headset"
	ks1type = /obj/item/device/encryptionkey/away_scg_patrol

/obj/item/device/radio/headset/away_scg_patrol/Initialize()
	. = ..()
	set_frequency(SCG_FREQ)	//Not going to be random or just set to the common frequency, but can be set later.

/obj/item/device/encryptionkey/away_scg_patrol
	name = "SCG Patrol radio encryption key"
	icon_state = "nt_cypherkey"
	channels = list("SCG Patrol" = 1)
