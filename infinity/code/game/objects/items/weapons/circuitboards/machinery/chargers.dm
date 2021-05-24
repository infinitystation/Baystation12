/obj/item/stock_parts/circuitboard/cell_charger
	name = T_BOARD("cell charger")
	board_type = "machine"
	origin_tech = list(TECH_POWER = 1, TECH_ENGINEERING = 1)
	build_path = /obj/machinery/cell_charger
	req_components = list(
		/obj/item/stock_parts/capacitor/ = 1
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/recharger
	name = T_BOARD("recharger")
	board_type = "machine"
	origin_tech = list(TECH_POWER = 3, TECH_ENGINEERING = 2)
	build_path = /obj/machinery/recharger
	req_components = list(
		/obj/item/stock_parts/capacitor/ = 2
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/wallcharger
	name = T_BOARD("wall recharger")
	board_type = "machine"
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 2)
	build_path = /obj/machinery/recharger/wallcharger
	req_components = list(
		/obj/item/stock_parts/capacitor/ = 2
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
	)
