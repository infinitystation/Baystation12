/mob/living/is_muzzled()
	if(silent)
		return 1
	if(istype(wear_mask, /obj/item/clothing/mask/muzzle))
		return 1
//	if(ishuman(src)) //changelings, stop screaming
//		var/mob/living/carbon/human/H = src
//		var/obj/item/organ/external/head/head = H.internal_organs_by_name[BP_HEAD]
//		if(!head) return 1
