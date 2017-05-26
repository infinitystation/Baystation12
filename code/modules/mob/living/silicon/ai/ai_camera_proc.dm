/mob/living/silicon/ai/proc/ai_take_image()
	aiCamera.toggle_camera_mode()
	return

/mob/living/silicon/ai/proc/ai_view_images()
	set category = "Silicon Commands"
	set name = "View"
	aiCamera.viewpictures()
	return