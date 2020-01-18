/////////////VISION CONE///////////////
// Vision cone code by Honkertron (for Otuska) and Matt.
// This vision cone code allows for mobs and/or items to blocked out from a players field of vision.
// This code makes use of the "cone of effect" proc created by Lummox, contributed by Jtgibson.
//
// More info on that here:
// http://www.byond.com/forum/?post=195138
///////////////////////////////////////

 //Defines.
#define OPPOSITE_DIR(D) turn(D, 180)

#define FOV_DISABLED -1
#define FOV_HIDED     0
#define FOV_ACTIVE    1

/client
	var/list/hidden_atoms = list()
	var/list/hidden_mobs  = list()

/mob/living
	var/obj/screen/fov
	var/list/in_fov = list()

/proc/cone(atom/center = usr, dir = NORTH, list/list = oview(center))
	for(var/atom/O in list) if(!O.InCone(center, dir)) list -= O
	return list

/atom/proc/InCone(atom/center = usr, dir = NORTH)
	if(get_dist(center, src) == 0 || src == center)
		return FALSE

	var/d = get_dir(center, src)

	if(!d || d == dir)
		return TRUE

	if(dir & (dir - 1))
		return (d & ~dir) ? FALSE : TRUE

	if(!(d & dir))
		return FALSE

	var/dx = abs(x - center.x)
	var/dy = abs(y - center.y)

	if(dx == dy)
		return TRUE

	if(dy > dx)
		return (dir & (NORTH|SOUTH)) ? TRUE : FALSE

	return (dir & (EAST|WEST)) ? TRUE : FALSE

/mob/dead/InCone(mob/center = usr, dir = NORTH)
	return

/mob/living/InCone(mob/center = usr, dir = NORTH)
	. = ..()
	for(var/obj/item/grab/G in center)
		if(src == G.affecting)
			return FALSE
		else
			return .


// WARNING: This is fucking peace of trash should be rewrited.
// I have no idea how this must look and work with bay code standart but MUST be better than this spaghetti.
// My recomendation - break this proc to two and make every update check if someone in our radius.
// If this person not in cone but hided - remove it; If this person already covered - ignore him.
// If this person not hided but in cone - add it.
// Also if person's cone is temporary or forever off (in example, GAS and chickens don't must have it), we should reduce calls and optimize for next fov turn on

// Currently this shit is broke ahhh....

/mob/living/update_vision_cone()
	if(src.client)
		src.client.hidden_atoms.Cut()
		src.client.hidden_mobs.Cut()
		var/image/I = null
		/*
		var/delay = 10
		for(I in src.client.hidden_atoms)
			I.override = 0
			addtimer(CALLBACK(src, .proc/clear_cone_effect, I), delay)
			delay += 10
		*/
		if(check_fov())
			src.client.hidden_atoms = list()
			src.client.hidden_mobs = list()
			src.vis_overlay.dir = src.dir
			if(vision_restructed == VISCONE_SHOW)
				var/mob/living/M
				for(M in cone(src, OPPOSITE_DIR(src.dir), view(10, src)))
					I = image("split", M)
					I.override = 1
					src.client.images += I
					src.client.hidden_atoms += I
					src.client.hidden_mobs += M
					// If we're pulling them we don't want them to be invisible, too hard to play like that.
					if(src.pulling == M)
						I.override = 0

					M.in_vision_cones[src.client] = 1

				update_fov_position()

/mob/living/proc/CheckFov()
	if(vision_restructed == VISCONE_DISABLED)
		if(vis_overlay)
			hide_cone()
		return

	if(resting || lying || client.eye != client.mob)
		hide_cone()
	else
		show_cone()

/mob/living/proc/SetFov(var/n)
	if(vision_restructed == FOV_DISABLED)
		return

	if(!n)
		HideFov()
	else
		ShowFov()

 //Making these generic procs so you can call them anywhere.
/mob/living/proc/ShowCone()
	if(vision_restructed == FOV_DISABLED)
		return

	vision_restructed = FOV_ACTIVE
	if(src.vis_overlay)
		src.vis_overlay.alpha = 255

/mob/living/proc/hide_cone()
	vision_restructed = FOV_HIDE
	if(src.vis_overlay)
		src.vis_overlay.alpha = 0

/mob/living/Move(NewLoc, direct)
	for(var/client/C in in_vision_cones)
		if(src in C.hidden_mobs)
			var/image/noise = image(icon = 'icons/effects/noise.dmi', icon_state = "noise", loc = src, layer = 18)
			noise.alpha = 200
			show_image(C, noise)
			addtimer(CALLBACK(src, .proc/clear_noise_effect, C, noise), 7)
		else
			in_vision_cones.Remove(C)
	. = ..()

/mob/living/proc/clear_noise_effect(var/client/C, var/image/I)
	if(C && I) C.images -= I


/mob/living/Initialize()
	. = ..()
	if(fov)
		GLOB.dir_set_event.register(src, src, /mob/proc/update_vision_cone)
		GLOB.moved_event.register(src, src, /mob/proc/update_vision_cone)

/mob/living/Destroy()
	GLOB.dir_set_event.unregister(src, src, /mob/proc/update_vision_cone)
	GLOB.moved_event.unregister(src, src, /mob/proc/update_vision_cone)
	. = ..()

/mob/living/set_dir()
	..()
	update_vision_cone()

/mob/lviing/UpdateLyingBuckledAndVerbStatus()
	..()
	update_vision_cone()
