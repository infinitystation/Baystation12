/obj/item/wape
	name = "wape"
	desc = "..."
	icon = 'icons/obj/vape.dmi'
	icon_state = "red_vape_closed"
	w_class = ITEM_SIZE_SMALL
	matter = list()
	item_flags = ITEM_FLAG_NO_BLUDGEON
	var/icon_closed = "vape_red_closed"
	var/icon_active = "vape_red_on"
	var/icon_inactive = "vape_red_off"
	var/wape_status = "closed"
	var/isvaping = FALSE

/obj/item/wape/New()
	..()
	update_icon()

/obj/item/wape/attackby(var/obj/item/W, var/mob/user)


/obj/item/wape/update_icon()
	..()
	switch (wape_status)
		if ("closed") icon_state = icon_closed
		if ("off") icon_state = icon_inactive
		if ("on") icon_state = icon_active

/obj/item/wape/attack_self(mob/user as mob)
	if (wape_status == "closed")
		to_chat(user, "<span class='notice'>You can't toggle closed wape.</span>")
		return
	wape_status = (wape_status == "off" ? "on" : "off")
	update_icon()

/obj/item/wape/AltClick(mob/user as mob)
	if (wape_status == "closed")
		wape_status = "off"
	else if (wape_status == "on")
		to_chat(user, "<span class='notice'>You extend the plastic blade with a quick flick of your wrist.</span>")
	else
		wape_status = "closed"
	update_icon()

/obj/item/wape/attack(atom/A, mob/living/user, def_zone)
	if(!isvaping)
		isvaping = !isvaping
		if (A == user && do_after(user, 30, src))
			to_chat(user, "<span class='notice'>You inhale some steam</span>")
		isvaping = !isvaping
