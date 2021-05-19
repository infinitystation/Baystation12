/obj/item/stock_parts/circuitboard/teleporter_pad // Требуется переделка компонентов в этом файле ~bear1ake
	name = T_BOARD("teleporter pad")
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 4, TECH_POWER =5 , TECH_BLUESPACE = 4)
	build_path = /obj/machinery/tele_pad
	req_components = list(
		/obj/item/stock_parts/micro_laser/ultra = 4,
		/obj/item/bluespace_crystal/artificial = 4
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/teleporter_projector
	name = T_BOARD("teleporter projector")
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 4, TECH_DATA = 4, TECH_BLUESPACE = 4)
	build_path = /obj/machinery/tele_projector
	req_components = list(
		/obj/item/stock_parts/manipulator/pico = 1,
		/obj/item/stock_parts/scanning_module/phasic = 2,
		/obj/item/stock_parts/subspace/filter = 1,
		/obj/item/stock_parts/subspace/analyzer = 1,
		/obj/item/stock_parts/subspace/transmitter = 1
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)
