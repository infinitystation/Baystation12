/turf/simulated/floor/airless/asteroid
	name = "dusted plate"
	icon = 'icons/turf/floors.dmi'
	icon_state = "asteroidplating"

/turf/simulated/floor/asteroidplate
	name = "dusted plate"
	icon = 'icons/turf/floors.dmi'
	icon_state = "asteroidplating"

/turf/simulated/floor/asteroid/aired
	initial_gas = list(oxygen = MOLES_O2STANDARD, nitrogen = MOLES_N2STANDARD)
	temperature = T20C

/turf/simulated/floor/tiled/asteroid
	name = "dusted floor"
	icon_state = "asteroidfloor"
	icon = 'icons/turf/floors.dmi'
	initial_flooring = /decl/flooring/tiling/asteroid

/turf/simulated/floor/tiled/asteroid/airless
	initial_gas = null
	temperature = TCMB
