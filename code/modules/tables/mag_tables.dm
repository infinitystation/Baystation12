/obj/structure/table/mag
	name = "Magnetic Table"
	desc = "It is simple magnetic table. Good for merchants."
	icon = 'icons/mag_tables.dmi'
	icon_state = "magnetic_table_disabled"
	var/icon_state_open = "magnetic_table_disabled"
	var/icon_state_closed = "magnetic_table_enabled"
	can_plate = 0
	can_reinforce = 0
	flipped = -1
	health = 20
	var/locked = 0

/obj/structure/table/mag/New()
	..()
	verbs -= /obj/structure/table/verb/do_flip
	verbs -= /obj/structure/table/proc/do_put
	verbs += /obj/structure/table/mag/verb/toggle_lock

/obj/structure/table/mag/Initialize()
	. = ..()

/obj/structure/table/mag/update_connections()
	return

/obj/structure/table/mag/update_desc()

	return

/obj/structure/table/mag/update_icon()
	if (locked)
		icon_state = icon_state_closed
	else
		icon_state = icon_state_open
	return

/obj/structure/table/mag/can_connect()
	return FALSE

/obj/structure/table/mag/take_damage(amount)
	..()
	if(health <= 10 && locked)
		toggle_lock()


/obj/structure/table/mag/Destroy()
	if(locked)
		toggle_lock()
	..()

/obj/structure/table/mag/break_to_parts()
	if(locked)
		toggle_lock()
	..()

/obj/structure/table/mag/verb/toggle_lock()
	set name = "Toggle magtable lock"
	set desc = "..."
	set category = "Object"
	set src in oview(1)

	if (!can_touch(usr) || ismouse(usr))
		return

	if(health <= 10)
		return

	locked = !locked

	if(locked)
		usr.visible_message("<span class='warning'>[usr] locks [src]!</span>")
	else
		usr.visible_message("<span class='warning'>[usr] unlocks [src]!</span>")

	update_icon()

	for (var/obj/item/I in get_turf(src))
		I.anchored = locked

	playsound(src,'sound/machines/Table_Fall.ogg',100,1)

	return
