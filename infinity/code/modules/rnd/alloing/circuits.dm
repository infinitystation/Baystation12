/obj/item/weapon/stock_parts/circuitboard/alloyer
	name = T_BOARD("atomic furnace")
	build_path = /obj/machinery/alloyer
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 3)
	req_components = list(
		/obj/item/weapon/stock_parts/manipulator/nano = 3,
		/obj/item/weapon/stock_parts/matter_bin = 2)
	additional_spawn_components = list(
		/obj/item/weapon/stock_parts/keyboard = 1,
		/obj/item/weapon/stock_parts/power/apc/buildable = 1)