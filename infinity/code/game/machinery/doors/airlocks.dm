/obj/machinery/door/airlock/command/autoname/New()
	var/area/A = get_area(src)
	name = A.name
	..()

/obj/machinery/door/airlock/security/striped
	stripe_color = COLOR_ORANGE

/obj/machinery/door/airlock/engineering/striped
	stripe_color = COLOR_RED

/obj/machinery/door/airlock/centcom
	name = "Airlock"
	icon = 'icons/obj/doors/centcomm/door.dmi'

/obj/machinery/door/airlock/centcom/autoname/New()
	var/area/A = get_area(src)
	name = A.name
	..()


/obj/machinery/door/airlock/glass/command/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/security/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/engineering/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/medical/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/vault
	name = "Vault"
	icon = 'icons/obj/doors/vault/door.dmi'
	explosion_resistance = 20
	opacity = 1
	secured_wires = 1
	assembly_type = /obj/structure/door_assembly/door_assembly_highsecurity //Until somebody makes better sprites.
