/obj/item/device/Created()
	. = ..()
	for (var/obj/item/weapon/cell/C in contents)
		for (var/a in vars)
			if (vars[a] == C)
				vars[a] = null
				qdel(C)
