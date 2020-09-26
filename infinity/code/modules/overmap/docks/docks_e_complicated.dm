/obj/docking_port/enterence/proc/cross_dock(var/mob/target)
	if(!check_for_integrity(usr)) return
	if(!current_connected)
		to_chat(usr, SPAN_WARNING("[src] is not connected to anything."))
		return
	if(!isturf(loc))
		return
	if(!isturf(current_connected.loc))
		return
	if(target.anchored)
		to_chat(usr, SPAN_WARNING("[target] is anchored."))
		return
	if(istype(target, /mob/living/exosuit))
		to_chat(usr, SPAN_WARNING("You can't transfer exosuits through such small dock."))
		return
	if(!Adjacent(usr) || !usr.Adjacent(target))
		return
	if(busy_to_cross)
		to_chat(usr, SPAN_WARNING("Someone is already moving though."))
		return
//check for movement cooldown
	if(movement_cooldown + 10 SECONDS > world.time)
		to_chat(usr, SPAN_WARNING("The dock's bridge didn't restored its form since last cross. Wait a bit."))
		return
//check for atmosphere
	if(target == usr)
		var/radlevel = SSradiation.get_rads_at_turf(current_connected.loc)
		var/airstatus = IsTurfAtmosUnsafe(current_connected.loc)
		if(airstatus || radlevel > 0)
			var/reply = alert(usr, "Warning. Dangerouse environmental conditions. Are you sure you want to cross the dock? \
			DETAILS: Atmosphere: [airstatus] Radiation: [radlevel] Roentgen.", "Dangerouse area", "No", "Cross")
			if(reply == "No")
				return FALSE
//cross time!
	busy_to_cross = TRUE
	target.loc = src.loc
	if(target == usr)
		target.visible_message(SPAN_NOTICE("[usr] starts climbing through [src]\'s airlock..."))
		if(!do_after(target, TDP_CROSS_DELAY, src))
			busy_to_cross = FALSE
			return
	else
		usr.visible_message(SPAN_NOTICE("[usr] starts pushing [target] through [src]\'s airlock."))
		if(!do_after(usr, TDP_CROSS_DELAY, src))
			busy_to_cross = FALSE
			return
	if(!Adjacent(usr) || !usr.Adjacent(target))
		busy_to_cross = FALSE
		return
	if(movement_cooldown + 10 SECONDS > world.time) //when two players are trying to cross from both sides
		to_chat(usr, SPAN_WARNING("The dock's bridge didn't restored its form since last cross. Wait a bit."))
		busy_to_cross = FALSE
		return
	busy_to_cross = FALSE
//succeseful (from this side) cross
	movement_cooldown = world.time
	current_connected.movement_cooldown = world.time
	if(target == usr)
		target.visible_message(SPAN_NOTICE("[target] climbs through [src]\'s airlock."))
	else
		usr.visible_message(SPAN_NOTICE("[usr] pushes [target] through [src]\'s airlock."))
	translate_obj(target)

/obj/docking_port/enterence/proc/check_dir_compatible(var/obj/docking_port/enterence/dock)
	if(isnull(side) || isnull(dock.side)) //Null value means either we or they don't care about sides.
		return TRUE
	if((side == NORTH && dock.side == SOUTH) || (side == SOUTH && dock.side == NORTH))
		return TRUE
	if((side == EAST && dock.side == WEST) || (side == WEST && dock.side == EAST)) //Splitting these up for the sake of readability.
		return TRUE
	return

/obj/docking_port/enterence/proc/get_all_docks(var/obj/effect/overmap/visitable/connect_to)
	var/list/valid_docks = list()
	for(var/obj/docking_port/enterence/other_dock in connect_to.connectors)
		if(isnull(other_dock.current_connected) && (!other_dock.broken) && check_dir_compatible(other_dock))
			valid_docks += other_dock
	return valid_docks

/obj/docking_port/enterence/proc/get_player_picked_dock(var/obj/effect/overmap/visitable/connect_to, var/mob/user)
	var/list/dock_name_assoc = list()
	for(var/obj/dock in get_all_docks(connect_to))
		dock_name_assoc += "[dock.name]"
		dock_name_assoc["[dock.name]"] = dock
	var/dock_name_picked = input(user, "Attachment point selection.", "Select an attachment point", "Cancel") in dock_name_assoc + list("Cancel")
	if(dock_name_picked == "Cancel")
		return null
	return dock_name_assoc[dock_name_picked]

/obj/docking_port/enterence/proc/pick_entity_connect_disconnect(var/mob/user)
	if(locked)
		to_chat(user, SPAN_WARNING("[src]'s lockdown protoctol disallows any docking procedures. Turn off the protocol firstly."))
		return
	if(busy_bridge)
		to_chat(user, SPAN_NOTICE("The docking bridge's extending in progress. Please, wait."))
		return
	if(!check_for_docking_cooldown(user)) return

	if(current_connected)
		disconnect(user)
	else
		var/obj/effect/overmap/visitable/entity_connect = get_player_connect_to_choice(user)
		if(!entity_connect)
			return
		connect(entity_connect, user)

