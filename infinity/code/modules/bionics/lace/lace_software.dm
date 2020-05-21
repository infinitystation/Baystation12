/datum/lacesoft
	var/name = "Lace Software"
	var/dest = "Please, contact a dev if you see this"

	var/obj/item/bionics/lace/lace 	  //Lace where this soft is stored

	var/illegal = FALSE 			  //Defines if syndicate/emagged lace needed for this software
	var/level = 0 					  //Defines level of lace needed to install this software. 0 is homemade, 1 is loadout version, 2 is RnD and 3 is Prototype/Syndie

	var/empable = TRUE				  // If the soft can be destroyed via EMP attack
	var/active = 0

	var/expiring = FALSE			  // Trial software! Or self-deleting illegal ones!
	var/expires_at
	var/list/incompatible_with = null //A list of incompatable softwares

	var/compatability = null 		  //Needed cybernetic organ for lacesoft to work
	var/bodytag = null 				  //Where organ should be

/datum/lacesoft/proc/findcomp(var/mob/living/carbon/human/owner)
	if(!compatability)
		return 1

	 if(locate(compatability) in owner.internal_organs)
	 	return 1

	 if(bodytag && locate(compatability) in owner.get_organ(bodytag))
	 	return 1

	 return 0

/datum/lacesoft/proc/installed(var/mob/living/carbon/human/owner)
	if(!owner)
		return 0
	if(findcomp(owner))
		return 0

/datum/lacesoft/proc/activate(var/mob/living/carbon/human/owner)   //Called on activation
	if(!owner)
		return 0
	if(findcomp(owner))
		return 0

	active = 1

/datum/lacesoft/proc/deactivate(var/mob/living/carbon/human/owner) //Called on deactivation
	if(!owner)
		return 0

	active = 0

/datum/lacesoft/proc/process(var/mob/living/carbon/human/owner)	  //Called while active
	if(!owner)
		return 0

	if(findcomp(owner))
		to_chat(owner, SPAN_WARNING("[name] deactivates as it cannot find needed implant!"))
		deactivate(owner)

/datum/lacesoft/proc/process_hud(var/mob/living/carbon/human/owner)	  //Called while owner's vision is processing
	if(!owner)
		return 0

	if(findcomp(owner))
		to_chat(owner, SPAN_WARNING("[name] deactivates as it cannot find needed implant!"))
		deactivate(owner)