/obj/item/device/synthesized_instrument/guitar/multi/eguitar
	name = "electroguitar"
	desc = "This is a regular electric guitar"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "eguitar"
	icon_state = "eguitar"
	slot_flags = SLOT_BACK
	sound_player = /datum/sound_player/synthesizer
	path = /datum/instrument/guitar

	item_icons = list(
		slot_back_str   = CUSTOM_ITEM_MOB,
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)
	trade_blacklisted = TRUE
