/obj/item/device/pmp/personal/csplayer
	name = "cassett player"
	desc = "An ordinary cassette player model FN-16, he looks old and worn in some places."
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

/obj/item/device/pmp/personal/dusty
	name = "dusty cassette player"
	desc = "Old and dusty cassette player, it seems that it is broken."
	item_state = "dustyplayer_loaded"
	var/icon_empty = "dustyplayer_empty"
	var/icon_loaded = "dustyplayer_loaded"

/obj/item/device/pmp/personal/dusty/on_update_icon()
	if(cassette)
		icon_state = icon_loaded
	else
		icon_state = icon_empty
