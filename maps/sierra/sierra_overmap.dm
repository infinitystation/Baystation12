/obj/effect/overmap/visitable/ship/sierra
	name = "NSV Sierra"
	desc = "A space object with wide of 121.2 meters, length of 214.5 meters and high near 14.3 meters. A Self Indentification Signal classifices \
	the target as NanoTrasen Science Vessel, a property of NanoTrasen Corporation."
	fore_dir = WEST
	vessel_mass = 63000
	base = TRUE
	color = LIGHT_COLOR_PURPLE
	icon = 'icons/obj/overmap_inf.dmi'

	initial_restricted_waypoints = list(
		"Charon" = list("nav_hangar_calypso"),
		"Guppy" = list("nav_hangar_guppy"),
		"Desperado" = list("nav_merc_dock"), //antag_spawn/mercenary/mercenary_inf.dmm shuttle,
		"Albatross" = list("nav_albatross_dock"), //away_inf/sentinel/sentinel.dmm shuttle,
		"Sol Rescue Shuttle" = list("nav_deck3_patrol"), //away_inf/patrol/patrol.dmm shuttle,
		"Skrellian Shuttle" = list("nav_deck3_skrellshuttle"), //away_inf/skrellscoutship.dm shuttle,
		"Skrellian Scout" = list("nav_deck1_skrellscout"), //away_inf/skrellscoutship.dm shuttle,
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
		"nav_deck1_salvage",
		"nav_bridge_guppy",
		"nav_hangar_aquila",
		"nav_deck1_aquila",
		"nav_deck2_aquila",
		"nav_deck3_aquila",
		"nav_deck4_aquila",
		"nav_bridge_aquila"
	)

/obj/effect/overmap/visitable/ship/landable/exploration_shuttle
	name = "Charon"
	shuttle = "Charon"
	max_speed = 1/(4 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 4700
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL

/obj/effect/overmap/visitable/ship/landable/guppy
	name = "Guppy"
	shuttle = "Guppy"
	max_speed = 1/(4 SECONDS) //was 1/(10 SECONDS)
	burn_delay = 0.5 SECONDS //was 2 SECONDS, just try to not burn all the fuel
	vessel_mass = 500 //was 2200, yes, it's 500 tonnes
	fore_dir = SOUTH
	vessel_size = SHIP_SIZE_TINY
	skill_needed = SKILL_BASIC //was trained

/obj/machinery/computer/shuttle_control/explore/exploration_shuttle
	name = "charon control console"
	shuttle_tag = "Charon"
	req_access = list(access_expedition_shuttle_helm)

/obj/machinery/computer/shuttle_control/explore/guppy
	name = "guppy control console"
	shuttle_tag = "Guppy"
	req_access = list(access_guppy_helm)
