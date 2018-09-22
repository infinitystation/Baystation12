/obj/item/modular_computer/wrist
	name = "\improper wrist PDA"
	desc = "A compact wrisp computer designed to keep its user always connected."
	icon = 'icons/obj/modular_wrist.dmi'
	description_fluff = "Morally obsolete and replaced by a more compact and perfect personal computer, the wrist PDA has been used to this day as a cheap replacement for more expensive equipment in some small corporations, and sometimes for the sake of aesthetic pleasure of it's owner."
	item_icons = list(slot_wear_id_str = 'icons/mob/infinity/wristcomp.dmi')
	item_state_slots = list(slot_wear_id_str = "wrist")
	icon_state = "wrist"
	item_state = "wrist"
	icon_state_unpowered = "wrist"
	hardware_flag = PROGRAM_PDA
	max_hardware_size = 1
	w_class = ITEM_SIZE_SMALL
	light_strength = 2
	slot_flags = SLOT_ID
	stores_pen = FALSE

/obj/item/modular_computer/wrist/Initialize()
	. = ..()
	//enable_computer()

/obj/item/modular_computer/wrist/AltClick(var/mob/user)
	if(!CanPhysicallyInteract(user))
		return
	if(card_slot && istype(card_slot.stored_card))
		eject_id()
	else
		..()

/obj/item/modular_computer/wrist/attack_hand(var/mob/user)
	if(loc == user)
		if(user.incapacitated() || user.restrained())
			return
		var/mob/living/carbon/human/H = user
		if(istype(H) && src == H.wear_id)
			return attack_self(user)
	return ..()

/obj/item/modular_computer/wrist/MouseDrop(var/obj/over_object)
	if(ishuman(usr))
		if(loc != usr) return
		if(usr.restrained() || usr.incapacitated()) return
		if (!usr.unEquip(src)) return
		usr.put_in_hands(src)
		src.add_fingerprint(usr)
		return
	return ..()

// PDA box
/obj/item/weapon/storage/box/wPDAs
	name = "box of spare wrist PDAs"
	desc = "A box of spare wrist PDA microcomputers."
	icon = 'icons/obj/pda.dmi'
	icon_state = "pdabox"
	startswith = list(/obj/item/modular_computer/wrist = 5)
