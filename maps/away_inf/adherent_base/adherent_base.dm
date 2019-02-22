#include "adherent_base_areas.dm"
#include "adherent_base_preset.dm"
#include "adherent_base_turfs.dm"
#include "adherentbot.dm"

/obj/effect/overmap/sector/adherent_base
	name = "aquatic planet"
	desc = "There is faint \"S.O.S.\" signal incoming from the water surface. Decyphering codes are very old."
	color = COLOR_OCEAN
	icon_state = "globe"
	initial_generic_waypoints = list("nav_adherent_base_1")
	known = 0

/datum/map_template/ruin/away_site/adherent_base
	name = "aquatic planet"
	id = "awaysite_adherent_planet"
	description = "There is faint \"S.O.S.\" signal incoming from the water surface. Decyphering codes are very old."
	prefix = "maps/away_inf/"
	suffixes = list("adherent_base/adherent_base_1.dmm", "adherent_base/adherent_base_2.dmm", "adherent_base/adherent_base_3.dmm")
	cost = 1000	//event only

/obj/effect/shuttle_landmark/adherent_base/nav1
	name = "Aquatic Planet - Island Landing Area"
	landmark_tag = "nav_adherent_base_1"
