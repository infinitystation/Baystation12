/area/ship/tajsciship
	name = "Tajaran Ship" //CCA NSV Ma'Shira-13
	icon_state = "ship"
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	req_access = list(access_tajsciship)
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	turf_initializer = /decl/turf_initializer/maintenance/heavy //damaged ship

/area/ship/tajsciship/bridge
	name = "Bridge"

/area/ship/tajsciship/dormitory
	name = "Living Area"
	icon_state = "dorms"

/area/ship/tajsciship/medbay
	name = "Medical Zone"
	icon_state = "meatbay"

/area/ship/tajsciship/botany
	name = "Hydro"
	icon_state = "botany"

/area/ship/tajsciship/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/ship/tajsciship/hangar
	name = "Hangarus"
	icon_state = "hangar"

/area/ship/tajsciship/engines
	name = "Enginus"
	icon_state = "engines"

/area/ship/tajsciship/storage
	name = "Empty Room"
	icon_state = "sklad1"

/area/ship/tajsciship/solars
	name = "Solar Array Control"
	icon_state = "solari"

/area/ship/tajsciship/solars/array
	name = "Solar Array"
	icon_state = "solari"
	area_flags = AREA_FLAG_EXTERNAL
	turf_initializer = null

/area/ship/tajsciship/shuttle
	name = "CCA EC Shuttle"
	icon_state = "shtl"
	base_turf = /turf/simulated/floor/plating
