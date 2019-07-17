/mob/living/carbon/human/getarmor(def_zone, type)
	var/armorval = 0
	var/total = 0

	if(def_zone)
		if(isorgan(def_zone))
			return getarmor_organ(def_zone, type)
		var/obj/item/organ/external/affecting = get_limb(def_zone)
		return getarmor_organ(affecting, type)
		//If a specific bodypart is targetted, check how that bodypart is protected and return the value.

	//If you don't specify a bodypart, it checks ALL your bodyparts for protection, and averages out the values
	else
		for(var/X in internal_organs|organs)
			var/obj/item/organ/external/E = X
			var/weight = organ_rel_size[E.name]
			armorval += getarmor_organ(E, type) * weight
			total += weight
			#ifdef DEBUG_HUMAN_EXPLOSIONS
			to_chat(src, "DEBUG getarmor: total: [total], armorval: [armorval], weight: [weight], name: [E.name]")
			#endif
	return ( round(armorval/max(total, 1)*0.01,0.01) )

//this proc returns the armour value for a particular external organ.
/mob/living/carbon/human/proc/getarmor_organ(obj/item/organ/external/def_zone, type)
	if(!type)	return 0
	var/protection = 0
	var/list/protective_gear = list(head, wear_mask, wear_suit, w_uniform, gloves, shoes)
	for(var/gear in protective_gear)
		if(gear && istype(gear ,/obj/item/clothing))
			var/obj/item/clothing/C = gear
			if(C.body_parts_covered & def_zone?.body_part)
				protection += C.armors.getRating(type)
	return protection