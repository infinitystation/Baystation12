//Some helpers because so much copypasta for pods
/datum/shuttle/autodock/ferry/escape_pod/sierrapod
	category = /datum/shuttle/autodock/ferry/escape_pod/sierrapod
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'
	var/number
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/sierra
	warmup_time = 2

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/New()
	name = "Escape Pod [number]"
	dock_target = "escape_pod_[number]"
	arming_controller = "escape_pod_[number]_berth"
	waypoint_station = "escape_pod_[number]_start"
	landmark_transition = "escape_pod_[number]_internim"
	waypoint_offsite = "escape_pod_[number]_out"
	..()

/obj/effect/shuttle_landmark/escape_pod/
	var/number

/obj/effect/shuttle_landmark/escape_pod/start
	name = "Docked"

/obj/effect/shuttle_landmark/escape_pod/start/New()
	landmark_tag = "escape_pod_[number]_start"
	docking_controller = "escape_pod_[number]_berth"
	..()

/obj/effect/shuttle_landmark/escape_pod/transit
	name = "In transit"

/obj/effect/shuttle_landmark/escape_pod/transit/New()
	landmark_tag = "escape_pod_[number]_internim"
	..()

/obj/effect/shuttle_landmark/escape_pod/out
	name = "Escaped"

/obj/effect/shuttle_landmark/escape_pod/out/New()
	landmark_tag = "escape_pod_[number]_out"
	..()

//Pods

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod6
	shuttle_area = /area/shuttle/escape_pod6/station
	number = 6
/obj/effect/shuttle_landmark/escape_pod/start/pod6
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 6
/obj/effect/shuttle_landmark/escape_pod/out/pod6
	number = 6
/obj/effect/shuttle_landmark/escape_pod/transit/pod6
	number = 6

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod7
	shuttle_area = /area/shuttle/escape_pod7/station
	number = 7
/obj/effect/shuttle_landmark/escape_pod/start/pod7
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 7
/obj/effect/shuttle_landmark/escape_pod/out/pod7
	number = 7
/obj/effect/shuttle_landmark/escape_pod/transit/pod7
	number = 7

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod8
	shuttle_area = /area/shuttle/escape_pod8/station
	number = 8
/obj/effect/shuttle_landmark/escape_pod/start/pod8
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 8
/obj/effect/shuttle_landmark/escape_pod/out/pod8
	number = 8
/obj/effect/shuttle_landmark/escape_pod/transit/pod8
	number = 8

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod9
	shuttle_area = /area/shuttle/escape_pod9/station
	number = 9
/obj/effect/shuttle_landmark/escape_pod/start/pod9
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 9
/obj/effect/shuttle_landmark/escape_pod/out/pod9
	number = 9
/obj/effect/shuttle_landmark/escape_pod/transit/pod9
	number = 9

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod10
	shuttle_area = /area/shuttle/escape_pod10/station
	number = 10
/obj/effect/shuttle_landmark/escape_pod/start/pod10
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 10
/obj/effect/shuttle_landmark/escape_pod/out/pod10
	number = 10
/obj/effect/shuttle_landmark/escape_pod/transit/pod10
	number = 10

//Smoll pods

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod12
	shuttle_area = /area/shuttle/escape_pod12/station
	number = 12
/obj/effect/shuttle_landmark/escape_pod/start/pod12
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 12
/obj/effect/shuttle_landmark/escape_pod/out/pod12
	number = 12
/obj/effect/shuttle_landmark/escape_pod/transit/pod12
	number = 12

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod13
	shuttle_area = /area/shuttle/escape_pod13/station
	number = 13
/obj/effect/shuttle_landmark/escape_pod/start/pod13
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 13
/obj/effect/shuttle_landmark/escape_pod/out/pod13
	number = 13
/obj/effect/shuttle_landmark/escape_pod/transit/pod13
	number = 13

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod14
	shuttle_area = /area/shuttle/escape_pod14/station
	number = 14
/obj/effect/shuttle_landmark/escape_pod/start/pod14
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 14
/obj/effect/shuttle_landmark/escape_pod/out/pod14
	number = 14
