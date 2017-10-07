/proc/make_screen_overlay(icon, icon_state, overlay_layer)
	var/image/overlay = image(icon, icon_state)
	overlay.layer = LIGHTING_LAYER + 0.1
	overlay.plane = LIGHTING_PLANE + 0.1
	/* Some unused code
	if(brightness_factor)
		overlay.color = list(
			brightness_factor, 0, 0, 0,
			0, brightness_factor, 0, 0,
			0, 0, brightness_factor, 0,
			0, 0, 0, 1
		) */
	return overlay