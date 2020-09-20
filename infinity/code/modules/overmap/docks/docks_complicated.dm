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
	if(busy_to_cross)
		to_chat(user, SPAN_NOTICE("Someone is already moving though."))
		return
//check for atmosphere
	var/radlevel = SSradiation.get_rads_at_turf(current_connected.loc)
	var/airstatus = IsTurfAtmosUnsafe(current_connected.loc)
	if(airstatus || radlevel > 0)
		var/reply = alert(user, "Warning. Dangerouse environmental conditions. Are you sure you want to cross the dock? \
		DETAILS: Atmosphere: [airstatus] Radiation: [radlevel] Roentgen.", "Dangerouse area", "No", "Cross")
		if(reply == "No")
			return FALSE
//check for movement cooldown
	if(movement_cooldown + 10 SECONDS > world.time)
		to_chat(user, SPAN_NOTICE("The dock's bridge didn't restor its form since last cross. Wait a bit."))
		return
//cross time!
	user.forceMove(loc)
	busy_to_cross = 1
	if(loader)
		loader.visible_message(SPAN_NOTICE("[loader] starts pushing [user] through [src]\'s airlock."))
	else
		user.visible_message(SPAN_NOTICE("[user] starts climbing through [src]\'s airlock..."))
	if(loader)
		if(!do_after(loader, TDP_CROSS_DELAY, user))
			busy_to_cross = 0
			return
	else
		if(!do_after(user, TDP_CROSS_DELAY, src))
			busy_to_cross = 0
			return
	if(!src.Adjacent(user) || !(user.loc = loc))
		busy_to_cross = 0
		return
	if(movement_cooldown + 10 SECONDS > world.time) //when two players are trying to cross from both sides
		to_chat(user, SPAN_NOTICE("The dock's bridge didn't restor its form since last cross. Wait a bit."))
		return
	busy_to_cross = 0
//succeseful (from this side) cross
	movement_cooldown = world.time
	current_connected.movement_cooldown = world.time
	if(loader)
		loader.visible_message(SPAN_NOTICE("[loader] pushes [user] through [src]\'s airlock."))
	else
		user.visible_message(SPAN_NOTICE("[user] climbs through [src]\'s airlock."))
	translate_obj(user)


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

/obj/docking_port/proc/pick_entity_connect_disconnect(var/mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, SPAN_WARNING("You don't have the dexterity to do this!"))
		return
	if(broke)
		to_chat(user, SPAN_WARNING("[src] is broken!"))
		return
	if(req_access.len)
		if(!check_access(user, req_access))
			to_chat(user, SPAN_WARNING("Access Denied"))
			return
	if(locked)
		to_chat(user, SPAN_WARNING("[src]'s lockdown protoctol disallows any docking procedures. Turn off the protocol firstly."))
		return
	if(docking_cooldown + TDP_DOCKING_DELAY > world.time)
		to_chat(user, SPAN_WARNING("[src] systems are recallibrating since last docking procedure. Please, wait."))
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

/obj/docking_port/proc/dock_break(var/break_type = TDP_BREAK_TYPE_MOVEMENT)
	if(initial(broke) == TDP_UNBREAKABLE)
		current_connected.visual_dock_change(1)
		current_connected.current_connected = null
		visual_dock_change(1)
		current_connected = null
		return
	broke = TRUE
	icon_state = "dock_broken"
	if(break_type)
		visible_message(SPAN_WARNING("[src] collapses from explosion wave!"))
	else
		visible_message(SPAN_WARNING("[src] flexes and strains from movement!"))
	visible_message(SPAN_DANGER("-SNAP-"))
	if(current_connected?.current_connected)
		current_connected.current_connected = null
	current_connected = null
	set_extension(src, /datum/extension/scent/burned_wiring)

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

//connect/disconnect

/obj/docking_port/proc/disconnect(var/mob/user)
	var/confirm = alert(user, "Are you sure you want to disconnect from [current_connected.name] on [current_connected.our_ship.name]?", , "No", "Yes")
	if(confirm != "Yes")
		return
	if(!current_connected) //Already disconncted. Stop spamming
		return
	docking_cooldown = world.time
	current_connected.movement_cooldown = world.time
	current_connected.visual_dock_change(1)
	visual_dock_change(1)
	try_to_announce("Внимание. Производится отстыковка от [current_connected].")
	current_connected.try_to_announce("Внимание. Получен запрос на отстыковку от [src]. Процедура выполняется.")
	current_connected.current_connected = null
	current_connected = null

