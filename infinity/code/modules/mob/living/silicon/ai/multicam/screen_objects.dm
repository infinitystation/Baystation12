/obj/screen/movable/pic_in_pic/ai
	var/mob/living/silicon/ai/ai
	var/mutable_appearance/highlighted_background
	var/highlighted = FALSE
	var/mob/observer/eye/cameranet/pic_in_pic/aiEye

/obj/screen/movable/pic_in_pic/ai/Initialize()
	. = ..()
	aiEye = new /mob/observer/eye/cameranet/pic_in_pic()
	aiEye.screen = src

/obj/screen/movable/pic_in_pic/ai/Destroy()
	set_ai(null)
	QDEL_NULL(aiEye)
	return ..()

/obj/screen/movable/pic_in_pic/ai/Click()
	..()
	if(ai)
		ai.select_main_multicam_window(src)

/obj/screen/movable/pic_in_pic/ai/make_backgrounds()
	..()
	highlighted_background = new /mutable_appearance()
	highlighted_background.icon = PIC_IN_PIC_STANDART_ICON
	highlighted_background.icon_state = "background_highlight"
	highlighted_background.layer = SPACE_LAYER

/obj/screen/movable/pic_in_pic/ai/add_background()
	if((width > 0) && (height > 0))
		var/matrix/M = matrix()
		M.Scale(width + 0.5, height + 0.5)
		M.Translate((width-1)/2 * world.icon_size, (height-1)/2 * world.icon_size)
		highlighted_background.transform = M
		standard_background.transform = M
		add_overlay(highlighted ? highlighted_background : standard_background)

/*maybewillneed
/obj/screen/movable/pic_in_pic/ai/set_view_size(width, height, do_refresh = TRUE)
	aiEye.static_visibility_range =	(round(max(width, height) / 2) + 1)
	if(ai)
		ai.camera_visibility(aiEye)
	..()
*/

/obj/screen/movable/pic_in_pic/ai/set_view_center(atom/target, do_refresh = TRUE)
	..()
	aiEye.setLoc(get_turf(target))

/obj/screen/movable/pic_in_pic/ai/refresh_view()
	..()
	aiEye.setLoc(get_turf(center))

/obj/screen/movable/pic_in_pic/ai/proc/highlight()
	if(highlighted)
		return
	highlighted = TRUE
	overlays -= standard_background//cut_overlay(standard_background)
	add_overlay(highlighted_background)

/obj/screen/movable/pic_in_pic/ai/proc/unhighlight()
	if(!highlighted)
		return
	highlighted = FALSE
	overlays -= highlighted_background//cut_overlay(highlighted_background)
	add_overlay(standard_background)

/obj/screen/movable/pic_in_pic/ai/proc/set_ai(mob/living/silicon/ai/new_ai)
	if(ai)
		ai.multicam_screens -= src
		ai.all_eyes -= aiEye
		if(ai.master_multicam == src)
			ai.master_multicam = null
		if(ai.multicam_on)
			unshow_to(ai.client)
	ai = new_ai
	if(new_ai)
		new_ai.multicam_screens += src
		ai.all_eyes += aiEye
		if(new_ai.multicam_on)
			show_to(new_ai.client)
