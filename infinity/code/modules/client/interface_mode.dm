#define COLOR_DARKDREAM_BACKGROUND "#202020"
#define COLOR_DARKDREAM_DARKBACKGROUND "#171717"
#define COLOR_DARKDREAM_TEXT "#a4bad6"
#define COLOR_DARKDREAM_CHAT "#ececec"

#define COLOR_LIGHTDREAM_BACKGROUND "#ffffff"
#define COLOR_LIGHTDREAM_TEXT "#000000"

/*#define COLOR_INFINITYDREAM_DARKBACK "#170033"
#define COLOR_INFINITYDREAM_BACK "#220065"
#define COLOR_INFINITYDREAM_FORE "#d6b5fd"
#define COLOR_INFINITYDREAM_CHAT "#b690ff"*/


/client/proc/change_theme(var/foreground_color, var/background_color, var/additional_background_color = background_color, var/chat_color = background_color, var/chat_fore_color = foreground_color)
	//infowindow.info
	winset(src, "infowindow.info", "text-color = [foreground_color]; background-color = [additional_background_color]")
	winset(src, "infowindow.info", "tab-text-color = [foreground_color]; tab-background-color = [background_color]")

	//rpane
	winset(src, "rpane", "background-color = [background_color]")
	winset(src, "rpane.rpanewindow", "background-color = [background_color]")
		//buttons
	winset(src, "rpane.github", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "rpane.BugReport", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "rpane.rulesb", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "rpane.changelog", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "rpane.changelog_infinity", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "rpane.forumb", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "rpane.wikib", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "rpane.textb", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "rpane.infob", "text-color = [foreground_color]; background-color = [background_color]")

	//mainwindow
	winset(src, "mainwindow", "background-color = [additional_background_color]")
	//winset(src, "mainwindow.input", "text-color = [foreground_color]; background-color = [additional_background_color]")
	winset(src, "mainwindow.saybutton", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "mainwindow.hotkey_toggle", "text-color = [foreground_color]; background-color = [background_color]")
	winset(src, "mainwindow.mainvsplit", "background-color = [background_color]")

	//outputwindow
	winset(src, "outputwindow.output", "text-color = [chat_fore_color]; background-color = [chat_color]")

/client/verb/switch_interface_theme()
	set name = "Change interface Theme"
	set category = "OOC"

	switch(alert("Choose interface theme.", "Interface of your Dream", "Light Dream", "Dark Dream"))//, "Infinity Dream"))
		if("Light Dream")
			change_theme(COLOR_LIGHTDREAM_TEXT, COLOR_LIGHTDREAM_BACKGROUND)
			to_chat(src, SPAN_NOTICE("Your dream's interface successfully switched to Light Dream theme."))
			return 1
		if("Dark Dream")
			change_theme(COLOR_DARKDREAM_TEXT, COLOR_DARKDREAM_BACKGROUND, COLOR_DARKDREAM_DARKBACKGROUND, COLOR_DARKDREAM_CHAT, COLOR_LIGHTDREAM_TEXT)
			to_chat(src, SPAN_NOTICE("Your dream's interface successfully switched to Dark Dream theme."))
			return 2
		/*if("Infinity Dream")
			change_theme(COLOR_INFINITYDREAM_FORE, COLOR_INFINITYDREAM_BACK, COLOR_INFINITYDREAM_DARKBACK, COLOR_INFINITYDREAM_CHAT, COLOR_LIGHTDREAM_TEXT)
			to_chat(src, SPAN_NOTICE("Your dream's interface successfully switched to Infinity Dream theme."))
			return 3*/
	return 0
