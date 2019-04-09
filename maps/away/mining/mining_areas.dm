// GENERIC MINING AREAS
/area/mine
	icon_state = "mining"
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg', 'sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg')
	sound_env = ASTEROID
	has_gravity = TRUE
	base_turf = /turf/simulated/floor/asteroid

/area/mine/explored
	name = "Mine"
	icon_state = "explored"

/area/mine/unexplored
	name = "Mine"
	icon_state = "unexplored"

// OUTPOSTS
/area/outpost/abandoned
	name = "Abandoned Outpost"
	icon_state = "dark"

/area/djstation
	name = "\improper Listening Post"
	icon_state = "LP"