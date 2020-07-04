/obj/structure/curtain
	desc = "Yeap, that's curtains. You may uninstall them with a screwdriver."
	var/in_progress = 0 //for (un)installing

/obj/structure/curtain/bed
	name = "bed curtain"
	color = "#854636"

/obj/structure/curtain/open/black
	name = "black curtain"
	color = "#222222"

/obj/structure/curtain/attackby(obj/item/W as obj, mob/user as mob)
	if(in_progress)
		return
	if(isScrewdriver(W))
		in_progress = 1
		user.visible_message(SPAN_NOTICE("[user] is uninstalling \the [src]."), SPAN_NOTICE("You are uninstalling \the [src]."))
		playsound(src, 'sound/items/Screwdriver.ogg', 100, 1)
		if(!do_after(user, 40,src))
			in_progress = 0
			return
		var/obj/item/curtain/C = new /obj/item/curtain(loc)
		C.color = color
		qdel(src)

/obj/item/curtain
	name = "rolled curtain"
	desc = "A rolled curtains. Looks like someone may install them with a screwdriver..."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "curtain_rolled"
	var/in_progress = 0
	force = 3 //just plastic
	w_class = ITEM_SIZE_HUGE //curtains, yeap

/obj/item/curtain/attackby(obj/item/W as obj, mob/user as mob)
	if(in_progress)
		return
	if(loc == user.loc)
		to_chat(user, "You cannot install [src] from your hands.")
		return
	if(isScrewdriver(W))
		in_progress = 1
		user.visible_message(SPAN_NOTICE("[user] is installing \the [src]."), SPAN_NOTICE("You are installing \the [src]."))
		playsound(src, 'sound/items/Screwdriver.ogg', 100, 1)
		if(!do_after(user, 40,src))
			in_progress = 0
			return
		var/obj/structure/curtain/C = new /obj/structure/curtain(loc)
		C.color = color
		qdel(src)
