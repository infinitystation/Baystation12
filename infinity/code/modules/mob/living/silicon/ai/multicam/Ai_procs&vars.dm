/mob/living/silicon/ai
	var/multicam_on = FALSE
	var/obj/screen/movable/pic_in_pic/ai/master_multicam
	var/list/multicam_screens = list()
	var/list/all_eyes = list()
	var/max_multicams = 6
	var/display_icon_override

	var/list/cam_hotkeys = new/list(9)
	var/cam_prev

/mob/living/silicon/ai/proc/drop_new_multicam(silent = FALSE)
	if(!config.ai_multicam)
		if(!silent)
			to_chat(src, "<span class='warning'>This action is currently disabled. Contact an administrator to enable this feature.</span>")
		return
	if(!eyeobj)
		return
	if(multicam_screens.len >= max_multicams)
		if(!silent)
			to_chat(src, "<span class='warning'>Cannot place more than [max_multicams] multicamera windows.</span>")
		return
	var/obj/screen/movable/pic_in_pic/ai/C = new /obj/screen/movable/pic_in_pic/ai()
	C.set_view_size(3, 3, FALSE)
	C.set_view_center(get_turf(eyeobj))
	C.set_ai(src)
	if(!silent)
		to_chat(src, "<span class='notice'>Added new multicamera window.</span>")
	return C

/mob/living/silicon/ai/proc/toggle_multicam()
	if(!config.ai_multicam)
		to_chat(src, "<span class='warning'>This action is currently disabled. Contact an administrator to enable this feature.</span>")
		return
	if(multicam_on)
		end_multicam()
	else
		start_multicam()

/mob/living/silicon/ai/proc/start_multicam()
	if(multicam_on || aiRestorePowerRoutine || !isturf(loc))
		return
	if(!GLOB.ai_camera_room_landmark)
		to_chat(src, "<span class='warning'>This function is not available at this time.</span>")
		return
	multicam_on = TRUE
	refresh_multicam()
	to_chat(src, "<span class='notice'>Multiple-camera viewing mode activated.</span>")

/mob/living/silicon/ai/proc/refresh_multicam()
	reset_view(GLOB.ai_camera_room_landmark)
	if(client)
		for(var/V in multicam_screens)
			var/obj/screen/movable/pic_in_pic/P = V
			P.show_to(client)

/mob/living/silicon/ai/proc/end_multicam()
	if(!multicam_on)
		return
	multicam_on = FALSE
	select_main_multicam_window(null)
	if(client)
		for(var/V in multicam_screens)
			var/obj/screen/movable/pic_in_pic/P = V
			P.unshow_to(client)
	reset_view()
	to_chat(src, "<span class='notice'>Multiple-camera viewing mode deactivated.</span>")


/mob/living/silicon/ai/proc/select_main_multicam_window(obj/screen/movable/pic_in_pic/ai/P)
	if(master_multicam == P)
		return

	if(master_multicam)
		master_multicam.set_view_center(get_turf(eyeobj), FALSE)
		master_multicam.unhighlight()
		master_multicam = null

	if(P)
		P.highlight()
		eyeobj.setLoc(get_turf(P.center))
		P.set_view_center(eyeobj)
		master_multicam = P