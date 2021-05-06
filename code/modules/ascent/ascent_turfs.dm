/decl/flooring/tiling_ascent
	name = "floor"
	desc = "An odd jigsaw puzzle of alloy plates."
	icon = 'icons/turf/flooring/alium.dmi'
	icon_base = "jaggy"
	has_base_range = 6
	has_damage_range = 4 //INF
	has_burn_range = 2 //INF
	color = COLOR_GRAY40
	flags = TURF_CAN_BREAK | TURF_CAN_BURN
	footstep_type = /decl/footsteps/tiles

/turf/simulated/wall/ascent
	paint_color = COLOR_PURPLE //INF, WAS color

/turf/simulated/wall/r_wall/ascent
	paint_color = COLOR_PURPLE //INF, WAS color

/turf/simulated/floor/shuttle_ceiling/ascent
	color = COLOR_PURPLE
	icon_state = "jaggy"
	icon = 'icons/turf/flooring/alium.dmi'

/turf/simulated/floor/ascent
	name = "mantid plating"
	color = COLOR_GRAY20
	initial_gas = list(GAS_METHYL_BROMIDE = MOLES_CELLSTANDARD * 0.5, GAS_OXYGEN = MOLES_CELLSTANDARD * 0.5)
	icon_state = "curvy"
	footstep_type = /decl/footsteps/tiles
	icon = 'icons/turf/flooring/alium.dmi'

/turf/simulated/floor/ascent/is_plating()
	. = TRUE

/turf/simulated/floor/ascent/Initialize()
	. = ..()
	icon_state = "[initial(icon_state)][rand(0,6)]"

/turf/simulated/floor/ascent/tiled
	name = "floor"
	icon_state = "jaggy"
	color = COLOR_GRAY40
