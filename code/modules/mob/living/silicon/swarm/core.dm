/mob/living/silicon/core
	var/obj/item/organ/internal/swarm/core/container = null
	var/emp_damage = 0
	var/alert = 0


/mob/living/silicon/core/New()
	reagents = new/datum/reagents(1000, src)
	if(istype(loc, /obj/item/organ/internal/swarm/core))
		container = loc
	add_language("Robot Talk")
	..()

/mob/living/silicon/core/Destroy()
	if(key)				//If there is a mob connected to this thing. Have to check key twice to avoid false death reporting.
		if(stat!=DEAD)	//If not dead.
			death(1)	//Brains can die again
		ghostize()		//Ghostize checks for key so nothing else is necessary.
	return ..()