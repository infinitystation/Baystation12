/datum/map_template/ruin/antag_spawn/abductors
	name = "Abductors' Mothership"
	suffixes = list("abductors/abductors_base_inf.dmm")

/area/map_template/abductors_station
	name = "\improper Abductors' Mothership"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 0

/turf/unsimulated/wall/alien
	icon = 'infinity/icons/turf/abductors.dmi'
	icon_state = "abductor"

/turf/unsimulated/wall/alien/Initialize(var/newloc)
	. = ..(newloc,MATERIAL_ALIEN)

/turf/unsimulated/floor/alien
	name = "crystaline alloy floor"
	icon = 'infinity/icons/turf/abductors.dmi'
	icon_state = "alienpod1"

/turf/unsimulated/floor/alien/proc/SetRandomIcon_State()
	icon_state = "alienpod[rand(1,9)]"

/turf/unsimulated/floor/alien/Initialize()
	. = ..()
	SetRandomIcon_State()