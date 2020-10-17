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
	. = ..()

/obj/machinery/cloaking_device/Initialize()
	. = ..()
	if(dir in list(EAST, WEST))
		bound_width = width * world.icon_size
		bound_height = world.icon_size
	else
		bound_width = world.icon_size
		bound_height = width * world.icon_size
	update_icon()