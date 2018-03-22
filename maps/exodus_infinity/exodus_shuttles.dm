// Escape shuttle and pods
/*
/datum/shuttle/ferry/emergency/centcom
	name = "Escape"
	location = 1
	warmup_time = 10
	area_offsite = /area/shuttle/escape/centcom
	area_station = /area/shuttle/escape/station
	area_transition = /area/shuttle/escape/transit
	docking_controller_tag = "escape_shuttle"
	dock_target_station = "escape_dock"
	dock_target_offsite = "centcom_dock"
	transit_direction = NORTH

/datum/shuttle/ferry/escape_pod/escape_pod_one
	name = "Escape Pod 1"
	location = 0
	warmup_time = 0
	area_station = /area/shuttle/escape_pod1/station
	area_offsite = /area/shuttle/escape_pod1/centcom
	area_transition = /area/shuttle/escape_pod1/transit
	docking_controller_tag = "escape_pod_1"
	dock_target_station = "escape_pod_1_berth"
	dock_target_offsite = "escape_pod_1_recovery"
	transit_direction = NORTH

/datum/shuttle/ferry/escape_pod/escape_pod_two
	name = "Escape Pod 2"
	location = 0
	warmup_time = 0
	area_station = /area/shuttle/escape_pod2/station
	area_offsite = /area/shuttle/escape_pod2/centcom
	area_transition = /area/shuttle/escape_pod2/transit
	docking_controller_tag = "escape_pod_2"
	dock_target_station = "escape_pod_2_berth"
	dock_target_offsite = "escape_pod_2_recovery"
	transit_direction = NORTH

/datum/shuttle/ferry/escape_pod/escape_pod_three
	name = "Escape Pod 3"
	location = 0
	warmup_time = 0
	area_station = /area/shuttle/escape_pod3/station
	area_offsite = /area/shuttle/escape_pod3/centcom
	area_transition = /area/shuttle/escape_pod3/transit
	docking_controller_tag = "escape_pod_3"
	dock_target_station = "escape_pod_3_berth"
	dock_target_offsite = "escape_pod_3_recovery"
	transit_direction = EAST

/datum/shuttle/ferry/escape_pod/escape_pod_four
	name = "Escape Pod 4"
	location = 0
	warmup_time = 0
	area_station = /area/shuttle/escape_pod5/station
	area_offsite = /area/shuttle/escape_pod5/centcom
	area_transition = /area/shuttle/escape_pod5/transit
	docking_controller_tag = "escape_pod_5"
	dock_target_station = "escape_pod_5_berth"
	dock_target_offsite = "escape_pod_5_recovery"
	transit_direction = EAST //should this be WEST? I have no idea.

/datum/shuttle/ferry/supply/cargo
	name = "Supply"
	location = 1
	warmup_time = 10
	area_offsite = /area/supply/dock
	area_station = /area/supply/station
	docking_controller_tag = "supply_shuttle"
	dock_target_station = "cargo_bay"

/datum/shuttle/ferry/engineering
	name = "Engineering"
	warmup_time = 10
	area_offsite = /area/shuttle/constructionsite/site
	area_station = /area/shuttle/constructionsite/station
	docking_controller_tag = "engineering_shuttle"
	dock_target_station = "engineering_dock_airlock"
	dock_target_offsite = "edock_airlock"

/datum/shuttle/ferry/mining
	name = "Mining"
	warmup_time = 10
	area_offsite = /area/shuttle/mining/outpost
	area_station = /area/shuttle/mining/station
	docking_controller_tag = "mining_shuttle"
	dock_target_station = "mining_dock_airlock"
	dock_target_offsite = "mining_outpost_airlock"

/datum/shuttle/ferry/research
	name = "Research"
	warmup_time = 10
	area_offsite = /area/shuttle/research/outpost
	area_station = /area/shuttle/research/station
	docking_controller_tag = "research_shuttle"
	dock_target_station = "research_dock_airlock"
	dock_target_offsite = "research_outpost_dock"

/datum/shuttle/ferry/centcom
	name = "Centcom"
	location = 1
	warmup_time = 10
	area_offsite = /area/shuttle/transport1/centcom
	area_station = /area/shuttle/transport1/station
	docking_controller_tag = "centcom_shuttle"
	dock_target_station = "centcom_shuttle_dock_airlock"
	dock_target_offsite = "centcom_shuttle_bay"

/datum/shuttle/ferry/administration
	name = "Administration"
	location = 1
	warmup_time = 10	//want some warmup time so people can cancel.
	area_offsite = /area/shuttle/administration/centcom
	area_station = /area/shuttle/administration/station
	docking_controller_tag = "admin_shuttle"
	dock_target_station = "admin_shuttle_dock_airlock"
	dock_target_offsite = "admin_shuttle_bay"

/datum/shuttle/ferry/alien
	name = "Alien"
	area_offsite = /area/shuttle/alien/base
	area_station = /area/shuttle/alien/mine
	flags = SHUTTLE_FLAGS_NONE

/datum/shuttle/ferry/merchant
	name = "Merchant"
	warmup_time = 10
	docking_controller_tag = "merchant_ship_dock"
	dock_target_station = "merchant_station_dock"
	dock_target_offsite = "merchant_shuttle_station_dock"
	area_station = /area/shuttle/merchant/home
	area_offsite = /area/shuttle/merchant/away

/datum/shuttle/multi_shuttle/mercenary
	name = "Mercenary"
	warmup_time = 0
	origin = /area/syndicate_station/start
	interim = /area/syndicate_station/transit
	start_location = "Mercenary Base"
	destinations = list(
		"Northwest of the station" = /area/syndicate_station/northwest,
		"North of the station" = /area/syndicate_station/north,
		"Northeast of the station" = /area/syndicate_station/northeast,
		"Southwest of the station" = /area/syndicate_station/southwest,
		"South of the station" = /area/syndicate_station/south,
		"Southeast of the station" = /area/syndicate_station/southeast,
		"Telecomms Satellite" = /area/syndicate_station/commssat,
		"Mining Station" = /area/syndicate_station/mining,
		"Arrivals dock" = /area/syndicate_station/arrivals_dock,
		)
	docking_controller_tag = "merc_shuttle"
	destination_dock_targets = list(
		"Mercenary Base" = "merc_base",
		"Arrivals dock" = "nuke_shuttle_dock_airlock",
		)
	announcer = "NDV Icarus"

/datum/shuttle/multi_shuttle/mercenary/New()
	arrival_message = "Attention, [using_map.station_short], you have a large signature approaching the station - looks unarmed to surface scans. We're too far out to intercept - brace for visitors."
	departure_message = "Your visitors are on their way out of the system, [using_map.station_short], burning delta-v like it's nothing. Good riddance."
	..()

/datum/shuttle/multi_shuttle/skipjack
	name = "Skipjack"
	warmup_time = 0
	origin = /area/skipjack_station/start
	interim = /area/skipjack_station/transit
	destinations = list(
		"Fore Starboard Solars" = /area/skipjack_station/northeast_solars,
		"Fore Port Solars" = /area/skipjack_station/northwest_solars,
		"Aft Starboard Solars" = /area/skipjack_station/southeast_solars,
		"Aft Port Solars" = /area/skipjack_station/southwest_solars,
		"Mining Station" = /area/skipjack_station/mining
		)
	announcer = "NDV Icarus"

/datum/shuttle/multi_shuttle/skipjack/New()
	arrival_message = "Attention, [using_map.station_short], we just tracked a small target bypassing our defensive perimeter. Can't fire on it without hitting the station - you've got incoming visitors, like it or not."
	departure_message = "Your guests are pulling away, [using_map.station_short] - moving too fast for us to draw a bead on them. Looks like they're heading out of the system at a rapid clip."
	..()

/datum/shuttle/multi_shuttle/rescue
	name = "Rescue"
	warmup_time = 0
	origin = /area/rescue_base/start
	interim = /area/rescue_base/transit
	start_location = "Response Team Base"
	destinations = list(
		"Northwest of the station" = /area/rescue_base/northwest,
		"North of the station" = /area/rescue_base/north,
		"Northeast of the station" = /area/rescue_base/northeast,
		"Southwest of the station" = /area/rescue_base/southwest,
		"South of the station" = /area/rescue_base/south,
		"Southeast of the station" = /area/rescue_base/southeast,
		"Telecomms Satellite" = /area/rescue_base/commssat,
		"Engineering Station" = /area/rescue_base/mining,
		"Arrivals dock" = /area/rescue_base/arrivals_dock,
		)
	docking_controller_tag = "rescue_shuttle"
	destination_dock_targets = list(
		"Response Team Base" = "rescue_base",
		"Arrivals dock" = "rescue_shuttle_dock_airlock",
		)
	announcer = "NDV Icarus"

/datum/shuttle/multi_shuttle/rescue/New()
	arrival_message = "Attention, [using_map.station_short], there's a small patrol craft headed your way, it flashed us Asset Protection codes and we let it pass. You've got guests on the way."
	departure_message = "[using_map.station_short], That Asset Protection vessel is headed back the way it came. Hope they were helpful."
	..()

/datum/shuttle/ferry/multidock/specops/ert
	name = "Special Operations"
	location = 0
	warmup_time = 10
	area_offsite = /area/shuttle/specops/station	//centcom is the home station, the Exodus is offsite
	area_station = /area/shuttle/specops/centcom
	docking_controller_tag = "specops_shuttle_port"
	docking_controller_tag_station = "specops_shuttle_port"
	docking_controller_tag_offsite = "specops_shuttle_fore"
	dock_target_station = "specops_centcom_dock"
	dock_target_offsite = "specops_dock_airlock"*/

