/mob/living/ancient_being/space_whale/Allow_Spacemove(var/check_drift = 0)
	if(can_space_walk)
		if(!check_drift)
			inertia_dir = 0
			return 1
	else
		return ..()
