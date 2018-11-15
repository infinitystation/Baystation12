/obj/structure/table/do_climb(mob/living/user)
	. = ..()
	if(.)
		item_placed(user)

/obj/structure/table/proc/item_placed(item)
	return

/obj/structure/table/tray
	name = "surgical tray"
	desc = "A small metal tray with wheels."
	icon = 'icons/obj/surgerytable.dmi'
	icon_state = "tray"
	anchored = FALSE
	can_plate = 0
	can_reinforce = 0
	flipped = -1

	var/list/typecache_can_hold = list(/mob, /obj/item)
	var/list/held_items = list()

/obj/structure/table/tray/New()
	..()
	verbs -= /obj/structure/table/verb/do_flip
	verbs -= /obj/structure/table/proc/do_put

/obj/structure/table/tray/Initialize()
	. = ..()
	auto_align()
	typecache_can_hold = typecacheof(typecache_can_hold)
	for(var/atom/movable/held in get_turf(src))
		if(is_type_in_typecache(held, typecache_can_hold))
			held_items += held.UID()

/obj/structure/table/tray/Move(NewLoc, direct)
	var/atom/OldLoc = loc
	. = ..()
	if(!.) // ..() will return 0 if we didn't actually move anywhere.
		return .
	if(direct & (direct - 1)) // This represents a diagonal movement, which is split into multiple cardinal movements. We'll handle moving the items on the cardinals only.
		return .
	playsound(src, pick('sound/items/cartwheel1.ogg', 'sound/items/cartwheel2.ogg'), 100, 1)
	var/atom/movable/held
	for(var/held_uid in held_items)
		held = locateUID(held_uid)
		if(!held)
			held_items -= held_uid
			continue
		if(OldLoc != held.loc)
			held_items -= held_uid
			continue
		held.forceMove(NewLoc)

/obj/structure/table/tray/item_placed(atom/movable/item)
	. = ..()
	if(is_type_in_typecache(item, typecache_can_hold))
		held_items += item.UID()

/obj/structure/table/tray/update_connections()
	return

/obj/structure/table/tray/update_desc()
	return

/obj/structure/table/tray/on_update_icon()
	return

/obj/structure/table/tray/can_connect()
	return FALSE

/obj/structure/table/mag/CtrlClick()
	return

/obj/structure/table/tray/flip()
	return FALSE

/obj/structure/table/tray/dismantle(obj/item/weapon/wrench/W, mob/user)
	to_chat(user, "<span class='warning'>You cannot dismantle \the [src].</span>")
	return