//Merchant

/datum/shuttle/autodock/ferry/merchant
	name = "Merchant"
	warmup_time = 10
	location = 1
	shuttle_area = /area/shuttle/merchant/home
	waypoint_station = "nav_merchant_out"
	waypoint_offsite = "nav_merchant_start"
	current_location = "nav_merchant_start"
	dock_target = "merchant_ship_dock"

/obj/effect/shuttle_landmark/merchant/start
	name = "Merchant Base"
	landmark_tag = "nav_merchant_start"
	docking_controller = "merchant_station_dock"

/obj/effect/shuttle_landmark/merchant/out
	name = "Docking Bay"
	landmark_tag = "nav_merchant_out"
	docking_controller = "merchant_shuttle_station_dock"

//Admin

/datum/shuttle/autodock/ferry/administration
	name = "Administration"
	location = 1
	warmup_time = 10
	shuttle_area = /area/shuttle/administration/centcom
	dock_target = "admin_shuttle"
	waypoint_station = "nav_admin_out"
	waypoint_offsite = "nav_admin_start"
	current_location = "nav_admin_start"

/obj/effect/shuttle_landmark/admin/start
	name = "Centcom"
	landmark_tag = "nav_admin_start"
	docking_controller = "admin_shuttle"
	base_area = /area/centcom
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/admin/out
	name = "Docking Bay"
	landmark_tag = "nav_admin_out"
	docking_controller = "admin_shuttle_dock_airlock"

