/////////////VISION CONE///////////////
// Vision cone code by Honkertron (for Otuska) and Matt.
// This vision cone code allows for mobs and/or items to blocked out from a players field of vision.
// This code makes use of the "cone of effect" proc created by Lummox, contributed by Jtgibson.
//
// More info on that here:
// http://www.byond.com/forum/?post=195138
///////////////////////////////////////

#define OPPOSITE_DIR(D) turn(D, 180)

/proc/cone(atom/center = usr, dir = NORTH, list/list = oview(center))
	for(var/atom/O in list) if(!O.InCone(center, dir)) list -= O
	return list

/atom/proc/InCone(atom/center = usr, dir = NORTH)
	if(get_dist(center, src) == 0 || src == center) return 0
	var/d = get_dir(center, src)

	if(!d || d == dir) return 1
	if(dir & (dir-1))
		return (d & ~dir) ? 0 : 1
	if(!(d & dir)) return 0
	var/dx = abs(x - center.x)
	var/dy = abs(y - center.y)
	if(dx == dy) return 1
	if(dy > dx)
		return (dir & (NORTH|SOUTH)) ? 1 : 0
	return (dir & (EAST|WEST)) ? 1 : 0

/mob/observer/ghost/InCone(mob/center = usr, dir = NORTH)
	return

/mob/living/InCone(mob/center = usr, dir = NORTH)
	. = ..()
	for(var/obj/item/grab/G in center)//TG doesn't have the grab item. But if you're porting it and you do then uncomment this.
		if(src == G.affecting)
			return 0
		else
			return .

/mob/proc/update_vision_cone()
	return

/mob/living/update_vision_cone()
	if(!src.client)
		return

	if(!src.vision_cone_overlay)
		return

	var/image/I
	var/mob/living/M

	for(I in src.hidden_atoms)
		I.override = 0
		addtimer(CALLBACK(src, .proc/clear_vision_effect, src.client, I), 10)

	src.hidden_atoms.Cut()
	src.hidden_mobs.Cut()

	check_fov()

	if(!vision_cone || vision_cone_overlay.alpha != 255)
		return

	src.vision_cone_overlay.dir = src.dir

	for(M in cone(src, OPPOSITE_DIR(src.dir), view(world.view, src)))
		I = image("split", M)
		I.override = 1
		src.client.images += I
		src.hidden_atoms += I
		src.hidden_mobs += M
		if(src.pulling)//If we're pulling them we don't want them to be invisible, too hard to play like that.
			if(src.pulling == M)
				I.override = 0

			if(istype(src.pulling, /obj/structure/bed))
				var/obj/structure/bed/B = src.pulling
				for(M in B.buckled_mob)
					I.override = 0

		M.in_vision_cones[src] = 1

	//ToDo: Rework
	//	var/obj/item/O
	//	for(O in cone(src, OPPOSITE_DIR(src.dir), oview(src)))
	//		I = image("split", O)
	//		I.override = 1
	//		src.client.images += I
	//		src.hidden_atoms += I

/mob/living/proc/clear_vision_effect(var/client/C, var/image/I)
	if(C && I)
		C.images -= I
	qdel(I)

/mob/living/proc/SetFov(var/n)
	if(!can_have_vision_cone)
		return

	if(!n)
		hide_cone()
	else
		show_cone()

/mob/living/proc/check_fov()
	if(!can_have_vision_cone)
		if(vision_cone_overlay)
			hide_cone()
		return

	if(resting || lying || client.eye != client.mob)
		src.vision_cone_overlay.alpha = 0
		return

	else if(src.vision_cone)
		show_cone()
	else
		hide_cone()

//Making these generic procs so you can call them anywhere.
/mob/living/proc/show_cone()
	if(!can_have_vision_cone)
		return

	if(src.vision_cone_overlay)
		src.vision_cone_overlay.alpha = 255
		src.vision_cone = 1

/mob/living/proc/hide_cone()
	if(src.vision_cone_overlay)
		src.vision_cone_overlay.alpha = 0
		src.vision_cone = 0

/mob/living/Initialize()
	. = ..()
	if(can_have_vision_cone)
		vision_cone = 1
		GLOB.dir_set_event.register(src, src, /mob/proc/update_vision_cone)
		GLOB.moved_event.register(src, src, /mob/proc/update_vision_cone)

/mob/living/Destroy()
	if(vision_cone)
		GLOB.dir_set_event.unregister(src, src, /mob/proc/update_vision_cone)
		GLOB.moved_event.unregister(src, src, /mob/proc/update_vision_cone)
	. = ..()

/mob/living/Move(NewLoc, direct)
	for(var/mob/living/L in in_vision_cones)
		if(src in L.hidden_mobs)
			var/image/noise = image(icon = 'icons/effects/noise.dmi', icon_state = "noise", loc = get_turf(src), layer = 18)
			noise.alpha = 200
			show_image(L, noise)
			addtimer(CALLBACK(src, .proc/clear_vision_effect, L.client, noise), 6)
		else
			in_vision_cones.Remove(L)
	. = ..()

/mob/living/is_invisible_to(var/mob/viewer)
	return (!alpha || !mouse_opacity || viewer.see_invisible < invisibility || src in (viewer.hidden_mobs || viewer.hidden_atoms))
