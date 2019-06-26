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
#define VISCONE_DISABLED  -1
#define VISCONE_HIDE       0
#define VISCONE_SHOW       1

/mob/living/proc/clear_cone_effect(var/image/I)
	qdel(I)

/obj/screen/vis_overlay
	icon = 'infinity/icons/mob/vision_cone.dmi'
	icon_state = "combat"
	name = ""
	screen_loc = "SOUTH,WEST"
	mouse_opacity = 0
	layer = UNDER_HUD_LAYER
	plane = HUD_PLANE

/client
	var/list/hidden_atoms = list()
	var/list/hidden_mobs  = list()

/mob/living
	var/obj/screen/vis_overlay
	var/vision_restructed = VISCONE_DISABLED

	var/list/in_vision_cones = list()

/datum/species
	var/vision_restruction = TRUE

/datum/species/nabber
	vision_restruction = FALSE

/mob/living/carbon/human/New()
	if(..())
		if(species.vision_restruction)
			vision_restructed = VISCONE_SHOW

/mob/living/silicon
	vision_restructed = VISCONE_SHOW

/mob/living/silicon/ai
	vision_restructed = VISCONE_DISABLED

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

/mob/dead/InCone(mob/center = usr, dir = NORTH)
	return

/mob/living/InCone(mob/center = usr, dir = NORTH)
	. = ..()
	for(var/obj/item/grab/G in center)
		if(src == G.affecting)
			return 0
		else
			return .

//Updating fov position on screen depends from client.pixel_x/y values
/mob/proc/update_fov_position()

/mob/living/update_fov_position()
	if(!client || !vis_overlay)
		return
	vis_overlay.screen_loc = "1:[-client.pixel_x],1:[-client.pixel_y]"

/mob/proc/update_vision_cone()
	return

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

/mob/living/proc/SetFov(var/n)
	if(vision_restructed == VISCONE_DISABLED)
		return

	if(!n)
		hide_cone()
	else
		show_cone()

/mob/living/proc/check_fov()
	if(vision_restructed == VISCONE_DISABLED)
		if(vis_overlay)
			hide_cone()
		return

	// Is something goes wrong
	// For example - we don't get a overlay
	// Then we should setup it
	if(isnull(vis_overlay))
		src.vis_overlay = new /obj/screen/vis_overlay()
		src.client.screen |= src.vis_overlay

	if(resting || lying || client.eye != client.mob)
		hide_cone()
	else
		show_cone()

 //Making these generic procs so you can call them anywhere.
/mob/living/proc/show_cone()
	if(vision_restructed == VISCONE_DISABLED)
		return

	vision_restructed = VISCONE_SHOW
	if(src.vis_overlay)
		src.vis_overlay.alpha = 255

/mob/living/proc/hide_cone()
	vision_restructed = VISCONE_HIDE
	if(src.vis_overlay)
		src.vis_overlay.alpha = 0

/mob/living/Move(NewLoc, direct)
	for(var/client/C in in_vision_cones)
		if(src in C.hidden_mobs)
			var/turf/T = get_turf(src)
			var/image/I = image('infinity/icons/mob/footstepsound.dmi', loc = T, icon_state = "blip", layer = 18)
			C.images += I
			spawn(6)
				if(C)
					C.images -= I
		else
			in_vision_cones.Remove(C)
	for(var/mob/M in oview(src))
		M.update_vision_cone()
	update_vision_cone()
	. = ..()

/mob/living/set_dir()
	. = ..()
	if(.) update_vision_cone()

/mob/lviing/UpdateLyingBuckledAndVerbStatus()
	. = ..()
	if(.) update_vision_cone()