//Transport

/datum/shuttle/autodock/ferry/centcom
	name = "Centcom"
	location = 1
	warmup_time = 10
	shuttle_area = /area/shuttle/transport1/centcom
	dock_target = "centcom_shuttle"
	waypoint_offsite = "nav_ferry_start"
	waypoint_station = "nav_ferry_out"
	current_location = "nav_ferry_start"

/obj/effect/shuttle_landmark/ferry/start
	name = "Centcom"
	landmark_tag = "nav_ferry_start"
	docking_controller = "centcom_shuttle_bay"

/obj/effect/shuttle_landmark/ferry/out
	name = "Docking Bay"
	landmark_tag = "nav_ferry_out"
	docking_controller = "centcom_shuttle_dock_airlock"

//Assault Pod

/datum/shuttle/autodock/ferry/specops/deathsquad
	name = "Special Operations"
	warmup_time = 10
	location = 1
	shuttle_area = /area/shuttle/specops/centcom
	dock_target = "specops_shuttle_fore"
	waypoint_station = "nav_specops_out"
	waypoint_offsite = "nav_specops_start"
	current_location = "nav_specops_start"

/obj/effect/shuttle_landmark/specops/start
	name = "NAS Crescent"
	landmark_tag = "nav_specops_start"
	docking_controller = "specops_centcom_dock"

/obj/effect/shuttle_landmark/specops/out
	name = "Docking Bay"
	landmark_tag = "nav_specops_out"
	docking_controller = "specops_dock_airlock"

//NT Rescue Shuttle

