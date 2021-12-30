/obj/machinery/door/airlock/cult
	name = "Massive door"
	desc = "A very massice door. How we can open her?"
	icon = 'icons/obj/doors/elevator/door.dmi'
	icon_state = "closed"
	bolts_file = 'icons/obj/doors/elevator/lights_bolts.dmi'
	deny_file = 'icons/obj/doors/elevator/lights_deny.dmi'
	lights_file = 'icons/obj/doors/elevator/lights_green.dmi'
	color = COLOR_DARK_BROWN
	locked = TRUE
	min_force = 50
	maxhealth = 5000

/obj/machinery/door/airlock/cult/attack_hand(mob/user)
	to_chat(user, "You don't know how you can open this with hands.")

/obj/machinery/door/airlock/cult/attackby(obj/item/I, mob/user)
	if (istype(I, /obj/item/nullrod))
		to_chat(user, SPAN_NOTICE("\The [src] starts opening!"))

		unlock()
		sleep(2 SECONDS)
		open()
		sleep(2 SECONDS)
		lock()
