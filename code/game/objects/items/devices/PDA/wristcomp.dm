// Wrist computers, yay! Taked from EuropaStation
/obj/item/modular_computer/pda/wrist
	name = "\improper wrist computer"
	desc = "A portable wrist-mounted microcomputer, also known as a Personal Data Assistant."
	icon = 'icons/wristcomp/wristcomp_obj.dmi'
	item_icons = list(slot_wear_id_str = 'icons/wristcomp/wristcomp_mob.dmi')
	icon_state = "wc"
	item_state = "wc"
	item_state_slots = list(slot_wear_id_str = "wc")

/obj/item/modular_computer/pda/wrist/attack_hand(var/mob/user)
	if(loc == user)
		if(user.incapacitated() || user.restrained())
			return
		var/mob/living/carbon/human/H = user
		if(istype(H) && src == H.wear_id)
			return attack_self(user)
	return ..()

/obj/item/modular_computer/pda/wrist/MouseDrop(var/obj/over_object)
	if(ishuman(usr))
		if(loc != usr) return
		if(usr.restrained() || usr.incapacitated()) return
		if (!usr.unEquip(src)) return
		usr.put_in_hands(src)
		src.add_fingerprint(usr)
	return

/obj/item/modular_computer/pda/wrist/medical
	icon_state = "wc-medical"
	item_state = "wc-medical"
	item_state_slots = list(slot_wear_id_str = "wc-medical")

/obj/item/modular_computer/pda/wrist/medical/install_default_hardware()
	..()
	scanner = new /obj/item/weapon/computer_hardware/scanner/medical(src)

/obj/item/modular_computer/pda/wrist/engineering
	icon_state = "wc-engineering"
	item_state = "wc-engineering"
	item_state_slots = list(slot_wear_id_str = "wc-engineering")

/obj/item/modular_computer/pda/wrist/engineering/install_default_hardware()
	..()
	scanner = new /obj/item/weapon/computer_hardware/scanner/atmos(src)

/obj/item/modular_computer/pda/wrist/security
	icon_state = "wc-security"
	item_state = "wc-security"
	item_state_slots = list(slot_wear_id_str = "wc-security")

/obj/item/modular_computer/pda/wrist/science
	icon_state = "wc-science"
	item_state = "wc-science"
	item_state_slots = list(slot_wear_id_str = "wc-science")

/obj/item/modular_computer/pda/wrist/science/install_default_hardware()
	..()
	scanner = new /obj/item/weapon/computer_hardware/scanner/reagent(src)

/obj/item/modular_computer/pda/wrist/heads
	icon_state = "wc-command"
	item_state = "wc-command"
	item_state_slots = list(slot_wear_id_str = "wc-command")

/obj/item/modular_computer/pda/wrist/heads/install_default_hardware()
	..()
	scanner = new /obj/item/weapon/computer_hardware/scanner/paper(src)
