/obj/item/stock_parts/circuitboard/emitter
	name = T_BOARD("emitter")
	board_type = "machine"
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 3)
	build_path = /obj/machinery/power/emitter
	req_components = list(
		/obj/item/stock_parts/capacitor/ = 2,
		/obj/item/stock_parts/micro_laser/ = 3
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/rad_collector
	name = T_BOARD("radiation collector array")
	board_type = "machine"
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 4, TECH_PHORON = 3)
	build_path = /obj/machinery/power/rad_collector
	req_components = list(
		/obj/item/stock_parts/manipulator/ = 2,
		/obj/item/stock_parts/capacitor/ = 2
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/bluespacedrive
	name = T_BOARD("bluespacedrive")
	build_path = /obj/machinery/bluespacedrive
	board_type = "machine"
	origin_tech = list(TECH_BLUESPACE = 8, TECH_DATA = 5)
	req_components = list(
							/obj/item/stack/cable_coil = 30,
							/obj/item/stock_parts/manipulator = 1,
							/obj/item/stock_parts/subspace/filter = 2,
							/obj/item/stock_parts/subspace/crystal = 4
						  )
