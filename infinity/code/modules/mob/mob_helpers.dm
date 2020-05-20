/proc/isxenomorph(A)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		if(locate(/obj/item/organ/internal/xeno/hivenode) in H)
			return 1
		return istype(H.species, /datum/species/xenos)
	return 0
