/obj/item/vape
	name = "vape"
	desc = "..."
	icon = 'icons/obj/vape.dmi'
	icon_state = "red_vape_closed"
	w_class = ITEM_SIZE_SMALL
	matter = list()
	item_flags = ITEM_FLAG_NO_BLUDGEON
	var/icon_closed = "vape_red_closed"
	var/icon_active = "vape_red_on"
	var/icon_inactive = "vape_red_off"
	var/vape_status = "closed"
	var/isvaping = FALSE

/obj/item/vape/New()
	..()
	update_icon()

/obj/item/vape/attackby(var/obj/item/W, var/mob/user)


/obj/item/vape/on_update_icon()
	..()
	switch (vape_status)
		if ("closed") icon_state = icon_closed
		if ("off") icon_state = icon_inactive
		if ("on") icon_state = icon_active

/obj/item/vape/attack_self(mob/user as mob)
	if (vape_status == "closed")
		to_chat(user, "<span class='notice'>You can't toggle closed vape.</span>")
		return
	vape_status = (vape_status == "off" ? "on" : "off")
	update_icon()

/obj/item/vape/AltClick(mob/user as mob)
	if (vape_status == "closed")
		vape_status = "off"
	else if (vape_status == "on")
		to_chat(user, "<span class='notice'>Turn off the vape first.</span>")
	else
		vape_status = "closed"
	update_icon()

/obj/item/vape/attack(atom/A, mob/living/user, def_zone)
	if(!isvaping && vape_status == "on")
		isvaping = !isvaping
		if (A == user && do_after(user, 30, src))
			to_chat(user, "<span class='notice'>You inhale some steam.</span>")
			audible_message("<b>\The [user]</b> inhale some steam.")
		isvaping = !isvaping
