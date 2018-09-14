//	area_flags = AREA_FLAG_RAD_SHIELDED
//	sound_env = TUNNEL_ENCLOSED
// - mappers uses.

/area/rubbidu
	name = "Space Junk"
	icon = 'rubbidu_areas.dmi'
	turf_initializer = /decl/turf_initializer/maintenance

/area/rubbidu/solar
	name = "Solar Arrays"
	turf_initializer = /decl/turf_initializer/maintenance/space

/area/rubbidu/command
	name = "Command Equipment"
	icon_state = "rubbidu_com"
	turf_initializer = null

/area/rubbidu/command/bridge
	name = "Bridge"
	icon_state = "rubbidu_com"

/area/rubbidu/command/xo
	name = "XO's Post"
	icon_state = "rubbidu_com"

/area/rubbidu/command/quarters
	name = "CO and XO's Quarters"
	icon_state = "rubbidu_com"

/area/rubbidu/engineering
	name = "Engineering area"
	icon_state = "rubbidu_eng"

/area/rubbidu/engineering/power
	name = "SMES control"
	icon_state = "rubbidu_eng"

/area/rubbidu/engineering/eva
	name = "E.V.A."

/area/rubbidu/civil
	name = "Cryogenic"
	icon_state = "rubbidu_civ"

/area/rubbidu/rad
	name = "Anti-Rad Area"
	area_flags = AREA_FLAG_RAD_SHIELDED


/area/rubbidu/civil/botany
	name = "Botany"

/area/rubbidu/civil/canteen
	name = "Canteen"

/area/rubbidu/hangar
	name = "Hangar bay"
	icon_state = "rubbidu_han"

/area/rubbidu/dock
	name = "Dock area"
	icon_state = "rubbidu_han"

/area/rubbidu/nt
	name = "Nanotrasin area"
	icon_state = "rubbidu_nt"
	turf_initializer = null
