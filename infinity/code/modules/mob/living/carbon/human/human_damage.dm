/mob/living/carbon/proc/get_limb(zone)
	return

/mob/living/carbon/human/get_limb(zone)
	zone = check_zone(zone)
	for(var/X in organs|internal_organs)
		var/obj/item/organ/external/EO = X
		if(EO.name == zone)
			return EO