/obj/item/modular_computer/wrist
	name = "\improper wrist PDA"
	desc = "A compact wrist computer designed to keep its user always connected."
	icon = 'icons/obj/modular_wrist.dmi'
	item_icons = list(slot_wear_id_str = 'icons/mob/infinity/wristcomp.dmi')
	item_state_slots = list(slot_wear_id_str = "wrist")
	icon_state = "wrist"
	item_state = "wrist"
	icon_state_unpowered = "wrist"
	hardware_flag = PROGRAM_TABLET
	max_hardware_size = 1
	base_active_power_usage = 4
	base_idle_power_usage = 0
	w_class = ITEM_SIZE_SMALL
	light_strength = 2
	slot_flags = SLOT_ID | SLOT_GLOVES
	stores_pen = TRUE
	stored_pen = /obj/item/weapon/pen
	receives_updates = FALSE

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
	icon_state = "pda"
	startswith = list(/obj/item/modular_computer/wrist = 5)

// PDA types
/obj/item/modular_computer/wrist/medical
	icon_state = "wrist-m"
	icon_state_unpowered = "wrist-m"

/obj/item/modular_computer/wrist/chemistry
	icon_state = "wrist-m"
	icon_state_unpowered = "wrist-m"

/obj/item/modular_computer/wrist/engineering
	icon_state = "wrist-e"
	icon_state_unpowered = "wrist-e"

/obj/item/modular_computer/wrist/security
	icon_state = "wrist-s"
	icon_state_unpowered = "wrist-s"

/obj/item/modular_computer/wrist/forensics
	icon_state = "wrist-s"
	icon_state_unpowered = "wrist-s"

/obj/item/modular_computer/wrist/science
	icon_state = "wrist-nt"
	icon_state_unpowered = "wrist-nt"

/obj/item/modular_computer/wrist/heads
	icon_state = "wrist-h"
	icon_state_unpowered = "wrist-h"

/obj/item/modular_computer/wrist/heads/paperpusher
	stored_pen = /obj/item/weapon/pen/fancy

/obj/item/modular_computer/wrist/heads/hop
	icon_state = "wrist-hop"
	icon_state_unpowered = "wrist-hop"

/obj/item/modular_computer/wrist/heads/hos
	icon_state = "wrist-hos"
	icon_state_unpowered = "wrist-hos"

/obj/item/modular_computer/wrist/heads/ce
	icon_state = "wrist-ce"
	icon_state_unpowered = "wrist-ce"

/obj/item/modular_computer/wrist/heads/cmo
	icon_state = "wrist-cmo"
	icon_state_unpowered = "wrist-cmo"

/obj/item/modular_computer/wrist/heads/rd
	icon_state = "wrist-rd"
	icon_state_unpowered = "wrist-rd"

/obj/item/modular_computer/wrist/captain
	icon_state = "wrist-c"
	icon_state_unpowered = "wrist-c"

/obj/item/modular_computer/wrist/ert
	icon_state = "wrist-h"
	icon_state_unpowered = "wrist-h"

/obj/item/modular_computer/wrist/cargo
	icon_state = "wrist-sup"
	icon_state_unpowered = "wrist-sup"

/obj/item/modular_computer/wrist/syndicate
	icon_state = "wrist-syn"
	icon_state_unpowered = "wrist-syn"

/obj/item/modular_computer/wrist/roboticist
	icon_state = "wrist-robot"
	icon_state_unpowered = "wrist-robot"

/obj/item/modular_computer/wrist/explorer
	icon_state = "wrist-exp"
	icon_state_unpowered = "wrist-exp"

/obj/item/modular_computer/wrist/grey
	icon_state = "wrist-grey"
	icon_state_unpowered = "wrist-grey"

/obj/item/modular_computer/wrist/lila
	icon_state = "wrist-lila"
	icon_state_unpowered = "wrist-lila"

/obj/item/modular_computer/wrist/lila/black
	icon_state = "wrist-lila-black"
	icon_state_unpowered = "wrist-lila-black"