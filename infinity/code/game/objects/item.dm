/obj/item
    var/datum/armor/armors

/obj/item/Initialize()
	. = ..()
	if (islist(armor))
		armors = getArmor(arglist(armor))
	else if (!armor)
		armors = getArmor()