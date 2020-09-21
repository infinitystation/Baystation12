/obj/docking_port/attack_hand(var/mob/user)
	if(!our_ship)
		ship_setup()
	if(repair_step >= 1)
		repair(user)
		return
	panel_interraction(user)

/obj/docking_port/attack_ai(var/mob/M)
	panel_interraction(M)

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
	cross_dock(target)

/obj/docking_port/MouseDrop_T(var/target)
	cross_dock(target)