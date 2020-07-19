/datum/map_template/ruin/antag_spawn/mercenary
	name = "Mercenary Base"
	suffixes = list("mercenary/mercenary_base_ship.dmm")
	shuttles_to_initialise = list(/datum/shuttle/autodock/multi/antag/merc)

/obj/effect/overmap/visitable/ship/merc
	name = "HCS Daredevil"
	desc = "A heavy combat starship, 89 meters in lenght and 56.4 meters in width. No registration located."
	fore_dir = EAST
	vessel_mass = 32000

	hide_from_reports = TRUE
	in_space = 1

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
	icon = 'infinity/icons/obj/apc_syndi.dmi'
	req_access = list(access_syndicate)

/obj/machinery/alarm/syndieship
	icon = 'infinity/icons/obj/monitors_syndi.dmi'
	req_access = list(access_syndicate)

/obj/machinery/computer/shuttle_control/multi/merc
	name = "desperado control console"
	req_access = list(access_syndicate)
	shuttle_tag = "Desperado"



/obj/machinery/cloaking_device
	name = "cloaking device"

	icon = 'infinity/icons/obj/cloaking.dmi'
	icon_state = "clock-1"

	density = 1
	anchored = 1
	var/width = 2

	var/obj/effect/overmap/visitable/linked

/obj/machinery/cloaking_device/on_update_icon()
	icon_state = "clock-[stat & NOPOWER]"
	if(panel_open)
		icon_state = "[icon_state]-panel"
	. = ..()

/obj/machinery/cloaking_device/proc/link_overmap()
	var/zlevels = GetConnectedZlevels(z)

	for(var/obj/effect/overmap/visitable/attempt in world)
		if(attempt.z in zlevels)
			linked = attempt
			break

/obj/machinery/cloaking_device/Process()
	if(!linked)
		link_overmap()
		return

	if(stat & NOPOWER)
		linked.name = initial(linked.name)
		linked.icon_state = initial(linked.icon_state)
		linked.scannable = initial(linked.scannable)

	else
		linked.name = linked.hidden_name
		linked.icon_state = linked.hidden_icon_state
		linked.scannable = 0

/obj/machinery/cloaking_device/Initialize()
	. = ..()
	if(dir in list(EAST, WEST))
		bound_width = width * world.icon_size
		bound_height = world.icon_size
	else
		bound_width = world.icon_size
		bound_height = width * world.icon_size
	update_icon()