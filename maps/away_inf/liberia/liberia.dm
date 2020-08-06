#define WEBHOOK_SUBMAP_LOADED_LIBERIA "webhook_submap_liberia"

#include "liberia_areas.dm"
//#include "liberia_jobs.dm"
#include "liberia_shuttles.dm"

// Map template data.
/datum/map_template/ruin/away_site/liberia
	name = "Liberia"
	id = "awaysite_liberia"
	description = "A Merchant ship."
	prefix = "maps/away_inf/"
	suffixes = list("liberia/liberia.dmm")
	cost = 0.5 //INF WAS 2
	spawn_weight = 50 //HABITABLE SHIPS SPAWN
	shuttles_to_initialise = list(
		/datum/shuttle/autodock/overmap/mule
		)

// Overmap objects.
/obj/effect/overmap/visitable/ship/liberia
	name = "Liberia"
	desc = "Sensors detect a merchant ship."
	color = "#8A6642"
	vessel_mass = 3000
	fore_dir = WEST
	max_speed = 1/(1 SECOND)
	initial_restricted_waypoints = list(
		"Mule" = list("nav_hangar_mule")
	)
	known = 0
