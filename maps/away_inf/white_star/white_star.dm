#include "white_star_areas.dm"

/obj/effect/overmap/ship/white_star
	name = "Unidentified ship"
	desc = "Error. Scanning is impossible."
	color = "#c6d8eb"
	vessel_mass = 3500
	max_speed = 1/(2 SECONDS)
	//	icon_state = "malf_ship"

/datum/map_template/ruin/away_site/white_star
 	name = "White_star"
 	id = "white_star"
 	prefix = "maps/away_inf/"
 	suffixes = list("white_star/white_star.dmm")
 	cost = 1000

/*obj/effect/overmap/ship/white_star_alt
	name = "Unidentified ship"
	desc = "Error. Scanning is impossible."
	color = "#c6d8eb"
	vessel_mass = 4000
	max_speed = 1/(2 SECONDS)*/
