//lol kek cheburekColtrane97@inf-dev

/decl/hierarchy/supply_pack/machinery
	name = "Machinery"
	containertype = /obj/structure/largecrate //cause machineries aren't fit into regular crates

/decl/hierarchy/supply_pack/machinery/floodlight
	name = "Machinery - Floodlight crate"
	contains = list(/obj/machinery/floodlight = 2)
	cost = 10
	containername = "floodlight crate"

/decl/hierarchy/supply_pack/machinery/microwave
	name = "Machinery - Microwave crate"
	contains = list(/obj/machinery/microwave{anchored = FALSE} = 1)
	cost = 15
	containername = "microwave crate"

/decl/hierarchy/supply_pack/machinery/papershredder
	name = "Machinery - Paper shredder crate"
	contains = list(/obj/machinery/papershredder/unsecured = 1)
	cost = 8
	containername = "paper shredder crate"

/decl/hierarchy/supply_pack/machinery/photocopier
	name = "Machinery - Photocopier crate"
	contains = list(/obj/machinery/photocopier/unsecured = 1)
	cost = 8
	containername = "photocopier crate"