/obj/effect/shuttle_landmark/escape_pod/transit/pod14
	number = 14
/*
/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod15
	shuttle_area = /area/shuttle/escape_pod15/station
	number = 15
/obj/effect/shuttle_landmark/escape_pod/start/pod15
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 15
/obj/effect/shuttle_landmark/escape_pod/out/pod15
	number = 15
/obj/effect/shuttle_landmark/escape_pod/transit/pod15
	number = 15

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod116
	shuttle_area = /area/shuttle/escape_pod16/station
	number = 16
/obj/effect/shuttle_landmark/escape_pod/start/pod16
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 16
/obj/effect/shuttle_landmark/escape_pod/out/pod16
	number = 16
/obj/effect/shuttle_landmark/escape_pod/transit/pod16
	number = 16

/datum/shuttle/autodock/ferry/escape_pod/sierrapod/escape_pod17
	shuttle_area = /area/shuttle/escape_pod17/station
	number = 17
/obj/effect/shuttle_landmark/escape_pod/start/pod17
	base_turf = /turf/simulated/floor/reinforced/airless
	number = 17
/obj/effect/shuttle_landmark/escape_pod/out/pod17
	number = 17
/obj/effect/shuttle_landmark/escape_pod/transit/pod17
	number = 17
*/
//Petrov

/datum/shuttle/autodock/ferry/petrov
	name = "Petrov"
	dock_target = "petrov_shuttle"
	waypoint_station = "nav_petrov_start"
	waypoint_offsite = "nav_petrov_out"
	logging_home_tag = "nav_petrov_start"
	logging_access = access_petrov_helm
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/sierra
	warmup_time = 7

/datum/shuttle/autodock/ferry/petrov/New(_name, var/obj/effect/shuttle_landmark/initial_location)
	shuttle_area = subtypesof(/area/shuttle/petrov)
	..()

/obj/effect/shuttle_landmark/petrov/start
	name = "First Deck"
	landmark_tag = "nav_petrov_start"
	docking_controller = "petrov_shuttle_dock"

/obj/effect/shuttle_landmark/petrov/out
	name = "Space near the vessel"
	landmark_tag = "nav_petrov_out"

//Ninja Shuttle.
/datum/shuttle/autodock/multi/antag/ninja
	destination_tags = list(
		"nav_ninja_deck1",
		"nav_ninja_deck2",
		"nav_ninja_deck3",
		"nav_ninja_deck4",
		"nav_ninja_deck5",
		"nav_away_6",
		"nav_derelict_5",
		"nav_cluster_6",
		"nav_ninja_start",
		"nav_lost_supply_base_antag",
		"nav_marooned_antag",
		"nav_smugglers_antag",
		"nav_bearcat_antag",
		"nav_magshield_antag",
		"nav_casino_antag",
		"nav_yacht_antag",
		"nav_slavers_base_antag",
		"nav_mining_antag"
		)

/obj/effect/shuttle_landmark/ninja/deck1
	name = "West of Fourth Deck"
	landmark_tag = "nav_ninja_deck1"

/obj/effect/shuttle_landmark/ninja/deck2
	name = "East of Third Deck"
	landmark_tag = "nav_ninja_deck2"

/obj/effect/shuttle_landmark/ninja/deck3
	name = "Northeast of Second Deck"
	landmark_tag = "nav_ninja_deck3"

/obj/effect/shuttle_landmark/ninja/deck4
	name = "South of First Deck"
	landmark_tag = "nav_ninja_deck4"

/obj/effect/shuttle_landmark/ninja/deck5
	name = "Southeast of Bridge"
	landmark_tag = "nav_ninja_deck5"

//Merchant

/datum/shuttle/autodock/ferry/merchant
	name = "Merchant"
	shuttle_area = /area/shuttle/merchant/home
	waypoint_station = "nav_merchant_start"
	waypoint_offsite = "nav_merchant_out"
	dock_target = "merchant_ship_dock"
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	warmup_time = 7
	knockdown = 0

