#include "blueriver_areas.dm"
#include "blueriver_mob.dm"
#include "blueriver_shuttle.dm"
#include "blueriver_papers.dm"

/obj/effect/overmap/sector/arcticplanet
	name = "arctic planetoid"
	desc = "Sensor array detects an arctic planet with a small vessle on the planet's surface. Scans further indicate strange energy levels below the planet's surface."
	in_space = 0
	icon_state = "globe"
	initial_generic_waypoints = list(
		"nav_blueriv_1",
		"nav_blueriv_2",
		"nav_blueriv_3",
		"nav_blueriver_shuttle",
		"nav_blueriv_antag"
	)
	initial_restricted_waypoints = list(
		"Cometa" = list("nav_blueriver_shuttle"),
	)

/obj/effect/overmap/sector/arcticplanet/New(nloc, max_x, max_y)
	name = "[generate_planet_name()], \a [name]"
	..()

/datum/map_template/ruin/away_site/blueriver
	name = "Bluespace River"
	id = "awaysite_blue"
	description = "Two z-level map with an arctic planet and an alien underground surface"
	cost = 1
	prefix = "maps/away_inf/"
	suffixes = list("blueriver/blueriver-1.dmm", "blueriver/blueriver-2.dmm")
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/blueriver_shuttle)

/turf/simulated/floor/away/blueriver/alienfloor
	name = "glowing floor"
	desc = "The floor glows without any apparent reason"
	icon = 'riverturfs.dmi'
	icon_state = "floor"
	temperature = 233

/turf/simulated/floor/away/blueriver/alienfloor/Initialize()
	.=..()

	set_light(0.7, 1, 5, l_color = "#0066ff")

/turf/unsimulated/wall/away/blueriver/livingwall
	name = "alien wall"
	desc = "You feel a sense of dread from just looking at this wall. Its surface seems to be constantly moving, as if it were breathing."
	icon = 'riverturfs.dmi'
	icon_state = "evilwall_1"
	opacity = 1
	density = 1
	temperature = 233

/turf/unsimulated/wall/away/blueriver/livingwall/Initialize()
	.=..()

	if(prob(80))
		icon_state = "evilwall_[rand(1,8)]"

/turf/unsimulated/wall/supermatter/no_spread
	name = "weird liquid"
	desc = "The viscous liquid glows and moves as if it were alive."
	icon='blueriver.dmi'
	icon_state = "bluespacecrystal1"
	layer = SUPERMATTER_WALL_LAYER
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	opacity = 0
	dynamic_lighting = 0

/turf/unsimulated/wall/supermatter/no_spread/Initialize()
	.=..()

	icon_state = "bluespacecrystal[rand(1,3)]"
	set_light(0.7, 1, 5, l_color = "#0066ff")

/turf/unsimulated/wall/supermatter/no_spread/Process()
	return PROCESS_KILL

/obj/machinery/power/apc/blueriver
	req_access = list()
	req_one_access = list(150)

/obj/machinery/alarm/blueriver
	req_access = list()
	req_one_access = list(150)
