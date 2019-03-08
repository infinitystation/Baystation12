/area/outpost/mining
	name = "Mining Outpost Equipment"
	icon_state = "outpost_mine_main"
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT
//	ambience = list('sound/ambience/maintambience.ogg','sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg')
	sound_env = STANDARD_STATION
	turf_initializer = /decl/turf_initializer/maintenance
	ambience = list('infinity/sound/ambience/maintambience2.ogg', 'sound/ambience/ambigen3.ogg', 'sound/ambience/ambigen4.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg') // you don't want to be here
	base_turf = /turf/simulated/floor/asteroid

/area/outpost/mining/hangar
	name = "Mining Outpost Hangar"
	sound_env = LARGE_ENCLOSED

/area/outpost/mining/recreation
	name = "Mining Outpost Recreation Section"

/area/outpost/mining/kitchen
	name = "Mining Outpost Kitchen"

/area/outpost/mining/toilet
	name = "Mining Outpost Restroom"
	sound_env = SMALL_ENCLOSED

/area/outpost/mining/power
	name = "Mining Outpost Solar Control"

/area/outpost/mining/atmos
	name = "Mining Outpost Atmospheric"

/area/outpost/mining/voidsuits
	name = "Mining Outpost Voidsuits"

/area/outpost/mining/cenral
	name = "Mining Outpost Central"

/area/outpost/mining/maints
	name = "Mining Outpost Maintenance"

/area/outpost/mining/medical
	name = "Mining Outpost Medical Comparement"

/area/outpost/mining/solar
	name = "Mining Outpost Solar Array"
	area_flags = AREA_FLAG_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space
	turf_initializer = null