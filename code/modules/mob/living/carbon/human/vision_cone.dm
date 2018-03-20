/////////////VISION CONE///////////////
//Vision cone code by Matt and Honkertron. This vision cone code allows for mobs and/or items to blocked out from a players field of vision.
//This code makes use of the "cone of effect" proc created by Lummox, contributed by Jtgibson. More info on that here:
//http://www.byond.com/forum/?post=195138
///////////////////////////////////////

//"Made specially for Otuska"
// - Honker



//Defines.
#define OPPOSITE_DIR(D) turn(D, 180)

client/
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()



atom/proc/InCone(atom/center = usr, dir = NORTH)
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

mob/dead/InCone(mob/center = usr, dir = NORTH)
	return

mob/living/InCone(mob/center = usr, dir = NORTH)
	. = ..()
	for(var/obj/item/grab/G in center)//TG doesn't have the grab item. But if you're porting it and you do then uncomment this.
		if(src == G.affecting)
			return 0
		else
			return .


proc/cone(atom/center = usr, dir = NORTH, list/list = oview(center))
	for(var/atom/O in list) if(!O.InCone(center, dir)) list -= O
	return list

mob/proc/update_vision_cone()
	return

mob/living/carbon/human/update_vision_cone()
	var/delay = 10
	if(src.client)
		var/image/I = null
		for(I in src.client.hidden_atoms)
			I.override = 0
			spawn(delay)
				qdel(I)
			delay += 10
		check_fov()
		src.client.hidden_atoms = list()
		src.client.hidden_mobs = list()
		src.fov.dir = src.dir
		if(fov.alpha != 0)
			var/mob/living/M
			for(M in cone(src, OPPOSITE_DIR(src.dir), view(10, src)))
				I = image("split", M)
				I.override = 1
				src.client.images += I
				src.client.hidden_atoms += I
				src.client.hidden_mobs += M
				if(src.pulling == M)//If we're pulling them we don't want them to be invisible, too hard to play like that.
					I.override = 0

//				else if(M.footstep >= 1)
				M.in_vision_cones[src.client] = 1

			//Optional items can be made invisible too. Uncomment this part if you wish to items to be invisible.
			//var/obj/item/O
			//for(O in cone(src, OPPOSITE_DIR(src.dir), oview(src)))
			//	I = image("split", O)
			//	I.override = 1
			//	src.client.images += I
			//	src.client.hidden_atoms += I

	else
		return

mob/living/carbon/human/proc/SetFov(var/n)
	if(!n)
		hide_cone()
	else
		show_cone()

mob/living/carbon/human/proc/check_fov()

	if(resting || lying || client.eye != client.mob)
		src.fov.alpha = 0
		return

	else if(src.usefov)
		show_cone()

	else
		hide_cone()

//Making these generic procs so you can call them anywhere.
mob/living/carbon/human/proc/show_cone()
	if(src.fov)
		src.fov.alpha = 255
		src.usefov = 1

mob/living/carbon/human/proc/hide_cone()
	if(src.fov)
		src.fov.alpha = 0
		src.usefov = 0
