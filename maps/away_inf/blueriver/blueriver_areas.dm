/area/bluespaceriver
	icon_state = "underground"
	icon = 'blueriver.dmi'
	sound_env = ASTEROID
	req_access = list(access_syndicate)

/area/bluespaceriver/underground
	name = "\improper Bluespace River Underground"
	ambience = list('sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg')

/area/bluespaceriver/ground
	name = "\improper Arctic Planet Surface"
	icon_state = "ground"
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg')

/area/bluespaceriver/ship
	name = "Cometa"
	icon_state = "ship"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/bluespaceriver/ship/cockpit
	name = "Cometa - Cockpit"
/area/bluespaceriver/ship/power
	name = "Cometa - Power Compartment"
/area/bluespaceriver/ship/medical
	name = "Cometa - Medical Compartment"
/area/bluespaceriver/ship/restroom
	name = "Cometa - Restroom"
/area/bluespaceriver/ship/storage
	name = "Cometa - Storage"
/area/bluespaceriver/ship/sec_storage
	name = "Cometa - Secured Storage"
/area/bluespaceriver/ship/airlock
	name = "Cometa - Airlock"
/area/bluespaceriver/ship/autolathe
	name = "Cometa - Autolathe"
