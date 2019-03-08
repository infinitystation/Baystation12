/obj/item/weapon/circuitboard/emitter
	name = T_BOARD("emitter")
	build_path = /obj/machinery/power/emitter
	board_type = "machine"
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 3)
	req_components = list(/obj/item/weapon/stock_parts/capacitor/ = 2, /obj/item/weapon/stock_parts/micro_laser/ = 4)

/obj/item/weapon/circuitboard/rad_collector
	name = T_BOARD("radiation collector array")
	build_path = /obj/machinery/power/rad_collector
	board_type = "machine"
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 4, TECH_PHORON = 3)
	req_components = list(/obj/item/weapon/stock_parts/manipulator/ = 2, /obj/item/weapon/stock_parts/capacitor/ = 2)