/datum/shuttle/autodock/multi/antag/rescue
	name = "Rescue"
	cloaked = 0
	warmup_time = 9
	move_time = 135 //2,25 Minutes
	destination_tags = list(
		"nav_ert_north_west",
		"nav_ert_north_east",
		"nav_ert_south_east",
		"nav_ert_south_west",
		"nav_ert_satel",
		"nav_ert_mine",
		"nav_ert_dock",
		"nav_ert_start"
		)
	shuttle_area = /area/rescue_base/start
	dock_target = "rescue_shuttle"
	current_location = "nav_ert_start"
	landmark_transition = "nav_ert_transition"
	home_waypoint = "nav_ert_start"
	announcer = "NAS Crescent"
	arrival_message = "Внимание, судно Департамента по Защите Активов входит в космическое пространство NSS Exodus."
	departure_message = "Внимание, судно Департамента по Защите Активов покидает космическое пространство NSS Exodus."

/obj/effect/shuttle_landmark/ert/start
	name = "Response Team Base"
	landmark_tag = "nav_ert_start"
	docking_controller = "rescue_base"
	base_area = /area/rescue_base/base
	base_turf = /turf/unsimulated/floor/rescue_base

/obj/effect/shuttle_landmark/ert/internim
	name = "In transit"
	landmark_tag = "nav_ert_transition"

/obj/effect/shuttle_landmark/ert/dock
	name = "NSS Exodus Docking Port"
	landmark_tag = "nav_ert_dock"
	docking_controller = "rescue_shuttle_dock_airlock"

/obj/effect/shuttle_landmark/ert/northwest
	name = "Northwest of Station"
	landmark_tag = "nav_ert_north_west"

/obj/effect/shuttle_landmark/ert/northeast
	name = "Northeast of Station"
	landmark_tag = "nav_ert_north_east"

/obj/effect/shuttle_landmark/ert/southeast
	name = "Southeast of Station"
	landmark_tag = "nav_ert_south_east"

/obj/effect/shuttle_landmark/ert/southwest
	name = "Southwest of Station"
	landmark_tag = "nav_ert_south_west"

/obj/effect/shuttle_landmark/ert/satellite
	name = "East of Telecommunication Satellite"
	landmark_tag = "nav_ert_satel"

/obj/effect/shuttle_landmark/ert/mine
	name = "North from Asteroid Engineering Base"
	landmark_tag = "nav_ert_mine"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/asteroid

//Cargo shuttle

/datum/shuttle/autodock/ferry/supply/drone
	name = "Supply Shuttle"
	location = 1
	warmup_time = 10
	shuttle_area = /area/supply/dock
	dock_target = "supply_shuttle"
	current_location = "nav_cargo_start"
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"

/obj/effect/shuttle_landmark/supply/centcom
	name = "NAS Crescent"
	landmark_tag = "nav_cargo_start"
	base_area = /area/centcom
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/supply/station
	name = "Hangar"
	landmark_tag = "nav_cargo_station"
	docking_controller = "cargo_bay"

//Merc

/datum/shuttle/autodock/multi/antag/mercenary
	name = "Mercenary"
	warmup_time = 9
	move_time = 135 //2,25 Minutes
	destination_tags = list(
		"nav_merc_start",
		"nav_merc_dock",
		"nav_merc_north_west",
		"nav_merc_north",
		"nav_merc_north_east",
		"nav_merc_south_east",
		"nav_merc_south",
		"nav_merc_south_west",
		"nav_merc_mine",
		"nav_merc_satel"
		)
	shuttle_area = /area/syndicate_station/start
	dock_target = "merc_shuttle"
	current_location = "nav_merc_start"
	landmark_transition = "nav_merc_transition"
	announcer = "NAS Crescent"
	home_waypoint = "nav_merc_start"
	arrival_message = "Внимание, неизвестное судно обнаружено в космическом пространстве рЯдом с NSS Exodus. \
	Судно классифицировано как транспортник PM-24 'Flare'."
	departure_message = "Внимание, неизвестное судно покидает космические пространство NSS Exodus."

/obj/effect/shuttle_landmark/merc/start
	name = "Mercenary Base"
	landmark_tag = "nav_merc_start"
	docking_controller = "merc_base"

/obj/effect/shuttle_landmark/merc/internim
	name = "In transit"
	landmark_tag = "nav_merc_transition"

/obj/effect/shuttle_landmark/merc/dock
	name = "NSS Exodus Docking Port"
	landmark_tag = "nav_merc_dock"
	docking_controller = "nuke_shuttle_dock_airlock"

