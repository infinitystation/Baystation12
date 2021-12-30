/datum/preferences/proc/apply_post_login_preferences()
	set waitfor = 0
	if(!client)
		return
	/*
	if(client.get_preference_value(/datum/client_preference/chat_position) == GLOB.PREF_YES)
		client.update_chat_position(TRUE) */
	if(client.get_preference_value(/datum/client_preference/fullscreen_mode) == GLOB.PREF_FULL)
		client.toggle_fullscreen()

/*
/client/proc/update_chat_position(use_alternative)
	var/input_height = 0

	// Hell

	if (use_alternative == TRUE)
		input_height = winget(src, "input_alt", "size")
		input_height = text2num(splittext(input_height, "x")[2])
		winset(src, "input_alt", "is-visible=true;is-disabled=false;is-default=true")
		winset(src, "hotkey_toggle_alt", "is-visible=true;is-disabled=false;is-default=true")
		winset(src, "saybutton_alt", "is-visible=true;is-disabled=false;is-default=true")

		winset(src, "input", "is-visible=false;is-disabled=true;is-default=false")
		winset(src, "hotkey_toggle", "is-visible=false;is-disabled=true;is-default=false")
		winset(src, "saybutton", "is-visible=false;is-disabled=true;is-default=false")

		var/current_size = splittext(winget(src, "outputwindow.output", "size"), "x")
		var/new_size = "[current_size[1]]x[text2num(current_size[2]) - input_height]"
		winset(src, "outputwindow.output", "size=[new_size]")
		winset(src, "outputwindow.browseroutput", "size=[new_size]")

		current_size = splittext(winget(src, "mainwindow.mainvsplit", "size"), "x")
		new_size = "[current_size[1]]x[text2num(current_size[2]) + input_height]"
		winset(src, "mainwindow.mainvsplit", "size=[new_size]")
	else
		input_height = winget(src, "input", "size")
		input_height = text2num(splittext(input_height, "x")[2])
		winset(src, "input_alt", "is-visible=false;is-disabled=true;is-default=false")
		winset(src, "hotkey_toggle_alt", "is-visible=false;is-disabled=true;is-default=false")
		winset(src, "saybutton_alt", "is-visible=false;is-disabled=true;is-default=false")

		winset(src, "input", "is-visible=true;is-disabled=false;is-default=true")
		winset(src, "hotkey_toggle", "is-visible=true;is-disabled=false;is-default=true")
		winset(src, "saybutton", "is-visible=true;is-disabled=false;is-default=true")

		var/current_size = splittext(winget(src, "outputwindow.output", "size"), "x")
		var/new_size = "[current_size[1]]x[text2num(current_size[2]) + input_height]"
		winset(src, "outputwindow.output", "size=[new_size]")
		winset(src, "outputwindow.browseroutput", "size=[new_size]")

		current_size = splittext(winget(src, "mainwindow.mainvsplit", "size"), "x")
		new_size = "[current_size[1]]x[text2num(current_size[2]) - input_height]"
		winset(src, "mainwindow.mainvsplit", "size=[new_size]")
*/
