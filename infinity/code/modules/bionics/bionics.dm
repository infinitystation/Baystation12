/obj/item/organ/proc/canFindLace()
	if((!owner) || (!istype(owner)))
		return 0

	var/obj/item/organ/external/head/head = owner.get_organ(BP_HEAD)

	if((!head) || (!istype(head)))
		return 0

	var/obj/item/bionics/lace = locate() in head

	if((!lace) || (!istype(lace)))
		return 0

	return 1