/proc/isxenomorph(A)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		return istype(H.species, /datum/species/xenos)
	return 0