/obj/effect/shuttle_landmark/merchant/start
	name = "Merchant Base"
	landmark_tag = "nav_merchant_start"
	docking_controller = "merchant_station_dock"

/obj/effect/shuttle_landmark/merchant/out
	name = "Docking Bay"
	landmark_tag = "nav_merchant_out"
	docking_controller = "merchant_shuttle_station"

//Admin

/datum/shuttle/autodock/ferry/administration
	name = "Administration"
	shuttle_area = /area/shuttle/administration/centcom
	dock_target = "admin_shuttle"
	waypoint_station = "nav_admin_start"
	waypoint_offsite = "nav_admin_out"
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	warmup_time = 7

/obj/effect/shuttle_landmark/admin/start
	name = "Centcom"
	landmark_tag = "nav_admin_start"
	docking_controller = "admin_shuttle"
	base_area = /area/centcom
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/admin/out
	name = "Docking Bay"
	landmark_tag = "nav_admin_out"
	docking_controller = "admin_shuttle_dock"

//Transport

/datum/shuttle/autodock/ferry/centcom
	name = "Centcom"
	location = 1
	shuttle_area = /area/shuttle/transport1/centcom
	dock_target = "centcom_shuttle"
	waypoint_offsite = "nav_ferry_start"
	waypoint_station = "nav_ferry_out"
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	warmup_time = 7

/obj/effect/shuttle_landmark/ferry/start
	name = "Centcom"
	landmark_tag = "nav_ferry_start"
	docking_controller = "centcom_shuttle_bay"

/obj/effect/shuttle_landmark/ferry/out
	name = "Docking Bay"
	landmark_tag = "nav_ferry_out"
	docking_controller = "centcom_shuttle_dock"

//Merc

/obj/effect/shuttle_landmark/merc/deck1
	name = "Northwest of Fourth Deck"
	landmark_tag = "nav_merc_deck1"

/obj/effect/shuttle_landmark/merc/deck2
	name = "South of Third deck"
	landmark_tag = "nav_merc_deck2"

/obj/effect/shuttle_landmark/merc/deck3
	name = "Southeast of the Second deck"
	landmark_tag = "nav_merc_deck3"

/obj/effect/shuttle_landmark/merc/deck4
	name = "Northeast of First Deck"
	landmark_tag = "nav_merc_deck4"

/obj/effect/shuttle_landmark/merc/deck5
	name = "East of Bridge"
	landmark_tag = "nav_merc_deck5"

/obj/effect/shuttle_landmark/merc/dock
	name = "Docking Port"
	landmark_tag = "nav_merc_dock"
	docking_controller = "nuke_shuttle_dock_airlock"

//Skipjack

/datum/shuttle/autodock/multi/antag/skipjack
	destination_tags = list(
		"nav_skipjack_deck1",
		"nav_skipjack_deck2",
		"nav_skipjack_deck3",
		"nav_skipjack_deck4",
		"nav_skipjack_deck5",
		"nav_away_7",
		"nav_derelict_7",
		"nav_cluster_7",
		"nav_skipjack_dock",
		"nav_skipjack_start",
		"nav_lost_supply_base_antag",
		"nav_marooned_antag",
		"nav_smugglers_antag",
		"nav_magshield_antag",
		"nav_casino_antag",
		"nav_yacht_antag",
		"nav_slavers_base_antag",
		"nav_mining_antag"
		)

/obj/effect/shuttle_landmark/skipjack/deck1
	name = "Northeast of Fourth Deck"
	landmark_tag = "nav_skipjack_deck1"

/obj/effect/shuttle_landmark/skipjack/deck2
	name = "Southeast of Third deck"
	landmark_tag = "nav_skipjack_deck2"

/obj/effect/shuttle_landmark/skipjack/deck3
	name = "Southwest of Second deck"
	landmark_tag = "nav_skipjack_deck3"

/obj/effect/shuttle_landmark/skipjack/deck4
	name = "Northwest of First Deck"
	landmark_tag = "nav_skipjack_deck4"

