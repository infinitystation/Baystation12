/mob/observer/eye/cameranet/pic_in_pic
	name = "Secondary AI Eye"
	invisibility = INVISIBILITY_OBSERVER
	mouse_opacity = 1
	icon_state = "ai_pip_camera"
	var/obj/screen/movable/pic_in_pic/ai/screen
	var/list/cameras_telegraphed = list()
	var/telegraph_cameras = TRUE
	var/telegraph_range = 7

/mob/observer/eye/cameranet/pic_in_pic/GetViewerClient()
	if(screen && screen.ai)
		return screen.ai.client

/mob/observer/eye/cameranet/pic_in_pic/setLoc(turf/T)
	if (T) forceMove(T)
	else MOVE2NULLSPACE
//maybewillneed	if(screen && screen.ai) screen.ai.camera_visibility(src)
//maybewillneed	else GLOB.cameranet.visibility(src)
	update_camera_telegraphing()
//maybewillneed	update_ai_detect_hud()

/*maybewillneed
/mob/observer/eye/cameranet/pic_in_pic/get_visible_turfs()
	return screen ? screen.get_visible_turfs() : list()
*/

/mob/observer/eye/cameranet/pic_in_pic/proc/update_camera_telegraphing()
	if(!telegraph_cameras) return
	var/list/obj/machinery/camera/add = list()
	var/list/obj/machinery/camera/remove = list()
	var/list/obj/machinery/camera/visible = list()
	for (var/VV in visibleChunks)
		var/datum/chunk/CC = VV
		var/datum/visualnet/camera/VC = CC.visualnet
		if(istype(VC))
			for (var/V in VC.cameras)
				var/obj/machinery/camera/C = V
				if (!C.can_use() || (get_dist(C, src) > telegraph_range)) continue
				visible |= C

	add = visible - cameras_telegraphed
	remove = cameras_telegraphed - visible

	for (var/V in remove)
		var/obj/machinery/camera/C = V
		if(QDELETED(C))
			continue
		cameras_telegraphed -= C
//maybewillneed		C.in_use_lights--
		C.update_icon()
	for (var/V in add)
		var/obj/machinery/camera/C = V
		if(QDELETED(C))
			continue
		cameras_telegraphed |= C
//maybewillneed		C.in_use_lights++
		C.update_icon()

/mob/observer/eye/cameranet/pic_in_pic/proc/disable_camera_telegraphing()
	telegraph_cameras = FALSE
	for (var/V in cameras_telegraphed)
		var/obj/machinery/camera/C = V
		if(QDELETED(C))
			continue
//maybewillneed		C.in_use_lights--
		C.update_icon()
	cameras_telegraphed.Cut()

/mob/observer/eye/cameranet/pic_in_pic/Destroy()
	disable_camera_telegraphing()
	return ..()