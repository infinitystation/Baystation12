// Radio player
/obj/item/music_player/radio
	name = "radio station"
	desc = "An old radio box. In the past people used them for listening to radio stations and communication between radio amateurs. \
	In future there's still an enthusiasts who like to repair and modify old electronics. For example this one may play music disks."
	icon_state = "radio"
	item_state = "radio"

/obj/item/music_player/radio/custom_tape
	tape = /obj/item/music_tape/custom

// Cassett player
/obj/item/music_player/csplayer
	name = "cassett player"
	desc = "An ordinary cassette player model FN-16, he looks old and worn in some places."
	icon_state = "csplayer_empty"
	item_state = "device"

	slot_flags = SLOT_BELT

/obj/item/music_player/csplayer/on_update_icon()
	if(tape && (mode == (1 || 2)))
		icon_state = "csplayer_on"
	else if(tape)
		icon_state = "csplayer_loaded"
	else
		icon_state = "csplayer_empty"

/obj/item/music_player/csplayer/custom_tape
	tape = /obj/item/music_tape/custom

// Dusty player
/obj/item/music_player/dusty
	name = "dusty cassette player"
	desc = "Old and dusty cassette player, it seems that it is broken."
	icon_state = "dustyplayer_empty"
	item_state = "device"

/obj/item/music_player/dusty/on_update_icon()
	icon_state = "dustyplayer_[tape ? "loaded" : "empty"]"

/obj/item/music_player/dusty/custom_tape
	tape = /obj/item/music_tape/custom

// Boombox
/obj/item/music_player/boombox
	name = "black boombox"
	desc = "A musical audio player station, also known as boombox or ghettobox. Very robust."
	icon_state = "boombox"
	item_state = "boombox"

	item_icons = list(
		slot_l_hand_str = 'sprites/onmob_lefthand.dmi',
		slot_r_hand_str = 'sprites/onmob_righthand.dmi',
		slot_back_str = 'sprites/onmob_back.dmi',
		)

//	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_LARGE

	throwforce = 10
	throw_speed = 2
	throw_range = 10
	force = 10

// This one for debug pruporses
// I'll yell on you if you will use it in game without good reason >:(
/obj/item/music_player/debug
	name = "typ3n4m3-cl4ss: CRUSH/ZER0"
	icon_state = "console"
	tape = /obj/item/music_tape/custom