/obj/effect/shuttle_landmark/skipjack/deck5
	name = "South of Bridge"
	landmark_tag = "nav_skipjack_deck5"

//NT Rescue Shuttle

/datum/shuttle/autodock/multi/antag/rescue
	destination_tags = list(
		"nav_ert_deck1",
		"nav_ert_deck2",
		"nav_ert_deck3",
		"nav_ert_deck4",
		"nav_ert_deck5",
		"nav_away_4",
		"nav_derelict_4",
		"nav_cluster_4",
		"nav_ert_dock",
		"nav_ert_start",
		"nav_lost_supply_base_antag",
		"nav_marooned_antag",
		"nav_smugglers_antag",
		"nav_magshield_antag",
		"nav_casino_antag",
		"nav_yacht_antag",
		"nav_slavers_base_antag",
		"nav_mining_antag"
		)


/obj/effect/shuttle_landmark/ert/merchant
	name = "Local Merchant Station"
	landmark_tag = "nav_ert_merchant"

/obj/effect/shuttle_landmark/ert/deck1
	name =  "Southwest of Fourth deck"
	landmark_tag = "nav_ert_deck1"

/obj/effect/shuttle_landmark/ert/deck2
	name = "Northwest of Third deck"
	landmark_tag = "nav_ert_deck2"

/obj/effect/shuttle_landmark/ert/deck3
	name = "Northwest of Second deck"
	landmark_tag = "nav_ert_deck3"

/obj/effect/shuttle_landmark/ert/deck4
	name = "Southwest of First Deck"
	landmark_tag = "nav_ert_deck4"

/obj/effect/shuttle_landmark/ert/deck5
	name = "West of Bridge"
	landmark_tag = "nav_ert_deck5"

//SCGMC Assault Pod

/datum/shuttle/autodock/ferry/specops/scg
	name = "Special Operations"
	location = 1
	shuttle_area = /area/shuttle/specops/centcom
	dock_target = "specops_shuttle_fore"
	waypoint_station = "nav_specops_out"
	waypoint_offsite = "nav_specops_start"
	current_location = "nav_specops_start"
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	warmup_time = 7

/obj/effect/shuttle_landmark/specops/start
	name = "Centcom"
	landmark_tag = "nav_specops_start"
	docking_controller = "specops_shuttle_cent"

/obj/effect/shuttle_landmark/specops/out
	name = "Docking Bay"
	landmark_tag = "nav_specops_out"
	docking_controller = "specops_dock"

//Cargo drone

/datum/shuttle/autodock/ferry/supply/drone
	name = "Supply Drone"
	location = 1
	shuttle_area = /area/supply/dock
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	warmup_time = 7

/obj/effect/shuttle_landmark/supply/centcom
	name = "Offsite"
	landmark_tag = "nav_cargo_start"

/obj/effect/shuttle_landmark/supply/station
	name = "Hangar"
	landmark_tag = "nav_cargo_station"
	base_area = /area/quartermaster/hangar
	base_turf = /turf/simulated/floor/plating

/datum/shuttle/autodock/overmap/exploration_shuttle
	name = "Charon"
	move_time = 90
	shuttle_area = list(/area/exploration_shuttle/cockpit, /area/exploration_shuttle/atmos, /area/exploration_shuttle/medical, /area/exploration_shuttle/power, /area/exploration_shuttle/cargo, /area/exploration_shuttle/airlock)
	dock_target = "calypso_shuttle"
	current_location = "nav_hangar_calypso"
	landmark_transition = "nav_transit_calypso"
	range = 1
	fuel_consumption = 4
	logging_home_tag = "nav_hangar_calypso"
	logging_access = access_expedition_shuttle_helm
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/sierra
	warmup_time = 7

/datum/shuttle/autodock/overmap/exploration_shuttle/refresh_fuel_ports_list()	// Setting access onto APC and air alarms
	..()
	for(var/area/A in shuttle_area)
		for(var/obj/machinery/alarm/alarm in A)
			if(alarm.req_access)
				alarm.req_access = list(list(access_engine_equip, access_expedition_shuttle, access_atmospherics), access_engine)	//(Engine equip OR Charon OR Atmos) + Engineering
		for(var/obj/machinery/power/apc/apc in A)
			if(apc.req_access)
				apc.req_access = list(list(access_engine_equip, access_expedition_shuttle), access_engine)	//(Engine equip OR Charon) + Engineering

