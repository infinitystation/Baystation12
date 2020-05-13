/mob/living/carbon/proc/has_fake_brain()
	var/obj/item/organ/internal/brain/brain = internal_organs_by_name[BP_BRAIN]
	if(istype(brain) && brain.fake_brain)
		return 1
	return 0
