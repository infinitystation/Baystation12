#define WEBHOOK_SUBMAP_LOADED_SOL"webhook_submap_sol"

#include "patrol_areas.dm"
#include "patrol_crew.dm"
#include "patrol_items.dm"
#include "patrol_shuttle.dm"
#include "patrol_structures.dm"

/* OVERMAP
 * =======
 */

/datum/map_template/ruin/away_site/patrol
	name = "Sol Patrol Shuttle"
	id = "awaysite_patrol_ship"
	description = "A saviours for crew."
	prefix = "maps/away_inf/"
	suffixes = list("patrol/patrol.dmm")
	cost = 1000
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/scgpatrol)
	apc_test_exempt_areas = list(
		/area/ship/patrol/atmos = NO_SCRUBBER|NO_VENT,
		/area/ship/patrol/power = NO_SCRUBBER|NO_VENT,
	)

/obj/effect/overmap/visitable/sector/scgpatrol
	name = "Bluespace Traces"
	desc = "Slight traces of a cloaking device are present. Unable to determine exact location."
	in_space = 1
	icon_state = null

/var/const/access_away_patrol = "ACCESS_AWAYPATROL"

