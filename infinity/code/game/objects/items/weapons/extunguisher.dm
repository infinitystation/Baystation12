/obj/item/extinguisher/attack(mob/user)
	if(isxenomorph(user))
		to_chat(user, SPAN_NOTICE("I don't know how to use it..."))
		return
	..()
