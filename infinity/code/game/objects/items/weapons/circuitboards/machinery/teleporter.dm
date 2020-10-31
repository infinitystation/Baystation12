/obj/item/weapon/stock_parts/circuitboard/teleporter_hub
	name = T_BOARD("teleporter hub")
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 4, TECH_POWER =5 , TECH_BLUESPACE = 4)
	build_path = /obj/machinery/teleport/hub
	req_components = list(
		/obj/item/weapon/stock_parts/micro_laser/ultra = 4,
		/obj/item/bluespace_crystal/artificial = 4
	)
	additional_spawn_components = list(
		/obj/item/weapon/stock_parts/keyboard = 1,
		/obj/item/weapon/stock_parts/power/apc/buildable = 1
	)

/obj/item/weapon/stock_parts/circuitboard/teleporter_station
	name = T_BOARD("teleporter station")
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 4, TECH_DATA = 4, TECH_BLUESPACE = 4)
	build_path = /obj/machinery/teleport/station
	req_components = list(
		/obj/item/weapon/stock_parts/manipulator/pico = 1,
		/obj/item/weapon/stock_parts/scanning_module/phasic = 2,
		/obj/item/weapon/stock_parts/subspace/filter = 1,
		/obj/item/weapon/stock_parts/subspace/analyzer = 1,
		/obj/item/weapon/stock_parts/subspace/transmitter = 1
	)
	additional_spawn_components = list(
		/obj/item/weapon/stock_parts/console_screen = 1,
		/obj/item/weapon/stock_parts/keyboard = 1,
		/obj/item/weapon/stock_parts/power/apc/buildable = 1
	)
