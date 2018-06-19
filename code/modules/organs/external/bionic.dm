/obj/item/organ/external/chest/bionic
	name = "bionic chassis"

/obj/item/organ/external/chest/bionic/robotize()
	..()
	var/obj/item/organ/internal/cell/C = owner.internal_organs_by_name[BP_CELL]
	owner.internal_organs_by_name[BP_CELL] = new /obj/item/organ/internal/cell/bluespace(owner,1)
