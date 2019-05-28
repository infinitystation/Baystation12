/obj/item/organ/external/chest/bionic
	name = "bionic chassis"

/obj/item/organ/external/chest/bionic/robotize()
	..()
	owner.internal_organs_by_name[BP_CELL] = new /obj/item/organ/internal/cell/bionic(owner,1)
