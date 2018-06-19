/obj/item/organ/external/chest/bionic


/obj/item/organ/external/chest/bionic/robotize()
	if(..())
		var/obj/item/organ/internal/cell/C = owner.internal_organs_by_name[BP_CELL]
		if(!istype(C))
			if(owner.species.name_plural == "Bionic")
				owner.internal_organs_by_name[BP_CELL] = new /obj/item/organ/internal/cell/bionic(owner,1)
			else
				owner.internal_organs_by_name[BP_CELL] = new /obj/item/organ/internal/cell(owner,1)