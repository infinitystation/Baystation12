/obj/docking_port/north
	dir = NORTH

/obj/docking_port/south
	dir = SOUTH
	pixel_y = -96

/obj/docking_port/east
	dir = EAST
	pixel_x = 0

/obj/docking_port/west
	dir = WEST
	pixel_x = -96

/* TODO for ascents
/obj/docking_port/ascents
	icon = 'infinity/icons/obj/overmap/ascent_docking_port.dmi'

/obj/docking_port/ascents/north
	dir = NORTH

/obj/docking_port/ascents/south
	dir = SOUTH
	pixel_y = -96

/obj/docking_port/ascents/east
	dir = EAST
	pixel_x = 0

/obj/docking_port/ascents/west
	dir = WEST
	pixel_x = -96
*/

/obj/docking_port/one_way/Initialize()
	. = ..()
	name = "reinforced telescopic docking port"
	desc += " Looks like this one was reinforced - other ports can't connect to it at their own."

/obj/docking_port/one_way/ship_setup()
	. = ..()
	if(our_ship)
		our_ship.connectors -= src

/obj/docking_port/one_way/north
	dir = NORTH

/obj/docking_port/one_way/south
	dir = SOUTH
	pixel_y = -96

/obj/docking_port/one_way/east
	dir = EAST
	pixel_x = 0

/obj/docking_port/one_way/west
	dir = WEST
	pixel_x = -96

/* TODO for ascents
/obj/docking_port/one_way/ascents
	icon = 'infinity/icons/obj/overmap/ascent_docking_port.dmi'

/obj/docking_port/one_way/ascents/north
	dir = NORTH

/obj/docking_port/one_way/ascents/south
	dir = SOUTH
	pixel_y = -96

/obj/docking_port/one_way/ascents/east
	dir = EAST
	pixel_x = 0

/obj/docking_port/one_way/ascents/west
	dir = WEST
	pixel_x = -96
*/
