/area/ship/skrellscoutship
	name = "Scout - Skrellian Ship"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	base_turf = /turf/space
	req_access = list(access_skrellscoutship)

/area/ship/skrellscoutship/solars
	name = "Scout - Solar Area"
	icon_state = "panelsS"

/area/ship/skrellscoutship/crew/quarters
	name = "Scout - Quarters"
	icon_state = "crew_quarters"

/area/ship/skrellscoutship/crew/hallway/d1
	name = "Scout - Hallway - Deck 1"
	icon_state = "hallC1"

/area/ship/skrellscoutship/crew/hallway/d2
	name = "Scout - Hallway - Deck 2"
	icon_state = "hallC2"

/area/ship/skrellscoutship/crew/kitchen
	name = "Scout - Hydroponics"
	icon_state = "kitchen"

/area/ship/skrellscoutship/crew/rec
	name = "Scout - Recreation"
	icon_state = "bar"

/area/ship/skrellscoutship/crew/fit
	name = "Scout - Fitness"
	icon_state = "fitness"

/area/ship/skrellscoutship/crew/toilets
	name = "Scout - Bathroom"
	icon_state = "toilet"

/area/ship/skrellscoutship/crew/medbay
	name = "Scout - Infimary"
	icon_state = "medbay"

/area/ship/skrellscoutship/dock
	name = "Scout - Docking Bay 1"
	icon_state = "hallS"

/area/ship/skrellscoutship/dock/alt
	name = "Scout - Docking Bay 2"
	icon_state = "hallP"

/area/ship/skrellscoutship/hangar
	name = "Scout - Hangar"
	icon_state = "hangar"

/area/ship/skrellscoutship/maintenance
	name = "Scout - maintenance"

/area/ship/skrellscoutship/maintenance/atmos
	name = "Scout - Atmospherics"
	icon_state = "atmos"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/ship/skrellscoutship/maintenance/power
	name = "Scout - Engineering"
	icon_state = "engine_smes"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')

/area/ship/skrellscoutship/command/bridge
	name = "Scout - Helm"
	icon_state = "bridge"

/area/ship/skrellscoutship/command/armory
	name = "Scout - Armory"
	icon_state = "armory"

/area/ship/skrellscoutshuttle
	name = "Scout - Skrellian Shuttle"
	icon_state = "shuttle"
	requires_power = 0
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_skrellscoutship)