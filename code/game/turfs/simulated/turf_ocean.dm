/turf/simulated/ocean
	name = "sea floor"
	desc = "Silty."
	icon = 'icons/turf/seafloor.dmi'
	icon_state = "seafloor"
	density = FALSE
	opacity = FALSE
	flooded = TRUE
	var/detail_decal

/turf/simulated/ocean/algae
	name = "algal thickets"
	desc = "Silty sea floor covered with thick and slimy algae bushes."
	icon_state = "grass"

/turf/simulated/ocean/algae/New()			//Random algae sprites
	icon_state = pick("grass", "grass2", "grass-dark", "grass-dark2")

/turf/simulated/ocean/dirt
	icon_state = "dirt-dark"

/turf/simulated/ocean/abyss
	name = "abyssal silt"
	desc = "Unfathomably silty."
	icon_state = "mud_light"

/turf/simulated/ocean/abyss/dark
	icon_state = "mud_dark"

/turf/simulated/ocean/abyss/black
	name = "abyss"
	desc = "Pitch black bottomless abyss."
	icon_state = "abyss"

/turf/simulated/ocean/wall/abyss
	name = "abyss wall"
	icon_state = "rockwall3"
	desc = "Dark rock, covered with slimy shit."
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/ocean/abyss/black/airless
	initial_gas = null
	temperature = TCMB

/turf/simulated/ocean/open
	name = "open ocean"
	icon_state = "still"

/turf/simulated/ocean/open/moving
	icon_state = "moving"

/turf/simulated/ocean/open/add_decal()
	return 0

/turf/simulated/ocean/is_plating()
	return 1

/turf/simulated/ocean/proc/add_decal()
	return prob(20)

/turf/simulated/ocean/Initialize()
	. = ..()
	if(isnull(detail_decal) && add_decal())
		detail_decal = "asteroid[rand(0,9)]"
		update_icon()

/turf/simulated/ocean/update_icon(update_neighbors)
	..(update_neighbors)
	if(detail_decal)
		overlays += image(icon = 'icons/turf/mining_decals.dmi', icon_state = detail_decal)
