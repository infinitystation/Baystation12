// Radio player
/obj/item/music_player/radio
	name = "radio station"
	desc = "An old radio box. In the past people used them for listening to radio stations and communication between radio amateurs. \
	In future there's still an enthusiasts who like to repair and modify old electronics. For example this one may play music disks."
	icon_state = "radio"
	item_state = "radio"

// Cassett player
/obj/item/music_player/csplayer
	name = "cassett player"
	desc = "An ordinary cassette player model FN-16, he looks old and worn in some places."
	item_state = "csplayer_empty"

/obj/item/music_player/csplayer/on_update_icon()
	if(tape && (mode == 1))
		icon_state = "csplayer_on"
	else if(tape)
		icon_state = "csplayer_loaded"
	else
		icon_state = "csplayer_empty"

// Dusty player
/obj/item/music_player/dusty
	name = "dusty cassette player"
	desc = "Old and dusty cassette player, it seems that it is broken."
	item_state = "dustyplayer_empty"

/obj/item/music_player/dusty/on_update_icon()
	icon_state = "dustyplayer_[tape ? "loaded" : "empty"]"

// This one for debug pruporses
// I'll yell on you if you will use it in game without good reason >:(
/obj/item/music_player/debug
	tape = /obj/item/music_tape/custom
