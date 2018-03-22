/obj/effect/overmap/ship/bearcat
	name = "FTV Bearcat"
	color = "#00ffff"
	start_x = 4
	start_y = 4
	base = 1
	vessel_mass = 60
	default_delay = 3 MINUTES
	speed_mod = 0.1 MINUTE
	burn_delay = 10 SECONDS

	generic_waypoints = list(
		"nav_bearcat_below_bow",
		"nav_bearcat_port_dock_shuttle",
		"nav_skipjack_deck1",
		"nav_skipjack_deck2",
		"nav_skipjack_deck3",
		"nav_skipjack_dock"
		)

	restricted_waypoints = list(
		"Exploration Pod" = list("nav_bearcat_starboard_dock_pod"), //pod can only dock starboard-side, b/c there's only one door.
	)