/////////////VISION CONE///////////////
//Vision cone code by Matt and Honkertron. This vision cone code allows for mobs and/or items to blocked out from a players field of vision.
//This code makes use of the "cone of effect" proc created by Lummox, contributed by Jtgibson. More info on that here:
//http://www.byond.com/forum/?post=195138
///////////////////////////////////////

//"Made specially for Otuska"
// - Honker

// Optimized by Kachnov
// and quardbreak

//Defines.
#define OPPOSITE_DIR(D) turn(D, 180)

/client
	var/list/hidden_images = list()

/mob
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()

/mob/living
	var/list/in_vision_cones = list()
	var/use_vision_cone = TRUE
	var/obj/screen/vision_cone_overlay = null

/atom/proc/InCone(atom/center, dir = NORTH)
	if(!get_dist(center, src))
		return FALSE

	var/d = get_dir(center, src)
	var/dx = abs(x - center.x)
	var/dy = abs(y - center.y)

	if(!d || d == dir)
		return TRUE
	else if(dir & (dir-1))
		return (d & ~dir) ? FALSE : TRUE
	else if(!(d & dir))
		return FALSE
	else if(dx == dy)
		return TRUE
	else if(dy > dx)
		return (dir & (NORTH|SOUTH)) ? TRUE : FALSE

	return (dir & (EAST|WEST)) ? TRUE : FALSE

/mob/dead/InCone(mob/center, dir = NORTH)
	return FALSE

/mob/living/InCone(mob/center, dir = NORTH)
	. = ..()
	for(var/grab in grabbed_by)
		var/obj/item/grab/G = grab
		if (G.assailant == center)
			return FALSE
	return .

/proc/cone(atom/center, dir = NORTH, list/L, typecheck = /atom)
	. = list()
	for(var/atom in L)
		var/atom/A = atom
		if (typecheck == /atom || istype(A, typecheck))
			if(A.InCone(center, dir))
				. += A

/mob/proc/update_vision_cone()
	return FALSE

/mob/living/update_vision_cone()
	set waitfor = FALSE
	if(reset_vision_cone() && use_vision_cone)
		if(!vision_cone_overlay)
			vision_cone_overlay = new /obj/screen/vision_cone_overlay()

		client.screen |= vision_cone_overlay
		vision_cone_overlay.dir = dir
		vision_cone_overlay.screen_loc = "1:[-client.pixel_x],1:[-client.pixel_y]"

		if(vision_cone_overlay.alpha)
			var/image/I = null

			// Mobs
			for(var/living in cone(src, OPPOSITE_DIR(dir), oviewers(src), /mob/living))
				var/mob/living/L = living
				var/list/things = L.vis_contents+L
				for(var/thing in things)
					I = image("split", thing)
					I.override = TRUE
					client.images += I
					client.hidden_images += I
					hidden_atoms += thing

					if (thing == things[1])
						hidden_mobs += L

						if(pulling == L)//If we're pulling them we don't want them to be invisible, too hard to play like that.
							I.override = FALSE
						L.in_vision_cones[client] = TRUE

			/*
			for(var/item in cone(src, OPPOSITE_DIR(dir), oview(get_turf(src)), /obj/item)) // http://www.byond.com/docs/ref/info.html#/proc/view
				I = image("split", item)
				I.override = TRUE
				client.images += I
				client.hidden_images += I
				hidden_atoms += item */

			// Z-mimic overlay hack
			for(var/zmimic_overlay in cone(src, OPPOSITE_DIR(dir), oview(get_turf(src)), /atom/movable/openspace/overlay))
				var/atom/movable/openspace/overlay/ZMO = zmimic_overlay
				if(istype(ZMO.associated_atom, /mob/living))
					I = image("split", zmimic_overlay)
					I.override = TRUE
					client.images += I
					client.hidden_images += I
					hidden_atoms += zmimic_overlay

	else if(!use_vision_cone)
		if(vision_cone_overlay)
			client.screen -= vision_cone_overlay
			qdel(vision_cone_overlay)

/mob/living/proc/reset_vision_cone()
	var/delay = 10
	if(client && client.hidden_images)
		for(var/image in client.hidden_images)
			var/image/I = image
			client.images -= I
			I.override = FALSE
			delete_image(I, delay)
			delay += 10
		check_fov()
		client.hidden_images.Cut()
		hidden_atoms.Cut()
		hidden_mobs.Cut()
		return TRUE
	return FALSE

/mob/living/proc/delete_image(image, delay)
	set waitfor = FALSE
	sleep(delay)
	qdel(image)

/mob/living/proc/SetFov(n)
	return n ? show_cone() : hide_cone()

/mob/living/proc/check_fov()
	if(!client) return
	if(resting || lying || (client.eye != client.mob && client.eye != client.mob.loc))
		vision_cone_overlay?.alpha = 0
		return
	else
		use_vision_cone ? show_cone() : hide_cone()

//Making these generic procs so you can call them anywhere.
/mob/living/proc/show_cone()
	if(vision_cone_overlay)
		vision_cone_overlay.alpha = 255
		use_vision_cone = TRUE

/mob/living/proc/hide_cone()
	if(vision_cone_overlay)
		vision_cone_overlay.alpha = 0
		use_vision_cone = FALSE

//Cone overlay
/obj/screen/vision_cone_overlay
	icon = 'hide.dmi'
	icon_state = "combat"
	name = ""
	screen_loc = "SOUTH,WEST"
	mouse_opacity = FALSE
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

//Some overrides
/mob/living/set_dir()
	. = ..()
	update_vision_cone()

/mob/is_invisible_to(mob/viewer)
	return (!alpha || !mouse_opacity || viewer.see_invisible < invisibility || (viewer && (src in (viewer.hidden_mobs || viewer.hidden_atoms))))

/datum/species/handle_post_spawn(mob/living/carbon/human/H)
	. = ..()
	if(species_use_vision_cone)
		H.use_vision_cone = TRUE
		H.SetFov(1)

/mob/living/Move(a, b, flag)
	. = ..()
	for(var/mob in oviewers(src))
		var/mob/M = mob
		M.update_vision_cone()
	update_vision_cone()
