/turf/simulated/floor/asteroid/sea
	name = "sea stonefloor"
	desc = "Silty."
	icon = 'icons/turf/seafloor.dmi'
	icon_state = "seafloor"
//	flooded = TRUE
	initial_gas = list(oxygen = MOLES_O2STANDARD, nitrogen = MOLES_N2STANDARD)
	temperature = T20C

/turf/simulated/floor/asteroid/sea/Initialize()
	..()
	add_fluid(7, 1)

/turf/simulated/floor/asteroid/sea/dirt
	icon_state = "dirt-dark"

/turf/simulated/floor/asteroid/sea/algae
	name = "algal thickets"
	desc = "Silty sea floor covered with thick and slimy algae bushes."
	icon_state = "grass"

/turf/simulated/floor/asteroid/sea/algae/New()
	icon_state = pick("grass", "grass2", "grass-dark", "grass-dark2")

/turf/simulated/floor/asteroid/sea/abyss
	name = "abyssal silt"
	desc = "Unfathomably silty."
	icon_state = "mud_light"

/turf/simulated/floor/asteroid/sea/abyss/dark
	name = "abyssal silt"
	icon_state = "mud_dark"

/turf/simulated/floor/asteroid/sea/abyss/black
	name = "abyssal silt"
	desc = "Pitch black bottomless abyss."
	icon_state = "abyss"

/turf/unsimulated/ocean_abyss
	name = "abyss wall"
	icon = 'icons/turf/seafloor.dmi'
	icon_state = "rockwall3"
	fluid_blocked_dirs = 1
	opacity = 1
	density = 1