/obj/docking_port/enterence/proc/get_player_connect_to_choice(var/mob/user)
	var/list/overmap_name_assoc = list()
	var/list/objs_in_view = view(1, our_ship) - our_ship
	if(!objs_in_view || !objs_in_view.len)
		to_chat(user, SPAN_WARNING("No entities in view."))
		return
	for(var/obj/effect/overmap/visitable/obj in objs_in_view) //We should probably remove our ship from this selection.
		overmap_name_assoc += "[obj.name]"
		overmap_name_assoc["[obj.name]"] = obj
	var/overmap_name_picked = input(user, "Entity connection selection.", "Select an entity to connect to.", "Cancel") in overmap_name_assoc + list("Cancel")
	if(overmap_name_picked == "Cancel")
		to_chat(user, SPAN_NOTICE("Cancelled."))
		return
	return overmap_name_assoc[overmap_name_picked]

/obj/docking_port/enterence/proc/dock_break(var/break_type = TDP_BREAK_TYPE_MOVEMENT)
	if(initial(broken) == -1)
		current_connected.current_connected = null
		current_connected = null
		return
	broken = TRUE
	remove_bridge()
//	icon_state = "enter_b" no icon
	if(break_type)
		visible_message(SPAN_WARNING("[src] collapses from explosion wave!"))
	else
		visible_message(SPAN_WARNING("[src] flexes and strains from movement!"))
	try_to_announce("Тревога. Повреждение телескопического моста.")
	if(current_connected?.current_connected)
		current_connected.current_connected = null
	current_connected = null
	set_extension(src, /datum/extension/scent/burned_wiring)

//connect/disconnect

/obj/docking_port/enterence/proc/disconnect(var/mob/user)
	var/confirm = alert(user, "Are you sure you want to disconnect from [current_connected.name]?", , "No", "Yes")
	if(confirm != "Yes")
		return

	if(!current_connected) return //Already disconnected. Stop spamming
	if(!check_for_docking_cooldown(user)) return //I SAID STOP
	if(!Adjacent(user) && !issilicon(user))
		to_chat(user, SPAN_WARNING("You have to stay close to the dock while working with with panel."))
		return

	docking_cooldown = world.time
	current_connected.movement_cooldown = world.time
	remove_bridge()
	current_connected.remove_bridge()
	try_to_announce("Внимание. Производится отстыковка от [current_connected.our_ship].")
	current_connected.try_to_announce("Внимание. Получен запрос на отстыковку от [our_ship]. Процедура выполняется.")
	if(control_panel)
		control_panel.update_icon()
	if(current_connected.control_panel)
		current_connected.control_panel.update_icon()
	current_connected.current_connected = null
	current_connected = null

/obj/docking_port/enterence/proc/connect(var/obj/effect/overmap/visitable/connect_to, var/mob/user, var/random_connect = 0)
	var/obj/docking_port/enterence/dock //This will be the dock we connect to.
	if(!check_for_connection(user)) return
	if(random_connect)
		dock = pick(get_all_docks(connect_to))
	else
		dock = get_player_picked_dock(connect_to, user)
		if(isnull(dock))
			to_chat(user, SPAN_NOTICE("Connection point selection cancelled."))
			return

	if(!Adjacent(user) && !issilicon(user))
		to_chat(user, SPAN_WARNING("You have to stay close to the dock while working with with panel."))
		return
	if(dock.broken)
		to_chat(user, SPAN_WARNING("[dock] doesn't respond to connection request. It could be damaged."))
		return
	if(dock.locked)
		to_chat(user, SPAN_WARNING("[dock]'s lockdown protocol is activated. Connection request denied."))
		return
	if(busy_bridge || dock.busy_bridge)
		to_chat(user, SPAN_WARNING("The docking bridge's extending in progress. Please, wait."))
		return
	if(!check_for_docking_cooldown(user)) return

	if(dock)
		docking_cooldown = world.time
		dock.docking_cooldown = world.time
		try_to_announce("Внимание. Производится соединение стыковочных портов с [dock.our_ship]. Подготовка стыковочного оборудования.")
		dock.try_to_announce("Внимание. Получен запрос на стыковку от [our_ship]. Подготовка стыковочного оборудования.")
		if(!build_bridge() || !dock.build_bridge())
			try_to_announce("Внимание. Стыковка прервана. На пути стыковочного моста обнаружено более [TDP_MAX_CROSSED_WALLS] стен.")
			dock.try_to_announce("Внимание. Стыковка прервана. На пути стыковочного моста обнаружено более [TDP_MAX_CROSSED_WALLS] стен.")
			if(control_panel)
				control_panel.update_icon(TRUE)
			if(current_connected.control_panel)
				current_connected.control_panel.update_icon(TRUE)
			return
		try_to_announce("Стыковка успешно завершена.")
		dock.try_to_announce("Стыковка успешно завершена.")
		current_connected = dock
		dock.current_connected = src
		if(control_panel)
			control_panel.update_icon()
		if(dock.control_panel)
			dock.control_panel.update_icon()
	else
		visible_message(SPAN_NOTICE("<b>[src]</b> объявляет: \"Не обнаружено подходящих стыковочных портов.\""))

