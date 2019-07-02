/obj/item/modular_computer/pda/wrist
	name = "wrist computer"
	desc = "A wrist-mounted modular personal computer. Very stylish."
	icon = 'infinity/icons/obj/wrist_computer.dmi'
	item_icons = list(slot_wear_id_str = 'infinity/icons/mob/wrist_computer.dmi')

	item_state_slots = list(slot_wear_id_str = "wc_base")
	icon_state = "wc_base"
	item_state = "wc_base"
	icon_state_unpowered = "wc_base"

	slot_flags = SLOT_ID | SLOT_BELT

	color = COLOR_GUNMETAL
	item_state_slots = list(slot_wear_id_str = "wc_base")

	var/stripe_color

/obj/item/modular_computer/pda/wrist/on_update_icon()
	..()
	if(stripe_color)
		var/image/I = image(icon = icon, icon_state = "wc_stripe")
		I.appearance_flags |= RESET_COLOR
		I.color = stripe_color
		overlays.Add(I)

	var/mob/living/carbon/human/H = loc
	if(istype(H) && H.wear_id == src)
		H.update_inv_wear_id()

/obj/item/modular_computer/pda/wrist/get_mob_overlay(var/mob/user_mob, var/slot)
	var/image/ret = ..()
	if(slot == slot_wear_id_str)
		if(enabled)
			var/image/I = image(icon = ret.icon, icon_state = "wc_screen")
			I.appearance_flags |= RESET_COLOR
			I.color = (bsod || updating) ? "#0000ff" : "#00ff00"
			ret.overlays.Add(I)
		else
			ret.overlays.Add(image(icon = ret.icon, icon_state = "wc_screen_off"))
		if(stripe_color)
			var/image/I = image(icon = ret.icon, icon_state = "wc_stripe")
			I.appearance_flags |= RESET_COLOR
			I.color = stripe_color
			overlays.Add(I)
	return ret

/obj/item/modular_computer/pda/wrist/AltClick(var/mob/user)
	if(!CanPhysicallyInteract(user))
		return
	if(card_slot && istype(card_slot.stored_card))
		eject_id()
	else
		..()

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
	return ..()

// wrist box
/obj/item/weapon/storage/box/wrist
	name = "box of spare wrist computers"
	desc = "A box of spare wrist microcomputers."
	icon_state = "pda"
	startswith = list(/obj/item/modular_computer/pda/wrist = 5)

// wrist types
/* to-do - set color and stripe_color
/obj/item/modular_computer/pda/wrist/medical
	icon_state = "wrist-m"
	icon_state_unpowered = "wrist-m"

/obj/item/modular_computer/pda/wrist/chemistry
	icon_state = "wrist-m"
	icon_state_unpowered = "wrist-m"

/obj/item/modular_computer/pda/wrist/engineering
	icon_state = "wrist-e"
	icon_state_unpowered = "wrist-e"

/obj/item/modular_computer/pda/wrist/security
	icon_state = "wrist-s"
	icon_state_unpowered = "wrist-s"

/obj/item/modular_computer/pda/wrist/forensics
	icon_state = "wrist-s"
	icon_state_unpowered = "wrist-s"

/obj/item/modular_computer/pda/wrist/science
	icon_state = "wrist-nt"
	icon_state_unpowered = "wrist-nt"

/obj/item/modular_computer/pda/wrist/heads
	icon_state = "wrist-h"
	icon_state_unpowered = "wrist-h"

/obj/item/modular_computer/pda/wrist/heads/paperpusher
	stored_pen = /obj/item/weapon/pen/fancy

/obj/item/modular_computer/pda/wrist/heads/hop
	icon_state = "wrist-hop"
	icon_state_unpowered = "wrist-hop"

/obj/item/modular_computer/pda/wrist/heads/hos
	icon_state = "wrist-hos"
	icon_state_unpowered = "wrist-hos"

/obj/item/modular_computer/pda/wrist/heads/ce
	icon_state = "wrist-ce"
	icon_state_unpowered = "wrist-ce"

/obj/item/modular_computer/pda/wrist/heads/cmo
	icon_state = "wrist-cmo"
	icon_state_unpowered = "wrist-cmo"

/obj/item/modular_computer/pda/wrist/heads/rd
	icon_state = "wrist-rd"
	icon_state_unpowered = "wrist-rd"

/obj/item/modular_computer/pda/wrist/captain
	icon_state = "wrist-c"
	icon_state_unpowered = "wrist-c"

/obj/item/modular_computer/pda/wrist/ert
	icon_state = "wrist-h"
	icon_state_unpowered = "wrist-h"

/obj/item/modular_computer/pda/wrist/cargo
	icon_state = "wrist-sup"
	icon_state_unpowered = "wrist-sup"

/obj/item/modular_computer/pda/wrist/syndicate
	icon_state = "wrist-syn"
	icon_state_unpowered = "wrist-syn"

/obj/item/modular_computer/pda/wrist/roboticist
	icon_state = "wrist-robot"
	icon_state_unpowered = "wrist-robot"

/obj/item/modular_computer/pda/wrist/explorer
	icon_state = "wrist-exp"
	icon_state_unpowered = "wrist-exp"

/obj/item/modular_computer/pda/wrist/grey
	icon_state = "wrist-grey"
	icon_state_unpowered = "wrist-grey"

/obj/item/modular_computer/pda/wrist/lila
	icon_state = "wrist-lila"
	icon_state_unpowered = "wrist-lila"

/obj/item/modular_computer/pda/wrist/lila/black
	icon_state = "wrist-lila-black"
	icon_state_unpowered = "wrist-lila-black"*/
