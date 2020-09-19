// Ported from Halo Station 13 Project

#define TDP_CROSS_DELAY 3 SECONDS
#define TDP_UNBREAKABLE -1

/obj/docking_port
	name = "telescopic docking port"
	desc = "A structure, also known as telescopic bridge (telebridge) with integrated life support module. Allows create \"safe\" way to other space objects with same space speed. It has pretty small moving area inside, so you cannot transfer objects larger than a man through it."

	icon = 'infinity/icons/obj/overmap/docking_port.dmi'
	icon_state = "dock_contracted"
	plane = DEFAULT_PLANE
	layer = ABOVE_WINDOW_LAYER

	opacity = 0
	density = 0
	anchored = 1
	pixel_x = -32
	var/side = null //NORTH SOUTH EAST WEST are valid values for this. Setting this causes side-restrictions to apply
	var/obj/effect/overmap/our_ship
	var/broke = 0 //Use TDP_UNBREAKABLE to stop breaking.
	var/repair_step = 0
	var/repair_busy = 0
	var/obj/docking_port/current_connected
	var/movement_cooldown = 0

/obj/docking_port/New()
	. = ..()
	if(initial(broke) == TDP_UNBREAKABLE)
		broke = FALSE
	START_PROCESSING(SSobj, src)

/obj/docking_port/ex_act()
	if(current_connected)
		visible_message(SPAN_NOTICE("The explosion disconnects the docking port!"))
		current_connected.visual_dock_change(1)
		current_connected.current_connected = null
		visual_dock_change(1)
		current_connected = null

/obj/docking_port/proc/ship_setup()
	our_ship = map_sectors["[z]"]
	if(!isnull(our_ship))
		our_ship.connectors += src

/obj/docking_port/LateInitialize()
	. = ..()
	if(!GLOB.using_map.use_overmap)
		return INITIALIZE_HINT_QDEL

/obj/docking_port/Process()
	if(isnull(our_ship))
		ship_setup()
		STOP_PROCESSING(SSobj, src)

/obj/docking_port/proc/visual_dock_change(var/contract = 0, var/no_message = 0)
	if(contract == 1)
		icon_state = "dock_contracted"
		flick("dock_contract", src)
		if(!no_message)
			visible_message(SPAN_NOTICE("[src] disconnects from [current_connected.our_ship.name] and starts contracting."))
	else
		icon_state = "dock_extended"
		flick("dock_extend", src)
		if(!no_message)
			visible_message(SPAN_NOTICE("[src] starts extending towards [current_connected.our_ship.name]."))

/obj/docking_port/verb/cross_dock_verb()
	set name = "Cross Dock"
	set category = "Object"
	set src in view(1)

	cross_dock(usr)

/obj/docking_port/examine(mob/user)
	. = ..()
	if(broke)
		to_chat(user, SPAN_WARNING("The dock exchanges smoke from a hatch and the bridge looks broken. Seems like it was busted."))

/obj/docking_port/proc/cross_dock(var/mob/user, var/mob/loader = null)
	if(!istype(user))
		return
	if(!current_connected)
		to_chat(user, SPAN_NOTICE("[src] is not connected to anything."))
		return
	if(!isturf(loc))
		return
	if(!isturf(current_connected.loc))
		return
	if(movement_cooldown + 10 SECONDS > world.time)
		to_chat(user, SPAN_NOTICE("The dock's bridge didn't restor its form since last cross. Wait a bit."))
		return
	movement_cooldown = world.time
	user.forceMove(loc)
	if(loader)
		loader.visible_message(SPAN_NOTICE("[loader] starts pushing [user] through [src]\'s airlock."))
	else
		user.visible_message(SPAN_NOTICE("[user] starts climbing through [src]\'s airlock..."))
	if(loader)
		if(!do_after(loader, TDP_CROSS_DELAY, user))
			return
	else
		if(!do_after(user, TDP_CROSS_DELAY, src))
			return
	if(!src.Adjacent(user) || !(user.loc = loc))
		return
	if(loader)
		loader.visible_message(SPAN_NOTICE("[loader] pushes [user] through [src]\'s airlock."))
	else
		user.visible_message(SPAN_NOTICE("[user] climbs through [src]\'s airlock."))
	translate_obj(user)

/obj/docking_port/proc/translate_obj(var/obj/to_move)
	if(!isturf(current_connected.loc))
		return
	to_move.forceMove(current_connected.loc)

/obj/docking_port/MouseDrop(var/obj/over_object)
	var/mob/user = usr
	if(!istype(over_object, /obj))
		return
	if(istype(over_object, /obj/vehicle) || istype(over_object, /mob/living/exosuit))
		return //Yeah no vehicles-through-dock thanks. use a dropship.
	if(over_object.anchored)
		return
	if(!Adjacent(user) || !user.Adjacent(over_object))
		return
	user.visible_message(SPAN_NOTICE("[user] starts loading [over_object] through [src]\'s airlock."))
	if(!do_after(user, TDP_CROSS_DELAY, over_object))
		return
	user.visible_message(SPAN_NOTICE("[user] loads [over_object] into [src]."))
	translate_obj(over_object)

