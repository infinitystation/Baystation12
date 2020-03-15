/mob/proc/remake_Hud()
	client.images = null				//remove the images such as AIs being unable to see runes
	client.screen = list()				//remove hud items just in case
	screens = list()				//remove hud items just in case
	InitializeHud()

	set_sight(sight|SEE_SELF)

	l_plane = new()
	l_general = new()
	client.screen += l_plane
	client.screen += l_general

	refresh_client_images()
	reload_fullscreen() // Reload any fullscreen overlays this mob has.
	update_action_buttons()

	//set macro to normal incase it was overriden (like cyborg currently does)
	winset(src, null, "mainwindow.macro=macro hotkey_toggle.is-checked=false input.focus=true input.background-color=#d3b5b5")
