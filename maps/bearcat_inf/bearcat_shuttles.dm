//Shuttles
//Lift
/datum/shuttle/autodock/multi/lift
	name = "Cargo Lift"
	warmup_time = 3
	destination_tags = list(
		"nav_bearcat_lift_top",
		"nav_bearcat_lift_middle",
		"nav_bearcat_lift_bottom"
		)
	ceiling_type = null
	shuttle_area = /area/ship/scrap/shuttle/lift
	current_location = "nav_bearcat_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	knockdown = 0

/obj/machinery/computer/shuttle_control/multi/lift
	name = "cargo lift controls"
	shuttle_tag = "Cargo Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = 0

//Lift's personal landmarkers
/obj/effect/shuttle_landmark/lift/top
	name = "Top Deck"
	landmark_tag = "nav_bearcat_lift_top"
	base_turf = /turf/simulated/open
	base_area = /area/ship/scrap/hallway/port/upper

/obj/effect/shuttle_landmark/lift/middle
	name = "Middle Deck"
	landmark_tag = "nav_bearcat_lift_middle"
	base_turf = /turf/simulated/open
	base_area = /area/ship/scrap/cargo

/obj/effect/shuttle_landmark/lift/bottom
	name = "Lower Deck"
	landmark_tag = "nav_bearcat_lift_bottom"
	base_area = /area/ship/scrap/cargo/lower
	base_turf = /turf/simulated/floor

//Bearcat's exploration
/datum/shuttle/autodock/overmap/exploration
	name = "Exploration Shuttle"
	shuttle_area = list(/area/ship/scrap/shuttle/outgoing)
	dock_target = "bearcat_shuttle"
	current_location = "nav_bearcat_port_dock_shuttle"
	landmark_transition = "exploration_transit"
	logging_access = access_heads
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	range = 1
	fuel_consumption = 3
	move_time = 25
	warmup_time = 5

/obj/machinery/computer/shuttle_control/explore/bearcat
	name = "shuttle console"
	shuttle_tag = "Exploration Shuttle"

/obj/effect/overmap/ship/landable/exploration_shuttle
	name = "Exploration Shuttle"
	shuttle = "Exploration Shuttle"
	max_speed = 1/(10 SECONDS)
	burn_delay = 5 SECONDS
	fore_dir = NORTH

//Raiders' shuttle
/datum/shuttle/autodock/multi/antag/skipjack
	name = "Skipjack"
	warmup_time = 7
	cloaked = 0
	destination_tags = list(
		"nav_skipjack_deck1",
		"nav_skipjack_deck2",
		"nav_skipjack_deck3",
		"nav_skipjack_dock",
		"nav_skipjack_start",
		"nav_lost_supply_base_antag",
		"nav_smugglers_antag"
		)
	shuttle_area = /area/skipjack_station/start
	dock_target = "skipjack_shuttle"
	current_location = "nav_skipjack_start"
	landmark_transition = "nav_skipjack_transition"
	announcer = "Vessel Short-Ranged Sensor Array"
	home_waypoint = "nav_skipjack_start"
	arrival_message = "Внимание, неизвестный шаттл приблизился на близкое расстояние"
	departure_message = "Внимание, неизвестный шаттл отдаляется от судна."

/obj/effect/shuttle_landmark/skipjack/start
	name = "Pirat Station"
	landmark_tag = "nav_skipjack_start"
	docking_controller = "skipjack_base"

/obj/effect/shuttle_landmark/skipjack/internim
	name = "In transit"
	landmark_tag = "nav_skipjack_transition"

/obj/effect/shuttle_landmark/skipjack/dock
	name = "Docking Port"
	landmark_tag = "nav_skipjack_dock"
	docking_controller = "eva"

/obj/effect/shuttle_landmark/skipjack/deck1
	name = "Northeast of the Lower"
	landmark_tag = "nav_skipjack_deck1"

/obj/effect/shuttle_landmark/skipjack/deck2
	name = "Southeast of the Middle"
	landmark_tag = "nav_skipjack_deck2"

/obj/effect/shuttle_landmark/skipjack/deck3
	name = "East of the Upper Deck"
	landmark_tag = "nav_skipjack_deck3"

///Also///

/obj/effect/shuttle_landmark/docking_arm_starboard
	name = "Bearcat Starboard-side Docking Arm"
	docking_controller = "bearcat_starboard_dock"

/obj/effect/shuttle_landmark/docking_arm_starboard/pod
	landmark_tag = "nav_bearcat_starboard_dock_pod"

/obj/effect/shuttle_landmark/docking_arm_port
	name = "Bearcat Port-side Docking Arm"
	docking_controller = "bearcat_dock_port"

/obj/effect/shuttle_landmark/docking_arm_port/shuttle
	landmark_tag = "nav_bearcat_port_dock_shuttle"

/obj/effect/shuttle_landmark/below_deck_bow
	name = "Near CSV Bearcat Bow"
	landmark_tag = "nav_bearcat_below_bow"

/obj/effect/shuttle_landmark/exploration
	name = "Exploration Shuttle"
	landmark_tag = "exploration_transit"

/obj/effect/shuttle_landmark/exploration/transit
	name = "In Transit"
	landmark_tag = "exploration_transit"

/obj/effect/shuttle_landmark/below_deck_starboardastern
	name = "Near CSV Bearcat Starboard Astern"
	landmark_tag = "nav_bearcat_below_starboardastern"

