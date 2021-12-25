/area/temple
	name = "Temple"
	icon = 'maps/away_inf/temple/icons/areas.dmi'
	icon_state = "temple_center"
	base_turf = /turf/simulated/floor/cult
	ambience = list(
		'infinity/sound/ambience/horror_1.ogg',
		'infinity/sound/ambience/horror_2.ogg',
		'infinity/sound/ambience/horror_3.ogg',
	)
	sound_env = LARGE_ENCLOSED
	requires_power = FALSE


/area/temple/center
	name = "Temple - Center"
	icon_state = "temple_center"


// Disabled before the construction of the north wing
//
// /area/temple/north
// 	name = "Temple - North Wing"
// 	icon_state = "temple_south"


/area/temple/south
	name = "Temple - South Wing"
	icon_state = "temple_south"


/area/temple/south/enterance
	name = "Temple - South Wing - Enterance"


/area/temple/east
	name = "Temple - East Wing"


/area/temple/west
	name = "Temple - West Wing"
	icon_state = "temple_west"
