/obj/docking_port/attack_hand(var/mob/user)
	if(!our_ship)
		ship_setup()
	if(repair_step >= 1)
		repair(user)
		return
	pick_entity_connect_disconnect(user)

/obj/docking_port/attack_ai(var/mob/M)
	if(!current_connected) //AI can't see verbs from distance
		switch(alert(M, "Select a system you want to interact with.", "[src] interraction", "Cancel", "Docking", "Protocols"))
			if("Docking")
				attack_hand(M)
			if("Protocols") //Byond doesn't allow more than 6 arguments in alert
				switch(alert(M, "What protocol do you want to switch?", "[src] interraction", "Cancel", "Lockdown", "Announce"))
					if("Lockdown")
						lock_dock(M)
					if("Announce")
						announce_turn(M)
	else
		attack_hand(M)

/obj/docking_port/attack_ghost(var/mob/M)
	if(current_connected)
		translate_obj(M)

/obj/docking_port/attackby(var/obj/item/I, var/mob/user)
	if(!repair(user, I))
		return
	if(istype(I, /obj/item/grab))
		var/obj/item/grab/G = I
		cross_dock(G.affecting, user)

/obj/docking_port/MouseDrop(var/target)
	var/mob/user = usr
	if(target == user)
		cross_dock_verb(user)
		return
	if(!istype(target, /obj))
		return
	var/obj/over_object = target
	if(istype(over_object, /obj/vehicle) || istype(over_object, /mob/living/exosuit))
		return
	if(over_object.anchored)
		return
	if(!Adjacent(user) || !user.Adjacent(over_object))
		return
	user.visible_message(SPAN_NOTICE("[user] starts loading [over_object] through [src]\'s airlock."))
	if(!do_after(user, TDP_CROSS_DELAY, over_object))
		return
	user.visible_message(SPAN_NOTICE("[user] loads [over_object] into [src]."))
	translate_obj(over_object)

/obj/docking_port/MouseDrop_T(var/target)
	MouseDrop(target)