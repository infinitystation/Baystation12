/obj/item/weapon/screwdriver/power
	name = "hand drill"
	desc = "A simple powered hand drill. It's fitted with a screw bit."
	icon = 'icons/obj/items_inf.dmi'
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
	hitsound = 'sound/items/drill_hit.ogg'
	//usesound = 'sound/items/drill_use.ogg'

/obj/item/weapon/screwdriver/power/attack_self(mob/user)
	playsound(get_turf(user),'sound/items/change_drill.ogg',50,1)
	var/obj/item/weapon/wrench/power/b_drill = new /obj/item/weapon/wrench/power
	to_chat(user, "<span class='notice'>You attach the bolt driver bit to [src].</span>")
	qdel(src)
	user.put_in_active_hand(b_drill)

/obj/item/weapon/screwdriver/power/Initialize()
	. = ..()
	icon_state = "drill_screw"
	color = "#ffffff"

/obj/item/weapon/wrench/power
	name = "hand drill"
	desc = "A simple powered hand drill. It's fitted with a bolt bit."
	icon = 'icons/obj/items_inf.dmi'
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

/obj/item/weapon/wrench/power/attack_self(mob/user)
	playsound(get_turf(user),'sound/items/change_drill.ogg',50,1)
	var/obj/item/weapon/screwdriver/power/s_drill = new /obj/item/weapon/screwdriver/power
	to_chat(user, "<span class='notice'>You attach the screw driver bit to [src].</span>")
	qdel(src)
	user.put_in_active_hand(s_drill)

/obj/item/weapon/wrench/power/Initialize()
	. = ..()
	icon_state = "drill_bolt"
	color = "#ffffff"

/obj/item/weapon/wirecutters/power
	name = "jaws of life"
	desc = "A set of jaws of life, compressed through the magic of science. It's fitted with a cutting head."
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "jaws_cutter"
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
	attack_verb = list("pinched", "nipped")
	sharp = 1
	edge = 1
	//usesound = 'sound/items/jaws_cut.ogg'

/obj/item/weapon/wirecutters/power/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/weapon/crowbar/power/pryjaws = new /obj/item/weapon/crowbar/power
	to_chat(user, "<span class='notice'>You attach the pry jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(pryjaws)

/obj/item/weapon/wirecutters/power/Initialize()
	. = ..()
	icon_state = "jaws_cutter"
	color = "#ffffff"

/obj/item/weapon/crowbar/power
	name = "jaws of life"
	desc = "A set of jaws of life, compressed through the magic of science. It's fitted with a prying head."
	icon = 'icons/obj/items_inf.dmi'
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

/obj/item/weapon/crowbar/power/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/weapon/wirecutters/power/cutjaws = new /obj/item/weapon/wirecutters/power
	to_chat(user, "<span class='notice'>You attach the cutting jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(cutjaws)

/obj/item/weapon/crowbar/power/Initialize()
	. = ..()
	icon_state = "jaws_pry"
	color = "#ffffff"

/obj/item/weapon/combitool
	name = "combi-tool"
	desc = "It even has one of those nubbins for doing the thingy."
	icon = 'icons/obj/tools.dmi'
	icon_state = "combitool"
	w_class = ITEM_SIZE_SMALL

	var/list/spawn_tools = list(
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/wrench,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/material/knife,
		/obj/item/weapon/material/kitchen/utensil/fork,
		/obj/item/weapon/material/hatchet
		)
	var/list/tools = list()
	var/current_tool = 1
	safely = 1

/obj/item/weapon/combitool/examine()
	..()
	if(loc == usr && tools.len)
		to_chat(usr, "It has the following fittings:")
		for(var/obj/item/tool in tools)
			to_chat(usr, "\icon[tool] - [tool.name][tools[current_tool]==tool?" (selected)":""]")

/obj/item/weapon/combitool/New()
	..()
	for(var/type in spawn_tools)
		tools |= new type(src)

/obj/item/weapon/combitool/attack_self(mob/user as mob)
	if(++current_tool > tools.len) current_tool = 1
	var/obj/item/tool = tools[current_tool]
	if(!tool)
		to_chat(user, "You can't seem to find any fittings in \the [src].")
	else
		to_chat(user, "You switch \the [src] to the [tool.name] fitting.")
	return 1

/obj/item/weapon/combitool/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!M.Adjacent(user))
		return 0
	var/obj/item/tool = tools[current_tool]
	if(!tool) return 0
	return (tool ? tool.attack(M,user) : 0)

/obj/item/weapon/combitool/afterattack(var/atom/target, var/mob/living/user, proximity, params)
	if(!proximity)
		return 0
	var/obj/item/tool = tools[current_tool]
	if(!tool) return 0
	tool.loc = user
	var/resolved = target.attackby(tool,user)
	if(!resolved && tool && target)
		tool.afterattack(target,user,1)
	if(tool)
		tool.loc = src
