/datum/map_template/ruin/antag_spawn/mercenary
	name = "Mercenary Base"
	suffixes = list("mercenary/mercenary_base_ship.dmm")
	shuttles_to_initialise = list(/datum/shuttle/autodock/multi/antag/merc)


//REWORK

/obj/effect/overmap/visitable/ship/merc
	name = "strange ion cloud"
	desc = "Unusual ion cloud. Sensors detects a non-standart cloaking device, location unknown."
	fore_dir = EAST
	vessel_mass = 12000

	hide_from_reports = TRUE
	in_space = 1
	icon_state = "ion1"

	initial_restricted_waypoints = list(
		"Desperado" = list("nav_desperado_start")
	)


/datum/shuttle/autodock/multi/antag/merc
	name = "Desperado"
	defer_initialisation = TRUE
	warmup_time = 7
	destination_tags = list(
		"nav_desperado_start"
		)
	shuttle_area = /area/map_template/merc_shuttle
	current_location = "nav_desperado_start"
	landmark_transition = "nav_desperado_transition"
	announcer = "Proximity Sensor Array"
	arrival_message = "Attention, anomalous sensor reading detected entering vessel proximity."
	departure_message = "Attention, anomalous sensor reading detected leaving vessel proximity."
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/merc

/obj/effect/shuttle_landmark/merc/start
	name = "Desperado"
	landmark_tag = "nav_desperado_start"
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/merc/internim
	name = "In transit"
	landmark_tag = "nav_desperado_transition"

/turf/simulated/floor/shuttle_ceiling/merc
	color = COLOR_RED

//Areas

/area/map_template/merc_spawn
	name = "\improper TCV Tersten Tenacity"
	icon_state = "syndie-ship"
	req_access = list(access_syndicate)

/area/map_template/merc_spawn/eva

/area/map_template/merc_spawn/cryo

/area/map_template/merc_spawn/hall

/area/map_template/merc_spawn/armory

/area/map_template/merc_spawn/hallway

/area/map_template/merc_spawn/engineering

/area/map_template/merc_spawn/brig

/area/map_template/merc_spawn/bridge

/area/map_template/merc_spawn/medbay

/area/map_template/merc_spawn/teleport

/area/map_template/merc_shuttle
	name = "\improper Desperado"
	icon_state = "yellow"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_syndicate)

/obj/machinery/suit_storage_unit/syndie
	name = "Nonstandard Voidsuit Storage Unit"
	suit= /obj/item/clothing/suit/space/void/merc
	helmet = /obj/item/clothing/head/helmet/space/void/merc
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/weapon/tank/oxygen
	mask = /obj/item/clothing/mask/breath
	req_access = list(access_syndicate)
	islocked = 1
	mycolour = "#9e2626"

/obj/machinery/power/apc/syndieship
	req_access = list(access_syndicate)

/obj/machinery/alarm/syndieship
	req_access = list(access_syndicate)
