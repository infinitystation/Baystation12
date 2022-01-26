/proc/get_footstep(var/footstep_type, var/mob/caller)
	. = caller && caller.get_footstep(footstep_type)
	if(!.)
		var/decl/footsteps/FS = decls_repository.get_decl(footstep_type)
		. = pick(FS.footstep_sounds)

/turf/simulated/proc/get_footstep_sound(var/mob/caller)
	for(var/obj/structure/S in contents)
		if(S.footstep_type)
			return get_footstep(S.footstep_type, caller)

	if(check_fluid_depth(10) && !is_flooded(TRUE))
		return get_footstep(/decl/footsteps/water, caller)

	if(footstep_type)
		return get_footstep(footstep_type, caller)

	if(is_plating())
		return get_footstep(/decl/footsteps/plating, caller)

/turf/simulated/floor/get_footstep_sound(var/mob/caller)
	. = ..()
	if(!.)
		if(!flooring || !flooring.footstep_type)
			return get_footstep(/decl/footsteps/blank, caller)
		else
			return get_footstep(flooring.footstep_type, caller)

/turf/simulated/Entered(var/mob/living/carbon/human/H)
	..()
	if(istype(H))
		H.handle_footsteps(H)
		H.step_count++

/mob/living/carbon/human/proc/has_footsteps()
	if(species.silent_steps || buckled || lying || throwing)
		return //people flying, lying down or sitting do not step

	if(shoes && (shoes.item_flags & ITEM_FLAG_SILENT))
		return // quiet shoes

	if(!has_organ(BP_L_FOOT) && !has_organ(BP_R_FOOT))
		return //no feet no footsteps

	return TRUE

/mob/living/carbon/human/proc/handle_footsteps(var/mob/living/H)
	if(!has_footsteps())
		return

	 //every other turf makes a sound
	if((step_count % 2) && MOVING_QUICKLY(src))
		return

	// don't need to step as often when you hop around
	if((step_count % 3) && !has_gravity(src))
		return

	if(istype(move_intent, /decl/move_intent/creep)) //We don't make sounds if we're tiptoeing
		return

	var/turf/simulated/T = get_turf(src)
	var/list/recipients = list()
	if(istype(T))
		var/footsound = T.get_footstep_sound(src)
		if(footsound)
			var/range = -(world.view - 2)
			var/volume = 70
			if(MOVING_DELIBERATELY(src))
				volume -= 45
				range -= 0.333
			if(!shoes)
				volume -= 60
				range -= 0.333
			playsound(T, footsound, volume, 1, range)

		for(var/mob/living/sup in viewers(world.view, src))
			if(sup.client && (H in sup.client.hidden_mobs))
				recipients.Add(sup.client)

	if(!step_count%3 && isturf(H.loc) && recipients)
		addtimer(CALLBACK(GLOBAL_PROC, .proc/footstep_animation, recipients, H.loc))

	step_count = round(step_count/3)*2


proc/footstep_animation(var/list/recipients, var/loc)
	var/image/I = image('infinity/icons/effects/footstep.dmi', "step")
	I.plane = HUD_PLANE
	I.layer = HUD_ABOVE_ITEM_LAYER
	I.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_APART

	for(var/client/C in recipients)
		I.loc = loc
		C.images += I

	addtimer(CALLBACK(GLOBAL_PROC, .proc/remove_images_from_clients, I, recipients), 6)
