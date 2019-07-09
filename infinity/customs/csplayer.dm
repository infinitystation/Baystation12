// Cassett player
/obj/item/music_player/csplayer
	name = "cassett player"
	desc = "An ordinary cassette player model FN-16, he looks old and worn in some places."
	item_state = "csplayer_empty"
	var/icon_empty = "csplayer_empty"
	var/icon_loaded = "csplayer_loaded"
	var/icon_on = "csplayer_on"

/obj/item/music_player/csplayer/on_update_icon()
	if (mode)
		icon_state = icon_on
	else
		icon_state = icon_empty
	if (tape != null)
		icon_state = icon_loaded

/obj/item/music_player/csplayer/custom_tape
	tape = /obj/item/music_tape/custom

// Dusty player
/obj/item/music_player/dusty
	name = "dusty cassette player"
	desc = "Old and dusty cassette player, it seems that it is broken."
	item_state = "dustyplayer_loaded"
	var/icon_empty = "dustyplayer_empty"
	var/icon_loaded = "dustyplayer_loaded"

/obj/item/music_player/dusty/on_update_icon()
	if(tape)
		icon_state = icon_loaded
	else
		icon_state = icon_empty

/obj/item/music_player/dusty/custom_tape
	tape = /obj/item/music_tape/custom
