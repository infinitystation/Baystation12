#include "colony_papers.dm"
#include "colony_areas.dm"

/obj/effect/overmap/visitable/sector/colonyruin
	name = "Piscium-Alpha 372 SEG"
	desc = "A large, warm planet with a galloping relief. A weak SOS signal comes from the northern part of the planet. Debris field discovered in its orbit."
	in_space = 0
	icon_state = "globe"
	initial_generic_waypoints = list(
		"nav_colonyruin_1"
	)
	initial_restricted_waypoints = list(
		"Guppy" = list("nav_colonyruin_guppy")
	)

/obj/effect/shuttle_landmark/nav_colonyruin/nav1
	name = "Piscium-Alpha 372 Landing Point #1"
	landmark_tag = "nav_colonyruin_1"

/obj/effect/shuttle_landmark/nav_colonyruin/nav2
	name = "Piscium-Alpha 372 SEG Landing Point #2"
	landmark_tag = "nav_colonyruin_guppy"

/datum/map_template/ruin/away_site/blueriver
	name = "Colony Ruin"
	id = "awaysite_colonyruin"
	description = "Away site with ruins of colony"
	cost = 0.5
	generate_mining_by_z = 1
	prefix = "maps/away_inf/"
	suffixes = list("colonyruin/colony.dmm")
	area_usage_test_exempted_root_areas = list(/area/colonyruin)