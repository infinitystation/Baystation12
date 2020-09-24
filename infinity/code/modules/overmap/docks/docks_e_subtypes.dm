/obj/docking_port/enterence/north
	dir = NORTH

/obj/docking_port/enterence/south
	dir = SOUTH

/obj/docking_port/enterence/east
	dir = EAST

/obj/docking_port/enterence/west
	dir = WEST

/* TODO for ascents
/obj/docking_port/enterence/ascents
	icon = 'infinity/icons/obj/overmap/ascent_docking_port.dmi'

/obj/docking_port/enterence/ascents/north
	dir = NORTH

/obj/docking_port/enterence/ascents/south
	dir = SOUTH

/obj/docking_port/enterence/ascents/east
	dir = EAST

/obj/docking_port/enterence/ascents/west
	dir = WEST
*/

/obj/docking_port/enterence/one_way/Initialize()
	. = ..()
	name = "reinforced telescopic docking port"
	desc += " Looks like this one was reinforced - other ports can't connect to it at their own."

/obj/docking_port/enterence/one_way/ship_setup()
	. = ..()
	if(our_ship)
		our_ship.connectors -= src

/obj/docking_port/enterence/one_way/north
	dir = NORTH

/obj/docking_port/enterence/one_way/south
	dir = SOUTH

/obj/docking_port/enterence/one_way/east
	dir = EAST

/obj/docking_port/enterence/one_way/west
	dir = WEST

/* TODO for ascents
/obj/docking_port/enterence/one_way/ascents
	icon = 'infinity/icons/obj/overmap/ascent_docking_port.dmi'

/obj/docking_port/enterence/one_way/ascents/north
	dir = NORTH

/obj/docking_port/enterence/one_way/ascents/south
	dir = SOUTH

/obj/docking_port/enterence/one_way/ascents/east
	dir = EAST

/obj/docking_port/enterence/one_way/ascents/west
	dir = WEST
*/
