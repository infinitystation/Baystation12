#include "patrol_crew.dm"
#include "patrol_items.dm"
#include "patrol_shuttle.dm"
#include "patrol_structures.dm"

/* OVERMAP
 * =======
 */

/datum/map_template/ruin/away_site/patrol
	name = "Sol Rescue Shuttle (ERT)"
	id = "awaysite_patrol_ship"
	description = "A saviours for crew."
	prefix = "maps/away_inf/"
	suffixes = list("patrol/patrol.dmm")
	cost = 1000
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/scgpatrol)

/obj/effect/overmap/sector/scgpatrol
	name = "Bluespace Traces"
	desc = "Slight traces of a cloaking device are present. Unable to determine exact location."
	in_space = 1
	icon_state = null

/var/const/access_away_patrol = "ACCESS_AWAY_PATROL"

/* AREAS
 * =====
 */

/area/ship/patrol
	name = "\improper Sol Rescue Shuttle"
	icon_state = "shuttlered"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	base_turf = /turf/simulated/floor/plating
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	req_access = list(access_away_patrol)

/area/ship/patrol/cargo
	name = "\improper RS - Cargo"
/area/ship/patrol/medbay
	name = "\improper RS - Medical"
/area/ship/patrol/atmos
	name = "\improper RS - Atmospheric"
/area/ship/patrol/power
	name = "\improper RS - Power"
/area/ship/patrol/cockpit
	name = "\improper RS - Cockpit"
/area/ship/patrol/airlock
	name = "\improper RS - Airlock"