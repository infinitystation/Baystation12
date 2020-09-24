/obj/docking_port/control/attack_hand(var/mob/user)
	if(!my_enterence)
		find_enterence(user)
//	if(repair_step >= 1)
//		repair(user)
//		return
	panel_interraction(user)

/obj/docking_port/control/attack_ai(var/mob/M)
	panel_interraction(M)

/obj/docking_port/control/attack_ghost(var/mob/M)
	return //back to hell
/*
/obj/docking_port/control/attackby(var/obj/item/I, var/mob/user)
	if(!repair(user, I))
		return
	. = ..()
*/