/obj/effect/shuttle_landmark/sierra/hangar/exploration_shuttle
	name = "Charon Hangar"
	landmark_tag = "nav_hangar_calypso"
	base_area = /area/quartermaster/hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/sierra/deck1/exploration_shuttle
	name = "Space near Fourth Deck"
	landmark_tag = "nav_deck1_calypso"

/obj/effect/shuttle_landmark/sierra/deck2/exploration_shuttle
	name = "Space near Third Deck"
	landmark_tag = "nav_deck2_calypso"

/obj/effect/shuttle_landmark/sierra/deck3/exploration_shuttle
	name = "Space near Second Deck"
	landmark_tag = "nav_deck3_calypso"

/obj/effect/shuttle_landmark/sierra/deck4/exploration_shuttle
	name = "Space near First Deck"
	landmark_tag = "nav_deck4_calypso"

/obj/effect/shuttle_landmark/sierra/deck5/exploration_shuttle
	name = "Space near Bridge"
	landmark_tag = "nav_bridge_calypso"

/obj/effect/shuttle_landmark/sierra/transit/exploration_shuttle
	name = "In transit"
	landmark_tag = "nav_transit_calypso"

/datum/shuttle/autodock/overmap/guppy
	name = "Guppy"
	move_time = 30
	shuttle_area = /area/guppy_hangar/start
	dock_target ="guppy_shuttle"
	current_location = "nav_hangar_guppy"
	landmark_transition = "nav_transit_guppy"
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'
	fuel_consumption = 2
	logging_home_tag = "nav_hangar_guppy"
	logging_access = access_guppy_helm
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/sierra
	warmup_time = 5

/obj/effect/shuttle_landmark/sierra/hangar/guppy
	name = "Guppy Hangar"
	landmark_tag = "nav_hangar_guppy"
	base_area = /area/quartermaster/hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/sierra/deck1/guppy
	name = "Space near Fourth Deck"
	landmark_tag = "nav_deck1_guppy"

/obj/effect/shuttle_landmark/sierra/deck2/guppy
	name = "Space near Third Deck"
	landmark_tag = "nav_deck2_guppy"

/obj/effect/shuttle_landmark/sierra/deck3/guppy
	name = "Space near Second Deck"
	landmark_tag = "nav_deck3_guppy"

/obj/effect/shuttle_landmark/sierra/deck4/guppy
	name = "Space near First Deck"
	landmark_tag = "nav_deck4_guppy"

/obj/effect/shuttle_landmark/sierra/deck5/guppy
	name = "Space near Bridge"
	landmark_tag = "nav_bridge_guppy"

/obj/effect/shuttle_landmark/sierra/transit/guppy
	name = "In transit"
	landmark_tag = "nav_transit_guppy"

//Makes the deck management program use hangar access
/datum/nano_module/deck_management
	default_access = list(access_hangar, access_cargo, access_heads)

// away transit

/obj/effect/shuttle_landmark/sierra/transit/blueriver_shuttle
	name = "In transit"
	landmark_tag = "nav_transit_blueriver"

/obj/effect/shuttle_landmark/sierra/deck3/patrol
	name = "Third Deck Starboard Dock"
	landmark_tag = "nav_deck3_patrol"
	docking_controller = "admin_shuttle_dock"

/obj/effect/shuttle_landmark/sierra/deck3/skrellshuttle
	name = "Third Deck Starboard Dock"
	landmark_tag = "nav_deck3_skrellshuttle"
	docking_controller = "admin_shuttle_dock"

/obj/effect/shuttle_landmark/sierra/deck1/skrellscout
	name = "First Deck Auxillary Dock"
	landmark_tag = "nav_deck1_skrellscout"
	docking_controller = "fd_starboard"
