//Please, test this before including this in sierra.dm.
//Rly. test. this. shit.

//Entrie map

/obj/effect/overmap/visitable/ship/shipcrash
	name = "GMV Void"
	desc = "Sensors detect Grayson Mining Vessel - \"Void\""
	color = COLOR_BLUE
	max_speed = 1/(3 SECONDS)
	burn_delay = 3 SECONDS
	start_x = 4
	start_y = 5

/datum/map_template/ruin/away_site/shipcrash
	name = "Mining ship crash"
	id = "awaysite_ship_crash_1"
	description = "Grayson mining vessel"
	prefix = "maps/away_inf/"
	suffixes = list("shipcrash/shipcrash.dmm")
	spawn_cost = 1
	accessibility_weight = 10
//	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED //UNCOMMENT THIS FOR TESTING PURPOSES; MAKES MAP SPAWNING EVERY ROUND
	area_usage_test_exempted_root_areas = list(/area/shipcrash)
	apc_test_exempt_areas = list(/area/shipcrash)

//Areas

area
	shipcrash
		icon = 'maps/away_inf/shipcrash/shipcrash_areas.dmi'
		bridge
			name = "Bridge"
			icon_state = "blue"
		living
			name = "Living"
			icon_state = "green"
			kitchen
				name = "Kitchen"
			medbay
				name = "Medical Bay"
		utility
			name = "Hangar"
			icon_state = "cyan"
			eva
				name = "EVA"
			storage
				name = "Storage"
		eng
			name = "Engineering"
			icon_state = "orange"
			smes
				name = "SMES room"
			atmo
				name = "Atmospherics"
			engines
				name = "Engines"





