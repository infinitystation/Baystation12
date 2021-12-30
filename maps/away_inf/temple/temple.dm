#include "temple_areas.dm"
#include "temple_landmarks.dm"
#include "temple_machinery.dm"
#include "temple_mobs.dm"
#include "temple_structures.dm"


/obj/effect/overmap/visitable/sector/temple
	name = "large asteroid"
	desc = "A large-sized asteroid. A large unknown structure has been discovered in the asteroid."
	icon_state = "sector"
	known = 1

	initial_generic_waypoints = list(
		"nav_temple_1",
		"nav_temple_2",
		"nav_temple_3",
	)

/datum/map_template/ruin/away_site/temple
	name = "Nar-si Temple"
	description = "Something that whispers in the darkness of space.."
	id = "narsi_temple"
	prefix = "maps/away_inf/"
	suffixes = list("temple/temple.dmm")

	spawn_weight = 1
	spawn_cost = 0.5
	player_cost = 1

	area_usage_test_exempted_root_areas = list(/area/temple)
	apc_test_exempt_areas = list(
		/area/temple = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/temple/center = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/temple/south = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/temple/south/enterance = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/temple/west = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/temple/east = NO_SCRUBBER|NO_VENT|NO_APC,
	)
