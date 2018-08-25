/obj/structure/scrap_cube
	name = "compressed scrap"
	desc = "A cube made of scrap compressed with hydraulic clamp."
	density = 1
	anchored = 0
	icon_state = "trash_cube"
	icon = 'icons/obj/scrap/refine.dmi'

/obj/structure/scrap_cube/crush_act()
	playsound(src.loc, 'sound/items/Welder.ogg', 50, 1)
	for(var/obj/structure/rubble/r in contents)
		for(var/i in 1, i < r.lootleft, i++)
			new /obj/item/weapon/scrap_lump(loc)
	qdel(src)

/obj/structure/scrap_cube/proc/make_pile()
	for(var/obj/item in contents)
		item.forceMove(loc)
	qdel(src)

/obj/structure/scrap_cube/Initialize(mapload, size = -1)
	. = ..()
	if(size < 0)
		new /obj/structure/rubble/house(src)

/obj/structure/scrap_cube/attackby(obj/item/W, mob/user)
	user.do_attack_animation(src)
	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	if(istype(W,/obj/item/weapon) && W.force >=8)
		visible_message("<span class='notice'>\The [user] smashes the [src], restoring it's original form.</span>")
		make_pile()
	else
		visible_message("<span class='notice'>\The [user] smashes the [src], but [W] is too weak to break it!</span>")

/obj/item/weapon/scrap_lump
	name = "unrefined scrap"
	desc = "This thing is messed up beyond any recognition. Into the grinder it goes!"
	icon = 'icons/obj/scrap/refine.dmi'
	icon_state = "unrefined"
	w_class = 4

/obj/item/weapon/scrap_lump/Initialize()
	. = ..()
	pixel_x = rand(0, 16) - 8
	pixel_y = rand(0, 8) - 8

/obj/item/weapon/scrap_lump/crush_act()
	return
