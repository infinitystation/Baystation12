/obj/item/clothing/glasses/stv
	name = "Special tactical Visor(S.T.V)"
	desc = "Pink edition"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "stv"
	item_state = "stv"
	off_state = "stv_off"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)
	hud = /obj/item/clothing/glasses/hud/security
	electric = TRUE
	var/on = TRUE
	toggleable = TRUE
	action_button_name = "Toggle Visor"

/obj/item/clothing/glasses/stv/Initialize()
	. = ..()
	hud_holder = hud

/obj/item/clothing/glasses/stv/Destroy()
	qdel(hud_holder)
	hud_holder = null
	hud = null
	. = ..()

/obj/item/clothing/glasses/stv/attack_self(mob/user)
	toggle()

/obj/item/clothing/glasses/stv/verb/toggle()
	if(toggleable && !user.incapacitated())
		on = !on
		if(on)
			src.hud = hud_holder
			sound_to(user, 'sound/items/goggles_charge.ogg')
			to_chat(usr, "You flip \the [src] down your eyes.")
		else
			src.hud = null
			sound_to(user, 'sound/effects/pop.ogg')
			to_chat(usr, "You push \the [src] up out of your face.")
		update_icon()
		user.update_inv_glasses()
		user.update_action_buttons()

/obj/item/clothing/glasses/stv/on_update_icon()
	if(on)
		icon_state = initial(icon_state)
	else
		icon_state = off_state