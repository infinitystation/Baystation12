/obj/effect/overmap/ship/torch
	name = "SEV Torch"
	fore_dir = WEST
	vessel_mass = 300
	default_delay = 20 SECONDS
	speed_mod = 5 SECONDS
	start_x = 4
	start_y = 5

	initial_restricted_waypoints = list(
		"Charon" = list("nav_hangar_calypso"), 	//can't have random shuttles popping inside the ship
		"Guppy" = list("nav_hangar_guppy"),
		"Albatross" = list("nav_albatross_dock")
	)

	initial_generic_waypoints = list(
		"nav_merc_deck1",
		"nav_merc_deck2",
		"nav_merc_deck3",
		"nav_merc_deck4",
		"nav_merc_deck5",
		"nav_ert_deck1",
		"nav_ert_deck2",
		"nav_ert_deck3",
		"nav_ert_deck4",
		"nav_ert_deck5",
		"nav_deck1_calypso",
		"nav_deck2_calypso",
		"nav_deck3_calypso",
		"nav_deck4_calypso",
		"nav_bridge_calypso",
		"nav_deck1_guppy",
		"nav_deck2_guppy",
		"nav_deck3_guppy",
		"nav_deck4_guppy",
		"nav_bridge_guppy",
		"nav_hangar_aquila",
		"nav_deck1_aquila",
		"nav_deck2_aquila",
		"nav_deck3_aquila",
		"nav_deck4_aquila",
		"nav_bridge_aquila"
	)

/obj/machinery/computer/shuttle_control/explore/aquila
	name = "aquila control console"
	shuttle_tag = "Aquila"
	req_access = list(access_aquila_helm)

/obj/machinery/computer/shuttle_control/explore/exploration_shuttle
	name = "charon control console"
	shuttle_tag = "Charon"
	req_access = list(access_expedition_shuttle_helm)

/obj/machinery/computer/shuttle_control/explore/guppy
	name = "guppy control console"
	shuttle_tag = "Guppy"
	req_access = list(access_guppy_helm)

				/////////////////////
				//SEV Torch targets//
				/////////////////////

/obj/effect/landmark/overmap_target/torch
	name = "torch"
	difficulty = 5
/obj/effect/landmark/overmap_target/torch/first
	name = "bridge deck"
/obj/effect/landmark/overmap_target/torch/first/bridge
	name = "bridge"
	difficulty = 60
/obj/effect/landmark/overmap_target/torch/first/ai
	name = "AI core"
	difficulty = 70
/obj/effect/landmark/overmap_target/torch/first/hallway
	name = "top hallway"
	difficulty = 30
/obj/effect/landmark/overmap_target/torch/second
	name = "first deck"
/obj/effect/landmark/overmap_target/torch/second/medical
	name = "medical bay"
	difficulty = 30
/obj/effect/landmark/overmap_target/torch/second/rnd
	name = "research"
	difficulty = 30
/obj/effect/landmark/overmap_target/torch/second/vault
	name = "vault"
	difficulty = 30
/obj/effect/landmark/overmap_target/torch/second/hallway
	name = "middle hallway"
	difficulty = 30
/obj/effect/landmark/overmap_target/torch/second/portnacelle
	name = "first deck port nacelle"
	difficulty = 60
/obj/effect/landmark/overmap_target/torch/second/starbnacelle
	name = "first deck starboard nacelle"
	difficulty = 60
/obj/effect/landmark/overmap_target/torch/third
	name = "second deck"
/obj/effect/landmark/overmap_target/torch/third/supermatter
	name = "supermatter reactor"
	difficulty = 80
/obj/effect/landmark/overmap_target/torch/third/fussion
	name = "fussion reactor"
	difficulty = 80
/obj/effect/landmark/overmap_target/torch/fourth
	name = "third deck"
/obj/effect/landmark/overmap_target/torch/fourth/brig
	name = "brig"
	difficulty = 60
/obj/effect/landmark/overmap_target/torch/fourth/center
	name = "center mass"
	difficulty = 10
/obj/effect/landmark/overmap_target/torch/fourth/portnacelle
	name = "third deck port nacelle"
	difficulty = 60
/obj/effect/landmark/overmap_target/torch/fourth/starbnacelle
	name = "third deck starboard nacelle"
	difficulty = 60
/obj/effect/landmark/overmap_target/torch/fourth/canteen
	name = "canteen"
	difficulty = 50
/obj/effect/landmark/overmap_target/torch/fourth/upload
	name = "AI upload"
	difficulty = 70
/obj/effect/landmark/overmap_target/torch/fourth/missile
	name = "missile pod"
	difficulty = 60
/obj/effect/landmark/overmap_target/torch/fifth
	name = "fourth deck"
/obj/effect/landmark/overmap_target/torch/fifth/hangar
	name = "hangar"
	difficulty = 50
/obj/effect/landmark/overmap_target/torch/fifth/dockC
	name = "dock ports C"
	difficulty = 40
/obj/effect/landmark/overmap_target/torch/fifth/dockB
	name = "dock ports B"
	difficulty = 40