//switch

/obj/docking_port/enterence/proc/announce_turn(var/mob/user)
	if(!issilicon(user))
		user.visible_message(SPAN_NOTICE("[user] does something with [src]\'s control panel."), "You are turning [announce ? "off" : "on"] [src]\'s announce protocol.")
		if(!do_after(user, TDP_PANEL_INTERRACT_DELAY, src))
			return
		if(!src.Adjacent(user))
			return
		if(!check_for_docking_cooldown(user)) return //tried to do in docking process, scum
		user.visible_message(SPAN_NOTICE("[user] turned [announce ? "off" : "on"] [src]\'s announce protocol."))
	else
		if(!check_for_docking_cooldown(user)) return //tried to do in docking process, scum
		to_chat(user, SPAN_NOTICE("You turned [announce ? "off" : "on"] [src]\'s announce protocol."))
	announce = !announce

/obj/docking_port/enterence/proc/lock_dock(var/mob/user)
	if(!issilicon(user))
		user.visible_message(SPAN_NOTICE("[user] does something with [src]\'s control panel."), "You are turning [locked ? "off" : "on"] [src]\'s lockdown protocol.")
		if(!do_after(user, TDP_PANEL_INTERRACT_DELAY, src))
			return
		if(!Adjacent(user))
			return
		if(!check_for_docking_cooldown(user)) return //tried to do in docking process, scum
		user.visible_message(SPAN_NOTICE("[user] turned [locked ? "off" : "on"] [src]\'s lockdown protocol."))
	else
		if(!check_for_docking_cooldown(user)) return
		to_chat(user, SPAN_NOTICE("You turned [locked ? "off" : "on"] [src]\'s lockdown protocol."))
	locked = !locked

//bridge

/obj/docking_port/enterence/proc/build_bridge()
	busy_bridge = TRUE
	if(control_panel)
		control_panel.update_icon()
	var/lenght = 0
	var/lenght_done = 0
	var/walls_crossed = 0
	switch(dir)
		if(NORTH) lenght = world.maxy - y
		if(SOUTH) lenght = y - 1
		if(EAST) lenght = world.maxx - x
		if(WEST) lenght = x - 1
	visible_message(SPAN_NOTICE("[src] hums as its bridge deploys."))
	playsound(src.loc, 'sound/effects/lift_heavy_start.ogg', 80, 1)
	while(lenght)
		var/obj/docking_port/pipe/P = new /obj/docking_port/pipe(get_step(src.loc, dir))
		switch(dir)
			if(NORTH) P.y += lenght_done
			if(SOUTH) P.y -= lenght_done
			if(EAST) P.x += lenght_done
			if(WEST) P.x -= lenght_done
		P.dir = dir
		pipes += P
		lenght--
		lenght_done++
		if(P.loc.density)
			walls_crossed++
			if(walls_crossed >= TDP_MAX_CROSSED_WALLS)
				busy_bridge = FALSE
				remove_bridge()
				return FALSE
		if(!(lenght_done > 10)) //far enough, stop wasting time you sh-
			flick("pipe_a", P)
			sleep(3.5)
	playsound(src.loc, 'sound/effects/lift_heavy_stop.ogg', 80, 1)
	busy_bridge = FALSE
	return TRUE

/obj/docking_port/enterence/proc/remove_bridge(var/forced = FALSE)
	for(var/obj/docking_port/pipe/P in pipes)
		pipes -= P
		qdel(P)
/*
		for(var/obj/docking_port/pipe/P in pipes) //don't know a way to make it count backwards
			pipes -= P
			flick("pipe_a", P)
			sleep(3.5)
			qdel(P)
*/

//other

/obj/docking_port/enterence/proc/ship_setup()
	if(our_ship)
		our_ship.connectors += src
		name = initial(name)
	our_ship = map_sectors["[z]"]
	if(!isnull(our_ship))
		our_ship.connectors += src
		if(name == "telescopic docking port")
			name = "[name] [our_ship.connectors.len] ([our_ship])"

/obj/docking_port/enterence/proc/translate_obj(var/obj/to_move)
	if(!isturf(current_connected?.loc))
		return
	to_move.forceMove(current_connected.loc)

/obj/docking_port/enterence/proc/try_to_announce(var/msg)
	if(announce)
		radio.autosay("[msg]", "[src]",, src.z)
