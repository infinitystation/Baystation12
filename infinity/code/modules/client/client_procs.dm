/client/proc/toggle_fullscreen(new_value)
	if((new_value == GLOB.PREF_BASIC) || (new_value == GLOB.PREF_FULL))
		winset(src, "mainwindow", "is-maximized=false;can-resize=false;titlebar=false")
		if(new_value == GLOB.PREF_FULL)
			winset(src, "mainwindow", "menu=null;statusbar=false")
		winset(src, "mainwindow.mainvsplit", "pos=0x0")
	else
		winset(src, "mainwindow", "is-maximized=false;can-resize=true;titlebar=true")
		winset(src, "mainwindow", "menu=menu;statusbar=true")
		winset(src, "mainwindow.mainvsplit", "pos=3x0")
	winset(src, "mainwindow", "is-maximized=true")
//	fit_viewport()
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
//	fit_viewport()
*/
/client/verb/fit_viewport()
	set name = "Fit Viewport"
	set category = "OOC"
	set desc = "Fit the width of the map window to match the viewport"

	// Fetch aspect ratio
	var/view_size = getviewsize(view)
	var/aspect_ratio = view_size[1] / view_size[2]

	// Calculate desired pixel width using window size and aspect ratio
	var/sizes = params2list(winget(src, "mainwindow.mainvsplit;mapwindow", "size"))
	var/map_size = splittext(sizes["mapwindow.size"], "x")
	var/height = text2num(map_size[2])
	var/desired_width = round(height * aspect_ratio)
	if (text2num(map_size[1]) == desired_width)
		// Nothing to do
		return

	var/split_size = splittext(sizes["mainwindow.mainvsplit.size"], "x")
	var/split_width = text2num(split_size[1])

	// Calculate and apply a best estimate
	// +4 pixels are for the width of the splitter's handle
	var/pct = 100 * (desired_width + 4) / split_width
	winset(src, "mainwindow.mainvsplit", "splitter=[pct]")

	// Apply an ever-lowering offset until we finish or fail
	var/delta
	for(var/safety in 1 to 10)
		var/after_size = winget(src, "mapwindow", "size")
		map_size = splittext(after_size, "x")
		var/got_width = text2num(map_size[1])

		if (got_width == desired_width)
			// success
			return
		else if (isnull(delta))
			// calculate a probable delta value based on the difference
			delta = 100 * (desired_width - got_width) / split_width
		else if ((delta > 0 && got_width > desired_width) || (delta < 0 && got_width < desired_width))
			// if we overshot, halve the delta and reverse direction
			delta = -delta/2

		pct += delta
		winset(src, "mainwindow.mainvsplit", "splitter=[pct]")
