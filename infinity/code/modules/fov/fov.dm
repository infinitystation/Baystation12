/obj/screen/fov
	icon = 'infinity/icons/effects/hide.dmi'
	icon_state = FOV270
	name = " "
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER
	screen_loc = "1,1"
	mouse_opacity = 0

/mob/UpdateLyingBuckledAndVerbStatus()
	. = ..()
	update_vision_cone()

/mob/living/set_dir(dir, var/force_pass=TRUE)
	if(src.l_turn_time >= world.time && !force_pass) return
	src.l_turn_time = world.time+src.turn_delay
	. = ..()
	update_vision_cone()

/mob/living/Move(a, b, flag)
	. = ..()
	for(var/mob/M in oviewers(src))
		M.update_vision_cone()
	update_vision_cone()

/atom/proc/InCone_raw(atom/center = usr, center_dir = NORTH, fov)
	if(!fov) return FALSE
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
	if(!isturf(src) && !isturf(src.loc)) return FALSE

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


/mob/living/proc/clear_cone_effect(var/image/I)
	if(I)
		qdel(I)

/mob/living/carbon/human/update_vision_cone()
	var/delay = 10
	if(src.client)
		var/image/I = null
		for(I in src.client.hidden_atoms)
			I.override = 0
			addtimer(CALLBACK(src, .proc/clear_cone_effect, I), delay)
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
		var/fov_new = species.standart_fov
		for(var/obj/item/clothing/C in list(glasses, wear_mask, head))
			if(C && C.change_fov)
				fov_new = C.change_fov

		src.fov.icon_state = fov_new
		src.fov.alpha = 255
		if(change_use_fov)
			usefov = 1

/mob/living/carbon/human/proc/hide_cone(var/change_use_fov = 1)
	if(src.fov)
		src.fov.alpha = 0
		if(change_use_fov)
			usefov = 0

/mob/living/proc/visualize_sound()
	var/sound_loc = src.loc
	var/list/recipients = list()
	for(var/mob/living/sup in viewers(world.view, src))
		if(sup.client && (src in sup.client.hidden_mobs))
			recipients.Add(sup.client)

	if(isturf(src.loc) && recipients)
		addtimer(CALLBACK(GLOBAL_PROC, .proc/footstep_animation, recipients, sound_loc), 1)

proc/footstep_animation(var/list/recipients, var/loc)
	var/image/I = image('infinity/icons/effects/footstep.dmi', "step")
	I.plane = HUD_PLANE
	I.layer = HUD_ABOVE_ITEM_LAYER
	I.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_APART

	for(var/client/C in recipients)
		I.loc = loc
		C.images += I

	addtimer(CALLBACK(GLOBAL_PROC, .proc/remove_images_from_clients, I, recipients), 6)
