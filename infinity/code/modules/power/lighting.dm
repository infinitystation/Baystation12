/obj/machinery/light
	var/special_broken_chance = 0

/obj/machinery/light/halogen
	light_type = /obj/item/weapon/light/tube/halogen

/obj/item/weapon/light/tube/halogen
	name = "halogen light tube"
	color = LIGHT_COLOR_HALOGEN //visual icon
	b_colour = LIGHT_COLOR_HALOGEN

/obj/machinery/light/outer //works without power sources in area
	on = TRUE

/obj/machinery/light/outer/powered()
	return TRUE
