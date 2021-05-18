// part of
/obj/item/crowbar/power
	name = "jaws of life"
	desc = "A set of jaws of life, compressed through the magic of science. It's fitted with a prying head."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "jaws_pry"
	item_state = "jawsoflife"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 15.0
	throwforce = 10.0
	throw_speed = 2.0
	throw_range = 2.0
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_ENGINEERING = 3)
	matter = list(DEFAULT_WALL_MATERIAL = 5000, "silver" = 2000)
	center_of_mass = "x=18;y=10"
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")
	//usesound = 'sound/items/jaws_cut.ogg'

/obj/item/crowbar/power/attack_self(mob/user)
	playsound(get_turf(user), 'infinity/sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/wirecutters/power/cutjaws = new /obj/item/wirecutters/power
	to_chat(user, "<span class='notice'>You attach the cutting jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(cutjaws)

/obj/item/crowbar/power/Initialize()
	. = ..()
	icon_state = "jaws_pry"
	color = "#ffffff"
