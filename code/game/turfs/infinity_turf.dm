/turf/simulated/floor/airless/asteroid
	icon = 'icons/turf/floors.dmi'
	icon_state = "asteroidplating"

/turf/simulated/floor/tiled/airless/asteroid
	icon_state = "asteroidfloor"
	icon = 'icons/turf/floors.dmi'
	initial_flooring = /decl/flooring/tiling/asteroid

/turf/simulated/floor/asteroid/aired
	initial_gas = list(oxygen = MOLES_O2STANDARD, nitrogen = MOLES_N2STANDARD)
	temperature = TCMB

/turf/simulated/floor/tiled/asteroid
	icon_state = "asteroidfloor"
	icon = 'icons/turf/floors.dmi'
	initial_flooring = /decl/flooring/tiling/asteroid