/obj/docking_port/attackby(var/obj/item/I, var/mob/user)
	if(!repair(user, I))
		return
	if(istype(I, /obj/item/grab))
		var/obj/item/grab/G = I
		cross_dock(G.affecting, user)

/obj/docking_port/proc/check_dir_compatible(var/obj/docking_port/dock)
	if(isnull(side) || isnull(dock.side)) //Null value means either we or they don't care about sides.
		return 1
	if((side == NORTH && dock.side == SOUTH) || (side == SOUTH && dock.side == NORTH))
		return 1
	if((side == EAST && dock.side == WEST) || (side == WEST && dock.side == EAST)) //Splitting these up for the sake of readability.
		return 1
	return 0

/obj/docking_port/proc/get_all_docks(var/obj/effect/overmap/connect_to)
	var/list/valid_docks = list()
	for(var/obj/docking_port/other_dock in connect_to.connectors)
		if(isnull(other_dock.current_connected) && (!other_dock.broke) && check_dir_compatible(other_dock))
			valid_docks += other_dock
	return valid_docks

/obj/docking_port/proc/get_player_picked_dock(var/obj/effect/overmap/connect_to, var/mob/user)
	var/list/dock_name_assoc = list()
	for(var/obj/dock in get_all_docks(connect_to))
		dock_name_assoc += "[dock.name]"
		dock_name_assoc["[dock.name]"] = dock
	var/dock_name_picked = input(user, "Attachment point selection.", "Select an attachment point", "Cancel") in dock_name_assoc + list("Cancel")
	if(dock_name_picked == "Cancel")
		return null
	return dock_name_assoc[dock_name_picked]

/obj/docking_port/proc/connect(var/obj/effect/overmap/connect_to, var/mob/user, var/random_connect = 0)
	var/obj/docking_port/dock //This will be the dock we connect to.
	if(random_connect)
		dock = pick(get_all_docks(connect_to))
	else
		dock = get_player_picked_dock(connect_to, user)
		if(isnull(dock))
			to_chat(user, SPAN_NOTICE("Connection point selection cancelled."))
			return
	if(dock)
		current_connected = dock
		visual_dock_change()
		dock.current_connected = src
		dock.visual_dock_change()
	else
		visible_message(SPAN_NOTICE("[src] beeps a message: \"No valid connection points. Repositioning may reveal more connection points.\""))

/obj/docking_port/proc/disconnect(var/mob/user)
	if(isnull(current_connected))
		return
	var/confirm = alert(user, "Are you sure you want to disconnect from [current_connected.name] on [current_connected.our_ship.name]?", , "Yes", "No")
	if(isnull(confirm) || (confirm != "Yes"))
		return
	current_connected.visual_dock_change(1)
	current_connected.current_connected = null
	visual_dock_change(1)
	current_connected = null

/obj/docking_port/proc/pick_entity_connect_disconnect(var/mob/user)
	if(broke)
		to_chat(user, SPAN_WARNING("[src] is broken!"))
		return
	if(current_connected)
		disconnect(user)
	else
		var/obj/effect/overmap/entity_connect = get_player_connect_to_choice(user)
		if(!entity_connect)
			return
		connect(entity_connect, user)

/obj/docking_port/proc/get_player_connect_to_choice(var/mob/user)
	var/list/overmap_name_assoc = list()
	var/list/objs_in_view = view(1, our_ship) - our_ship
	if(!objs_in_view || !objs_in_view.len)
		to_chat(user, SPAN_NOTICE("No entities in view."))
		return
	for(var/obj/effect/overmap/obj in objs_in_view) //We should probably remove our ship from this selection.
		overmap_name_assoc += "[obj.name]"
		overmap_name_assoc["[obj.name]"] = obj
	var/overmap_name_picked = input(user, "Entity connection selection.", "Select an entity to connect to.", "Cancel") in overmap_name_assoc + list("Cancel")
	if(overmap_name_picked == "Cancel")
		to_chat(user, SPAN_NOTICE("Cancelled."))
		return
	return overmap_name_assoc[overmap_name_picked]

/obj/docking_port/attack_hand(var/mob/user)
	if(!our_ship)
		ship_setup()
	if(repair_step >= 1)
		repair(user)
		return
	pick_entity_connect_disconnect(user)

/obj/docking_port/proc/dock_break()
	if(initial(broke) == TDP_UNBREAKABLE)
		current_connected.visual_dock_change(1)
		current_connected.current_connected = null
		visual_dock_change(1)
		current_connected = null
		return
	broke = TRUE
	icon_state = "dock_broken"
	visible_message(SPAN_WARNING("[src] flexes and strains from movement."))
	visible_message(SPAN_DANGER("-SNAP-"))
	if(current_connected?.current_connected)
		current_connected.current_connected = null
	current_connected = null
	set_extension(src, /datum/extension/scent/burned_wiring)

#undef TDP_CROSS_DELAY
