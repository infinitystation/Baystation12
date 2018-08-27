/turf/simulated/wall
	name = "bulkhead"

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"

//wild capitalism (no)
/datum/computer_file/program/merchant
	required_access = 57

/obj/machinery/door/airlock/autoname/command
	icon = 'icons/obj/doors/Doorhatchele.dmi'
	req_access = list(access_heads)

/obj/machinery/door/airlock/autoname/engineering
	req_access = list(access_engine)

/obj/machinery/power/smes/buildable/explor_shuttle/New()
	..(0)
	component_parts += new /obj/item/weapon/smes_coil/weak(src)
	recalc_coils()

	component_parts = list()
	component_parts += new /obj/item/stack/cable_coil(src,30)
	component_parts += new /obj/item/weapon/circuitboard/smes(src)
	src.wires = new /datum/wires/smes(src)

	// Allows for mapped-in SMESs with larger capacity/IO
	if(cur_coils)
		for(var/i = 1, i <= cur_coils, i++)
			component_parts += new /obj/item/weapon/smes_coil/weak(src)
		recalc_coils()
	..()