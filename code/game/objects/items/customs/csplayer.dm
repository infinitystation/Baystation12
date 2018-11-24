/obj/item/device/pmp/personal/csplayer
	name = "cassett player"
	desc = "An ordinary cassette player model FN-16, he looks old and worn in some places"
	item_state = "csplayer_empty"
	var/icon_empty = "csplayer_empty"
	var/icon_loaded = "csplayer_loaded"
	var/icon_on = "csplayer_on"

/obj/item/device/pmp/personal/csplayer/on_update_icon()
	if (playing)
		icon_state = icon_on
	else
		icon_state = icon_empty
	if (cassette != null)
		icon_state = icon_loaded