/obj/effect/shuttle_landmark/merc/northwest
	name = "Northwest of Station"
	landmark_tag = "nav_merc_north_west"

/obj/effect/shuttle_landmark/merc/north
	name = "North of Station"
	landmark_tag = "nav_merc_north"

/obj/effect/shuttle_landmark/merc/northeast
	name = "Northeast of Station"
	landmark_tag = "nav_merc_north_east"

/obj/effect/shuttle_landmark/merc/southeast
	name = "Southeast of Station"
	landmark_tag = "nav_merc_south_east"

/obj/effect/shuttle_landmark/merc/south
	name = "South of Station"
	landmark_tag = "nav_merc_south"

/obj/effect/shuttle_landmark/merc/southwest
	name = "Southwest of Station"
	landmark_tag = "nav_merc_south_west"

/obj/effect/shuttle_landmark/merc/satellite
	name = "South of Telecommunication Satellite"
	landmark_tag = "nav_merc_satel"

/obj/effect/shuttle_landmark/merc/mine
	name = "East from Asteroid Research Base"
	landmark_tag = "nav_merc_mine"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/asteroid

//Skipjack

/datum/shuttle/autodock/multi/antag/skipjack
	name = "Skipjack"
	warmup_time = 9
	move_time = 60
	destination_tags = list(
		"nav_skipjack_north_west",
		"nav_skipjack_north_east",
		"nav_skipjack_south_east",
		"nav_skipjack_south_west",
		"nav_skipjack_mine",
		"nav_skipjack_start"
		)
	shuttle_area =  /area/skipjack_station/start
	dock_target = "skipjack_shuttle"
	current_location = "nav_skipjack_start"
	landmark_transition = "nav_skipjack_transition"
	announcer = "NAS Crescent"
	home_waypoint = "nav_skipjack_start"
	arrival_message = "Attention, vessel detected entering vessel proximity."
	departure_message = "Attention, vessel detected leaving vessel proximity."

/obj/effect/shuttle_landmark/skipjack/start
	name = "Raider Outpost"
	landmark_tag = "nav_skipjack_start"
	docking_controller = "skipjack_base"

/obj/effect/shuttle_landmark/skipjack/internim
	name = "In transit"
	landmark_tag = "nav_skipjack_transition"

/obj/effect/shuttle_landmark/skipjack/northwest
	name = "Northwest of Station"
	landmark_tag = "nav_skipjack_north_west"

/obj/effect/shuttle_landmark/skipjack/northeast
	name = "Northeast of Station"
	landmark_tag = "nav_skipjack_north_east"

/obj/effect/shuttle_landmark/skipjack/southeast
	name = "Southeast of Station"
	landmark_tag = "nav_skipjack_south_east"

/obj/effect/shuttle_landmark/skipjack/southwest
	name = "Southwest of Station"
	landmark_tag = "nav_skipjack_south_west"

/obj/effect/shuttle_landmark/skipjack/mine
	name = "South from Asteroid Mining Base"
	landmark_tag = "nav_skipjack_mine"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/asteroid

//Pods

/datum/shuttle/autodock/ferry/escape_pod
	category = /datum/shuttle/autodock/ferry/escape_pod
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'
	var/number

/datum/shuttle/autodock/ferry/escape_pod/New()
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

/datum/shuttle/autodock/ferry/escape_pod/pod1
	shuttle_area = /area/shuttle/escape_pod1/station
	number = 1
/obj/effect/shuttle_landmark/escape_pod/start/pod1
	number = 1
/obj/effect/shuttle_landmark/escape_pod/out/pod1
	number = 1
/obj/effect/shuttle_landmark/escape_pod/transit/pod1
	number = 1

/datum/shuttle/autodock/ferry/escape_pod/pod2
	shuttle_area = /area/shuttle/escape_pod2/station
	number = 2
/obj/effect/shuttle_landmark/escape_pod/start/pod2
	number = 2
/obj/effect/shuttle_landmark/escape_pod/out/pod2
	number = 2
/obj/effect/shuttle_landmark/escape_pod/transit/pod2
	number = 2

/datum/shuttle/autodock/ferry/escape_pod/pod3
	shuttle_area = /area/shuttle/escape_pod3/station
	number = 3
/obj/effect/shuttle_landmark/escape_pod/start/pod3
	number = 3
