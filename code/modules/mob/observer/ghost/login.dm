/mob/observer/ghost/Login()
	..()

	if(client && client.banprisoned)
		ckey = null
		qdel(src)
	if (ghost_image)
		ghost_image.appearance = src
		ghost_image.appearance_flags = RESET_ALPHA
	updateghostimages()
	change_light_colour(DARKTINT_GOOD)
