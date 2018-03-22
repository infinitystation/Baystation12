// Wrist computers, yay! Taked from EuropaStation
/obj/item/device/pda/wrist
	name = "\improper wrist computer"
	desc = "A portable wrist-mounted microcomputer, also known as a Personal Data Assistant."
	icon = 'icons/wristcomp/wristcomp_obj.dmi'
	item_icons = list(slot_wear_id_str = 'icons/wristcomp/wristcomp_mob.dmi')
	icon_state = "wc"
	item_state = "wc"
	item_state_slots = list(slot_wear_id_str = "wc")
	note = "Thank you for choosing the Kuiper Manufacturing Group Model III!" //Current note in the notepad function
	f_color = COLOR_GREEN

/obj/item/device/pda/wrist/attack_hand(var/mob/user)
	if(loc == user)
		if(user.incapacitated() || user.restrained())
			return
		var/mob/living/carbon/human/H = user
		if(istype(H) && src == H.wear_id)
			return attack_self(user)
	return ..()

/obj/item/device/pda/wrist/MouseDrop(var/obj/over_object)
	if(ishuman(usr))
		if(loc != usr) return
		if(usr.restrained() || usr.incapacitated()) return
		if (!usr.unEquip(src)) return
		usr.put_in_hands(src)
		src.add_fingerprint(usr)
		return
	return ..()

/obj/item/device/pda/wrist/medical
	default_cartridge = /obj/item/weapon/cartridge/medical
	icon_state = "wc-medical"
	item_state = "wc-medical"
	item_state_slots = list(slot_wear_id_str = "wc-medical")

/obj/item/device/pda/wrist/engineering
	default_cartridge = /obj/item/weapon/cartridge/engineering
	icon_state = "wc-engineering"
	item_state = "wc-engineering"
	item_state_slots = list(slot_wear_id_str = "wc-engineering")

/obj/item/device/pda/wrist/security
	default_cartridge = /obj/item/weapon/cartridge/security
	icon_state = "wc-security"
	item_state = "wc-security"
	item_state_slots = list(slot_wear_id_str = "wc-security")

/obj/item/device/pda/wrist/science
	default_cartridge = /obj/item/weapon/cartridge/signal/science
	icon_state = "wc-science"
	item_state = "wc-science"
	item_state_slots = list(slot_wear_id_str = "wc-science")

/obj/item/device/pda/wrist/heads
	default_cartridge = /obj/item/weapon/cartridge/head
	news_silent = 1
	icon_state = "wc-command"
	item_state = "wc-command"
	item_state_slots = list(slot_wear_id_str = "wc-command")
