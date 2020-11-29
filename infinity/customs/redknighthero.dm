// GRAMMY
/obj/item/music_player/radio/custom_tape/redknighthero
	icon = CUSTOM_ITEM_OBJ
	icon_state = "redknight_grammy"

/obj/item/music_player/radio/custom_tape/redknighthero/attack_self(mob/user)
	if(icon_state == "redknight_grammy")
		to_chat(user, "Тебе нужно его сначала открыть.")
	else
		. = ..()

/obj/item/music_player/radio/custom_tape/redknighthero/attackby(obj/item/I, mob/user, params)
	if(icon_state == "redknight_grammy")
		to_chat(user, "Тебе нужно его сначала открыть.")
	else
		. = ..()

/obj/item/music_player/radio/custom_tape/redknighthero/verb/open()
	set name = "Toggle Open"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated())
		return

	if(icon_state == "redknight_grammy")
		if(tape && (mode == (1 || 2)))
			icon_state = "redknight_grammy_on"
		else
			icon_state = "redknight_grammy_off"
	else
		icon_state = "redknight_grammy"

/obj/item/music_player/radio/custom_tape/redknighthero/on_update_icon()
	if(icon_state != "redknight_grammy")
		if(tape && (mode == (1 || 2)))
			icon_state = "redknight_grammy_on"
		else
			icon_state = "redknight_grammy_off"
