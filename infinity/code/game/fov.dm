/obj/screen/fov
	icon = 'infinity/icons/effects/hide.dmi'
	icon_state = "270"
	name = " "
	screen_loc = "1,1"
	mouse_opacity = 0

#define OPPOSITE_DIR(D) turn(D, 180)

/client
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()

/obj/item/clothing
	var/fovedit = FALSE

/obj/item/clothing/proc/update_user_fov(var/mob/living/M, var/unequip = FALSE)
	if(fovedit)
		M.fov.icon_state = unequip ?  "270" : "90"
		M.fov.update_icon()

/obj/item/clothing/attack_hand(mob/user)
	. = ..()
	if(.)
		update_user_fov(user, TRUE)

/obj/item/clothing/equipped(mob/user)
	. = ..()
	if(fovedit)
		update_user_fov(user)

/mob/living/face_direction()
	. = ..()
	if(fixeye)
		fixeye.icon_state = facing_dir ? "fixeye_on" : "fixeye"

/mob/living
	var/l_turn_time = 0
	var/turn_delay = 5

/mob/living/is_invisible_to(mob/living/viewer)
	return (src.InCone(viewer, viewer.dir) || ..())

/mob/UpdateLyingBuckledAndVerbStatus()
	. = ..()
	update_vision_cone()

/mob/living/set_dir(dir, var/force_pass=TRUE)
	if((src.l_turn_time+src.turn_delay) >= world.time && !force_pass) return MOVEMENT_ON_COOLDOWN
	src.l_turn_time = world.time
	. = ..()
	update_vision_cone()

/mob/living/Move(a, b, flag)
	. = ..()
	for(var/mob/M in oview(src))
		M.update_vision_cone()

	update_vision_cone()
/atom/proc/InCone_raw(atom/center = usr, center_dir = NORTH, fov)
	. = FALSE
	var/rel_x = src.x - center.x
	var/rel_y = src.y - center.y
	if(rel_x == 0 && rel_y == 0) return FALSE
	var/vector_len = sqrt(abs(rel_x) ** 2 + abs(rel_y) ** 2)
	var/dir_x
	var/dir_y
	switch(center_dir)
		if(SOUTH)
			dir_x = 0
			dir_y = -vector_len
		if(NORTH)
			dir_x = 0
			dir_y = vector_len
		if(EAST)
			dir_x = vector_len
			dir_y = 0
		if(WEST)
			dir_x = -vector_len
			dir_y = 0
	var/angle = arccos((dir_x * rel_x + dir_y * rel_y) / (sqrt(dir_x**2 + dir_y**2) * sqrt(rel_x**2 + rel_y**2)))
	if(angle < (360 - fov)/2)
		. = TRUE
	return .

/atom/proc/InCone(atom/center = usr, center_dir = NORTH)
	if(ismob(src.loc)) return FALSE

	if(isliving(center))
		var/mob/living/M = center
		if(!M.usefov) return FALSE
		return InCone_raw(center, OPPOSITE_DIR(center_dir), text2num(M.fov.icon_state))

/mob/dead/InCone(mob/center = usr, center_dir = NORTH)
	return

/mob/living/InCone_raw(mob/center = usr, center_dir = NORTH)
	. = ..()
	for(var/obj/item/grab/G in center)//TG doesn't have the grab item. But if you're porting it and you do then uncomment this.
		if(src == G.affecting)
			return 0
		else
			return .


proc/cone(atom/center = usr, center_dir = NORTH, var/list/plist = oview(center))
	var/list/nlist = plist
	for(var/atom/O in nlist)
		if(istype(O, /mob/observer) || !O.InCone(center, center_dir))
			nlist -= O
	return nlist

/mob/proc/update_vision_cone()
	return

/mob/living/carbon/human/update_vision_cone()
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
			for(var/mob/M in cone(src, src.dir, oviewers(world.view, src)))
				I = image("split", M)
				I.override = 1
				src.client.images += I
				src.client.hidden_atoms += I
				src.client.hidden_mobs += M
				if(src.pulling == M)//If we're pulling them we don't want them to be invisible, too hard to play like that.
					I.override = 0
					continue

				if(ishuman(M))
					var/mob/living/carbon/human/H = M
					src.client.images -= H.hud_list
			// //Optional items can be made invisible too. Uncomment this part if you wish to items to be invisible.
			// var/obj/item/O
			// for(O in cone(src, OPPOSITE_DIR(src.dir), oview(src)))
			// 	I = image("split", O)
			// 	I.override = 1
			// 	src.client.images += I
			// 	src.client.hidden_atoms += I

	else
		return

/mob/living/carbon/human/proc/check_fov()//For showing and hiding the cone when you rest or lie down.
	if(resting || lying || client.eye != client.mob)
		hide_cone(FALSE)
	else if(!usefov)
		hide_cone()
	else
		show_cone()

//Making these generic procs so you can call them anywhere.
/mob/living/carbon/human/proc/show_cone(var/change_use_fov = 1)
	if(src.fov)
		src.fov.alpha = 255
		if(change_use_fov)
			usefov = 1

/mob/living/carbon/human/proc/hide_cone(var/change_use_fov = 1)
	if(src.fov)
		src.fov.alpha = 0
		if(change_use_fov)
			usefov = 0
