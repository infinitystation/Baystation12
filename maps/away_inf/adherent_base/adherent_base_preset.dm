obj/structure/adh_base/broken_cryo
	name = "destroyed cryo sleeper"
	desc = "A mangled cryo sleeper with evidence that someone was inside when it was crushed. It looks like you could pry it open with a crowbar."
	icon = 'maps/away/icarus/icarus_sprites.dmi'
	icon_state = "broken_cryo"
	anchored = 1
	density = 1
	var/closed = 1
	var/busy = 0

/obj/structure/sign/adh_base/solgov
	name = "\improper SolGov Seal"
	desc = "A familiar seal showing this vessel is SolGov property."
	icon = 'maps/away/icarus/icarus_sprites.dmi'
	icon_state = "solgovseal"

obj/structure/adh_base/broken_cryo/attack_hand(mob/user)
	..()
	if (closed)
		to_chat(user, "<span class='notice'>You tug at the glass but can't open it with your hands alone.</span>")
	else
		to_chat(user, "<span class='notice'>The glass is already open.</span>")


/obj/structure/adh_base/broken_cryo/attackby(obj/item/W as obj, mob/user as mob)
	if (busy)
		to_chat(user, "<span class='notice'>Someone else is attempting to open this.</span>")
		return
	if (closed)
		if (isCrowbar(W))
			busy = 1
			visible_message("[user] starts to pry the glass cover off of \the [src].")
			if (!do_after(user, 50, src))
				visible_message("[user] stops trying to pry the glass off of \the [src].")
				busy = 0
				return
			closed = 0
			busy = 0
			icon_state = "broken_cryo_open"
			var/obj/dead = new /obj/item/adh_base/dead_personnel(loc)
			dead.dir = src.dir//skeleton is oriented as cryo
	else
		to_chat(user, "<span class='notice'>The glass cover is already open.</span>")

/obj/item/adh_base/dead_personnel
	name = "partial skeleton remains"
	desc = "Human bones wrapped in the shredded remnants of a familiar black uniform."
	icon = 'maps/away/icarus/icarus_sprites.dmi'
	icon_state = "dead_personnel"
	w_class = ITEM_SIZE_LARGE//pile of bones

/obj/item/device/flashlight/lamp/floodlamp/pseudosun
	name = ""
	desc = ""
	icon_state = null
	item_state = null
	on = 1

	flashlight_max_bright = 0.95 //sunlight
	flashlight_inner_range = 30
	flashlight_outer_range = 30