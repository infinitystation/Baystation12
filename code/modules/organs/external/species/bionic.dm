/obj/item/organ/external/head/bionic
	eye_icon_location = null //species haven't eyes

/obj/item/organ/external/chest/bionic
	name = "bionic chassis"

/obj/item/organ/external/chest/bionic/robotize()
	..()
	owner.internal_organs_by_name[BP_CELL] = new /obj/item/organ/internal/cell/bionic(owner,1)
