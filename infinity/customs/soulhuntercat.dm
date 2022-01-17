/obj/item/clothing/glasses/soulhuntercat
	name = "HoloGlasses"
	desc = "Glasses with thin frames and holographic lenses that can change color."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "soulhuntercat_hologlasses"
	item_state = "soulhuntercat_hologlasses"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)
	action_button_name = "Toggle glasses"
	body_parts_covered = EYES
	var/is_active = FALSE
	var/lenses_color = COLOR_OFF_WHITE
	var/toggle_sound = 'infinity/sound/items/multitool_pulse.ogg'

	trade_blacklisted = TRUE

/obj/item/clothing/glasses/soulhuntercat/Initialize()
	update_icon()

/obj/item/clothing/glasses/soulhuntercat/attack_self(mob/user)
	toggle(user)

/obj/item/clothing/glasses/soulhuntercat/proc/toggle(mob/user)
	is_active = !is_active
	to_chat(user, "You [is_active ? "" : "de"]activate [src].")
	playsound(user, toggle_sound, 50)

	update_icon()
	user.update_action_buttons()

/obj/item/clothing/glasses/soulhuntercat/proc/change_color()
	if(usr.incapacitated())
		return

	var/new_color = input(usr, "Pick a new color", "Lenses Color", color) as color|null
	if(!new_color || new_color == color || usr.incapacitated())
		return
	lenses_color = new_color

	update_icon()

/obj/item/clothing/glasses/soulhuntercat/CtrlClick(mob/user)
	change_color()

/obj/item/clothing/glasses/soulhuntercat/verb/change_color_action()
	set name = "Change Lenses Color"
	set category = "Object"
	set desc = "Change the color of the lenses."
	set src in usr

	change_color()

/obj/item/clothing/glasses/soulhuntercat/on_update_icon()
	if(is_active)
		icon_state = "[initial(icon_state)]"
		item_state_slots[slot_glasses_str] = "[initial(icon_state)]"
		color = lenses_color
	else
		icon_state = "[initial(icon_state)]_frame"
		item_state_slots[slot_glasses_str] = "[initial(icon_state)]_frame"
		color = COLOR_OFF_WHITE

	update_clothing_icon()
