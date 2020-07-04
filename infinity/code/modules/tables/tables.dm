/obj/structure/table/attack_hand(mob/user)
	if(isxenomorph(user))
		attack_generic(user, 22, pick("strikes", "tears", "rips appart"))
	..()
