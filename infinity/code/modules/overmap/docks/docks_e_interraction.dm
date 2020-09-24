/obj/docking_port/enterence/attack_hand(var/mob/user)
	cross_dock(user)

/obj/docking_port/enterence/attack_ghost(var/mob/M)
	if(current_connected)
		translate_obj(M)

/obj/docking_port/enterence/attackby(var/obj/item/I, var/mob/user)
	if(!repair(user, I))
		return
	if(istype(I, /obj/item/grab))
		var/obj/item/grab/G = I
		cross_dock(G.affecting, user)

/obj/docking_port/enterence/MouseDrop(var/target)
	cross_dock(target)

/obj/docking_port/enterence/MouseDrop_T(var/target)
	cross_dock(target)