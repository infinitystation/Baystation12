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

