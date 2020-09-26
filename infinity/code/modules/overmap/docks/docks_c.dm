/obj/docking_port/control
	name = "TDP control panel"
	desc = "A structure, also known as telescopic bridge (telebridge) with integrated life support module. Allows create \"safe\" way to other space objects with same speed. It has pretty small moving area inside, so you cannot transfer objects like exosuits through it. (ƒоступно описание на русском в кодексе)"
	icon = 'icons/obj/airlock_machines.dmi'
	icon_state = "airlock_control_off"

	layer = ABOVE_WINDOW_LAYER
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE

	var/obj/docking_port/enterence/my_enterence
	var/repair_step = 0

	var/repair_busy   = FALSE
	var/emagged       = FALSE
	var/broken        = FALSE

	req_access = list() //"ACCESS_BRIDGE" and so

/obj/docking_port/control/Initialize()
	. = ..()
	if(initial(broken) == -1)
		broken = FALSE
	START_PROCESSING(SSobj, src)

/obj/docking_port/control/LateInitialize()
	. = ..()
	if(!GLOB.using_map.use_overmap)
		return INITIALIZE_HINT_QDEL

/obj/docking_port/control/Destroy()
	. = ..()
	if(is_processing)
		STOP_PROCESSING(SSobj, src)

/obj/docking_port/control/Process()
	if(isnull(my_enterence))
		find_enterence()
		update_icon()
		STOP_PROCESSING(SSobj, src)

/obj/docking_port/control/examine(mob/user)
	. = ..()
	if(broken || my_enterence.broken)
		to_chat(user, SPAN_WARNING("The status display is blank. Repair the dock to reactivate it."))
		return
	if(issilicon(user) || Adjacent(user) || isghost(user))
		if(!my_enterence)
			to_chat(user, SPAN_NOTICE("You can see next information from the status panel:\
			<br>Lockdown Protocol: Open for new docks.\
			<br>Announce Protocol: Wanna Talk"))
			return
		to_chat(user, SPAN_NOTICE("You can see next information from the status panel:\
		<br>Lockdown Protocol: [my_enterence.locked ? "ON" : "OFF"]\
		<br>Announce Protocol: [my_enterence.announce ? "ON" : "OFF"]"))
		if(emagged)
			to_chat(user, SPAN_WARNING("Access Restriction Protocol: malfunction, electromagnetic hack detected. Please report to repair dock security."))
		else
			to_chat(user, SPAN_NOTICE("Access Restriction Protocol: [req_access.len ? "ON" : "UNSET"]"))
		if(my_enterence.current_connected)
			to_chat(user, SPAN_NOTICE("Current Connected key: [my_enterence.current_connected.name]"))
	else
		to_chat(user, SPAN_NOTICE("You need to get closer if you want to check the status panel."))
		return

/obj/docking_port/control/on_update_icon(var/after_failure = 0)
	. = ..()
	overlays.Cut()
	if(broken)
		return FALSE
	var/screen = "screen_standby"
	if(my_enterence && !after_failure)
		if(my_enterence.broken)
			screen = "screen_drain"
		else if(my_enterence.current_connected)
			screen = "screen_docked"
		else if(my_enterence.docking_cooldown + TDP_DOCKING_DELAY > world.time)
			screen = "screen_fill"
	overlays += screen
	return TRUE
/*
/obj/docking_port/control/ex_act(severity)
	if(my_enterence.current_connected)
		visible_message(SPAN_WARNING("The explosion disconnects [src]!"))
		current_connected.visual_dock_change(1)
		current_connected.current_connected = null
		visual_dock_change(1)
		current_connected = null
	if(!broken)
		switch(severity)
			if(1)
				dock_break(TDP_BREAK_TYPE_EXPLOSION)
			if(2)
				if(prob(50))
					dock_break(TDP_BREAK_TYPE_EXPLOSION)
*/

/obj/docking_port/control/emag_act(var/remaining_charges, var/mob/user)
	if(!req_access.len)
		to_chat(user, SPAN_DANGER("No access restriction. Aborted."))
		return
	if(emagged)
		to_chat(user, SPAN_DANGER("Already Hacked"))
		return
	else
		emagged = TRUE
		req_access = list()
		to_chat(user, SPAN_NOTICE("You use the cryptographic sequencer on the [src]. Access restriction was hacked. Have a nice dock."))
		return TRUE
