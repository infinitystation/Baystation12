/proc/choose_light_style()
	var/path
	switch(config.lighting_style)
		if("SMOOTH")
			path = 'icons/effects/lighting_overlay.dmi'
		if("RETRO")
			path = 'infinity/icons/effects/lighting_overlay_tile.dmi'
	if(path) return path
