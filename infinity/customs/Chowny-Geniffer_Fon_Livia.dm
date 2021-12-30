/obj/item/gun/launcher/net/geniffer
	icon = CUSTOM_ITEM_OBJ
	icon_state = "netgun_geniffer"
	item_icons = list(
		slot_back_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB
		)
	item_state_slots = list(
		slot_back_str = "netgun_onback_geniffer",
		slot_r_hand_str = "netgun_inRighthand_geniffer",
		slot_l_hand_str = "netgun_inLefthand_geniffer"
		)
	trade_blacklisted = TRUE

/obj/item/gun/launcher/net/geniffer/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/launcher/net/geniffer/on_update_icon()
	overlays = list()
	. = ..()
	chambered ? (icon_state = "[initial(icon_state)]") : (icon_state = "[initial(icon_state)]_noammo")

/obj/item/gun/launcher/net/geniffer/finish_loading(var/obj/item/net_shell/S, var/mob/user)
	. = ..()
	update_icon()

/obj/item/gun/launcher/net/attackby(obj/item/I, mob/user)
	. = ..()
	update_icon()

/obj/item/gun/launcher/net/attack_hand(mob/user)
	. = ..()
	update_icon()
