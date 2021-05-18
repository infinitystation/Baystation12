/obj/item/wrench/power
	name = "hand drill"
	desc = "A simple powered hand drill. It's fitted with a bolt bit."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "drill_bolt"
	item_state = "drill"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 8.0
	throwforce = 8.0
	throw_speed = 2
	throw_range = 3
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_ENGINEERING = 3)
	matter = list(DEFAULT_WALL_MATERIAL = 5000, "silver" = 2000)
	center_of_mass = "x=17;y=16"
	attack_verb = list("drilled", "screwed", "jabbed")
	//usesound = 'sound/items/drill_use.ogg'

/obj/item/wrench/power/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/screwdriver/power/s_drill = new /obj/item/screwdriver/power
	to_chat(user, "<span class='notice'>You attach the screw driver bit to [src].</span>")
	qdel(src)
	user.put_in_active_hand(s_drill)

/obj/item/wrench/power/Initialize()
	. = ..()
	icon_state = "drill_bolt"
	color = "#ffffff"