/obj/docking_port/proc/connect(var/obj/effect/overmap/connect_to, var/mob/user, var/random_connect = 0)
	var/obj/docking_port/dock //This will be the dock we connect to.
	if(current_connected)
		to_chat(user, SPAN_NOTICE("You have to disconnect firstly."))
		return
	if(random_connect)
		dock = pick(get_all_docks(connect_to))
	else
		dock = get_player_picked_dock(connect_to, user)
		if(isnull(dock))
			to_chat(user, SPAN_NOTICE("Connection point selection cancelled."))
			return
	if(dock.broke)
		to_chat(user, SPAN_WARNING("[dock] doesn't responds to connection request. It could be damaged."))
		return
	if(dock.locked)
		to_chat(user, SPAN_WARNING("[dock]'s lockdown protocol was enabled. Connection request denied."))
		return
	if(dock)
		current_connected = dock
		visual_dock_change()
		dock.current_connected = src
		dock.visual_dock_change()
		docking_cooldown = world.time
		current_connected.movement_cooldown = world.time
		try_to_announce("Внимание. Производится соединение стыковочных портов с [current_connected].")
		current_connected.try_to_announce("Внимание. Получен запрос на стыковку от [src]. Процедура выполняется.")
	else
		visible_message(SPAN_NOTICE("[src] beeps a message: \"No valid connection points. Repositioning may reveal more connection points.\""))

//switch

/obj/docking_port/proc/announce_turn(var/mob/user)
	if(broke)
		to_chat(user, SPAN_WARNING("It's broken."))
		return
	if(req_access.len)
		if(!check_access(user, req_access))
			to_chat(user, SPAN_WARNING("Access Denied"))
			return
	if(current_connected)
		to_chat(user, SPAN_WARNING("You have to disconnect the dock before working with protocols."))
		return
	if(!issilicon(user))
		user.visible_message(SPAN_NOTICE("[user] does something with [src]\'s control panel."), "You are turning [announce ? "off" : "on"] [src]\'s announce protocol.")
		if(!do_after(user, TDP_PANEL_INTERRACT_DELAY, src))
			return
		if(!src.Adjacent(user) || !(user.loc = loc))
			return
		user.visible_message(SPAN_NOTICE("[user] turned [announce ? "off" : "on"] [src]\'s announce protocol."))
	else
		to_chat(user, SPAN_NOTICE("You turned [announce ? "off" : "on"] [src]\'s announce protocol."))
	announce = !announce

/obj/docking_port/proc/lock_dock(var/mob/user)
	if(broke)
		to_chat(user, SPAN_WARNING("It's broken."))
		return
	if(req_access.len)
		if(!check_access(user, req_access))
			to_chat(user, SPAN_WARNING("Access Denied"))
			return
	if(current_connected)
		to_chat(user, SPAN_WARNING("You have to disconnect the dock before working with protocols."))
		return
	if(!issilicon(user))
		user.visible_message(SPAN_NOTICE("[user] does something with [src]\'s control panel."), "You are turning [locked ? "off" : "on"] [src]\'s lockdown protocol.")
		if(!do_after(user, TDP_PANEL_INTERRACT_DELAY, src))
			return
		if(!src.Adjacent(user) || !(user.loc = loc))
			return
		user.visible_message(SPAN_NOTICE("[user] turned [locked ? "off" : "on"] [src]\'s lockdown protocol."))
	else
		to_chat(user, SPAN_NOTICE("You turned [locked ? "off" : "on"] [src]\'s lockdown protocol."))
	locked = !locked

//other

/obj/docking_port/proc/ship_setup()
	our_ship = map_sectors["[z]"]
	if(!isnull(our_ship))
		our_ship.connectors += src
		if(name == "telescopic docking port")
			name = "[our_ship] - [name] [our_ship.connectors.len]"

/obj/docking_port/proc/translate_obj(var/obj/to_move)
	if(!isturf(current_connected.loc))
		return
	to_move.forceMove(current_connected.loc)

/obj/docking_port/proc/try_to_announce(var/msg)
	if(announce)
		radio.autosay("[msg]", "[src]",, src.z)
