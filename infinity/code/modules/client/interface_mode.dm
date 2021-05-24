#define COLOR_DARKDREAM_BACKGROUND "#202020"
#define COLOR_DARKDREAM_DARKBACKGROUND "#171717"
#define COLOR_DARKDREAM_TEXT "#a4bad6"
#define COLOR_DARKDREAM_CHAT COLOR_DARKDREAM_BACKGROUND

#define COLOR_LIGHTDREAM_BACKGROUND "#ffffff"
#define COLOR_LIGHTDREAM_TEXT "#000000"

/*
#define COLOR_INFINITYDREAM_DARKBACK "#170033"
#define COLOR_INFINITYDREAM_BACK "#220065"
#define COLOR_INFINITYDREAM_FORE "#d6b5fd"
#define COLOR_INFINITYDREAM_CHAT "#b690ff"
*/
/datum/interface_theme
	var/ForegroundColor
	var/BackgroundColor
	var/AdditionalBackgroundColor
	var/ChatColor
	var/ChatForeColor

/datum/interface_theme/New(
		foreground_color,
		background_color,
		additional_background_color = background_color,
		chat_color = background_color,
		chat_fore_color = foreground_color
	)
		ForegroundColor				=	foreground_color
		BackgroundColor				=	background_color
		AdditionalBackgroundColor	=	additional_background_color
		ChatColor					=	chat_color
		ChatForeColor				=	chat_fore_color

GLOBAL_LIST_INIT(InterfaceThemes, list(\
	"Light Dream" = new/datum/interface_theme(COLOR_LIGHTDREAM_TEXT, COLOR_LIGHTDREAM_BACKGROUND),\
	"Dark Dream" = new/datum/interface_theme(COLOR_DARKDREAM_TEXT, COLOR_DARKDREAM_BACKGROUND, COLOR_DARKDREAM_DARKBACKGROUND)\
	)\
)

/client/proc/change_theme(datum/interface_theme/theme)
	//infowindow.info
	winset(src, "infowindow.info", "text-color = [theme.ForegroundColor]; background-color = [theme.AdditionalBackgroundColor]")
	winset(src, "infowindow.info", "tab-text-color = [theme.ForegroundColor]; tab-background-color = [theme.BackgroundColor]")

	//rpane
	winset(src, "rpane", "background-color = [theme.BackgroundColor]")
	winset(src, "rpane.rpanewindow", "background-color = [theme.BackgroundColor]")
		//buttons
	winset(src, "rpane.github", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "rpane.BugReport", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "rpane.rulesb", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "rpane.changelog", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "rpane.changelog_infinity", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "rpane.forumb", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "rpane.wikib", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "rpane.textb", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "rpane.infob", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")

	//mainwindow
	winset(src, "mainwindow", "background-color = [theme.AdditionalBackgroundColor]")
	//winset(src, "mainwindow.input", "text-color = [theme.ForegroundColor]; background-color = [theme.AdditionalBackgroundColor]")
	winset(src, "mainwindow.saybutton", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "mainwindow.hotkey_toggle", "text-color = [theme.ForegroundColor]; background-color = [theme.BackgroundColor]")
	winset(src, "mainwindow.mainvsplit", "background-color = [theme.BackgroundColor]")

	//outputwindow
	winset(src, "outputwindow.output", "text-color = [theme.ChatForeColor]; background-color = [theme.ChatColor]")

/client/verb/switch_interface_theme()
	set name = "Change interface Theme"
	set category = "OOC"

	var/input_theme = input(usr, "Choose Dream's theme", "Style of your Dream") in GLOB.InterfaceThemes
	var/datum/interface_theme/_theme = GLOB.InterfaceThemes[input_theme]
	if(istype(_theme))
		change_theme(_theme)
		return _theme
