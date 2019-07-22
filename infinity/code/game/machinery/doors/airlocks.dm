/obj/machinery/door/airlock/autoname/command
	door_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/autoname/engineering
	door_color = COLOR_AMBER

/obj/machinery/door/airlock/autoname/centcom
	airlock_type = "centcomm"
	name = "\improper Airlock"
	icon = 'icons/obj/doors/centcomm/door.dmi'
	fill_file = 'icons/obj/doors/centcomm/fill_steel.dmi'
	paintable = AIRLOCK_PAINTABLE|AIRLOCK_STRIPABLE

/obj/machinery/door/airlock/autoname/civilian
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/security/striped
	stripe_color = COLOR_ORANGE

/obj/machinery/door/airlock/engineering/striped
	stripe_color = COLOR_RED

/obj/machinery/door/airlock/centcom
	name = "Airlock"
	icon = 'icons/obj/doors/centcomm/door.dmi'


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
