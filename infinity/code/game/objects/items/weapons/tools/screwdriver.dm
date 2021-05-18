/obj/item/screwdriver/power
	name = "hand drill"
	desc = "A simple powered hand drill. It's fitted with a screw bit."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "drill_screw"
	item_state = "drill"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 8
	throwforce = 8
	throw_speed = 2
	throw_range = 3
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_ENGINEERING = 3)
	matter = list(DEFAULT_WALL_MATERIAL = 5000, "silver" = 2000)
	center_of_mass = "x=16;y=7"
	attack_verb = list("drilled", "screwed", "jabbed","whacked")
	hitsound = 'infinity/sound/items/drill_hit.ogg'
	//usesound = 'sound/items/drill_use.ogg'

/obj/item/screwdriver/power/attack_self(mob/user)
	playsound(get_turf(user),'infinity/sound/items/change_drill.ogg',50,1)
	var/obj/item/wrench/power/b_drill = new /obj/item/wrench/power
	to_chat(user, "<span class='notice'>You attach the bolt driver bit to [src].</span>")
	qdel(src)
	user.put_in_active_hand(b_drill)

/obj/item/screwdriver/power/Initialize()
	. = ..()
	icon_state = "drill_screw"
	color = "#ffffff"
