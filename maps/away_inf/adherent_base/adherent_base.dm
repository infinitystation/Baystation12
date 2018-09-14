#include "adherent_base.dm"

/obj/effect/overmap/sector/adherent_base
	name = "orbital station"
	desc = "Sensors detect an orbital station above the exoplanet. Sporadic magentic impulses are registred inside it. Planet landing is impossible due to lower orbits being cluttered with chaotically moving metal chunks."
	icon_state = "object"
	known = 0

	initial_generic_waypoints = list("adherent_base_1")

/datum/map_template/ruin/away_site/adherent_base
	name = "Aquatic planet"
	id = "awaysite_adherent_planet"
	description = "There is faint \"Mayday\" signal incoming from the water surface. Decyphering codes are very old."
	suffixes = list("adherent_base/adherent_base.dmm")
	cost = 1000 											//event only

/obj/effect/shuttle_landmark/adherent_base/nav1
	name = "ISquatic Planet Island Navpoint"
	landmark_tag = "nav_adherent_base_1"