/obj/effect/shuttle_landmark/escape_pod/out/pod3
	number = 3
/obj/effect/shuttle_landmark/escape_pod/transit/pod3
	number = 3

/datum/shuttle/autodock/ferry/escape_pod/pod4
	shuttle_area = /area/shuttle/escape_pod4/station
	number = 4
/obj/effect/shuttle_landmark/escape_pod/start/pod4
	number = 4
/obj/effect/shuttle_landmark/escape_pod/out/pod4
	number = 4
/obj/effect/shuttle_landmark/escape_pod/transit/pod4
	number = 4


/datum/shuttle/autodock/ferry/emergency


//Mining Shuttle

/datum/shuttle/autodock/ferry/mining
	name = "Mining"
	warmup_time = 8
	move_time = 20
	shuttle_area = /area/shuttle/mining/station
	waypoint_station = "nav_mine_start"
	waypoint_offsite = "nav_mine_out"
	current_location = "nav_mine_start"
	dock_target = "mining_shuttle"
	landmark_transition = "nav_mine_transit"

/obj/effect/shuttle_landmark/mining/out
	name = "Mining Station"
	landmark_tag = "nav_mine_out"
	docking_controller = "mining_outpost_airlock"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/airless/asteroid

/obj/effect/shuttle_landmark/mining/start
	name = "NSS Exodus"
	landmark_tag = "nav_mine_start"
	docking_controller = "mining_dock_airlock"

/obj/effect/shuttle_landmark/mining/transit
	name = "In transit"
	landmark_tag = "nav_mine_transit"

//Science Shuttle

/datum/shuttle/autodock/ferry/science
	name = "Research"
	warmup_time = 8
	move_time = 20
	shuttle_area = /area/shuttle/research/station
	waypoint_station = "nav_sci_start"
	current_location = "nav_sci_start"
	waypoint_offsite = "nav_sci_out"
	dock_target = "research_shuttle"
	landmark_transition = "nav_sci_transit"

/obj/effect/shuttle_landmark/science/out
	name = "Research Station"
	landmark_tag = "nav_sci_out"
	docking_controller = "research_outpost_dock"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/airless/asteroid

/obj/effect/shuttle_landmark/science/start
	name = "NSS Exodus"
	landmark_tag = "nav_sci_start"
	docking_controller = "research_dock_airlock"

/obj/effect/shuttle_landmark/science/transit
	name = "In transit"
	landmark_tag = "nav_sci_transit"

//Engineering Shuttle

/datum/shuttle/autodock/ferry/engineering
	name = "Engineering"
	warmup_time = 8
	move_time = 20
	shuttle_area = /area/shuttle/constructionsite/station
	current_location = "nav_engi_start"
	waypoint_station = "nav_engi_start"
	waypoint_offsite = "nav_engi_out"
	dock_target = "engineering_shuttle"
	landmark_transition = "nav_engi_transit"

/obj/effect/shuttle_landmark/engineering/out
	name = "Engineering Station"
	landmark_tag = "nav_engi_out"
	docking_controller = "edock_airlock"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/airless/asteroid

/obj/effect/shuttle_landmark/engineering/start
	name = "NSS Exodus"
	landmark_tag = "nav_engi_start"
	docking_controller = "engineering_dock_airlock"

/obj/effect/shuttle_landmark/engineering/transit
	name = "In transit"
	landmark_tag = "nav_engi_transit"

//Emergency shuttle

/datum/shuttle/autodock/ferry/emergency/shuttle
	name = "Escape"
	location = 1
	shuttle_area = /area/shuttle/escape/centcom
	waypoint_station = "nav_emerg_out"
	waypoint_offsite = "nav_emerg_start"
	current_location = "nav_emerg_start"
	dock_target = "escape_shuttle"
	landmark_transition = "nav_emerg_transit"

/obj/effect/shuttle_landmark/emergency/start
	name = "NAS Crescent"
	landmark_tag = "nav_emerg_start"
	docking_controller = "centcom_dock"

/obj/effect/shuttle_landmark/emergency/out
	name = "NSS Exodus"
	landmark_tag = "nav_emerg_out"
	docking_controller = "escape_dock"

/obj/effect/shuttle_landmark/emergency/transit
	name = "In transit"
	landmark_tag = "nav_emerg_transit"