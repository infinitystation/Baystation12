/obj/machinery/door/unpowered/simple/resin/New(var/newloc,var/material_name,var/complexity)
	..(newloc, MATERIAL_RESIN, complexity)

/obj/machinery/door/unpowered/simple/resin/attack_hand(mob/user)
	if(isxenomorph(user))
		if(src.density)
			open()
		else
			close()
		return
	else
		to_chat(user, "You can't manage to open [src] as it struggles against you!")

/obj/machinery/door/unpowered/attack_hand(mob/user)
	if(isxenomorph(user))
		if(src.density)
			open()
		else
			close()
		return
	. = ..()

/obj/machinery/door/unpowered/attackby(obj/item/C, mob/user)
	if(isxenomorph(user))
		if(src.density)
			open()
		else
			close()
		return
	. = ..()

/obj/machinery/door/unpowered/simple/resin/Bumped(mob/user)
	if(isxenomorph(user))
		if(src.density)
			open()
		return
	else
		to_chat(user, "You can't manage to open [src] as it struggles against you!")
