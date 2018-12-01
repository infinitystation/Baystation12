/obj/item/clothing/accessory/locket
	name = "silver locket"
	desc = "A silver locket that seems to have space for a photo within."
	icon_state = "locket"
	item_state = "locket"
	slot_flags = 0
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_MASK | SLOT_TIE
	var/base_icon
	var/open
	var/obj/item/held //Item inside locket.
	var/message

/obj/item/clothing/accessory/locket/examine(mob/user)
	. = ..()
	if(open && message)
		to_chat(user, "<span class='notice'>[message]</span>")

/obj/item/clothing/accessory/locket/attack_self(mob/user as mob)
	if(!base_icon)
		base_icon = icon_state

	if(!("[base_icon]_open" in icon_states(icon)))
		to_chat(user, "\The [src] doesn't seem to open.")
		return

	open = !open
	to_chat(user, "You flip \the [src] [open?"open":"closed"].")
	if(open)
		icon_state = "[base_icon]_open"
		if(held)
			to_chat(user, "\The [held] falls out!")
			held.dropInto(user.loc)
			src.held = null
	else
		icon_state = "[base_icon]"

/obj/item/clothing/accessory/locket/attackby(var/obj/item/O as obj, mob/user as mob)
	if(!open)
		to_chat(user, "You have to open it first.")
		return

	if(istype(O,/obj/item/weapon/paper) || istype(O, /obj/item/weapon/photo))
		if(held)
			to_chat(usr, "\The [src] already has something inside it.")
		else
			if(!user.unEquip(O, src))
				return
			to_chat(usr, "You slip [O] into [src].")
			src.held = O
		return

	if(istype(O,/obj/item/weapon/pen))
		var/new_message = sanitize(input("Enter the text which you want write here (leave field blank to remove)") as text, MAX_DESC_LEN)
		if(!new_message)
			message = null
		else
			message = new_message
		return
	..()
