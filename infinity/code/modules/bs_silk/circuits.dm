/obj/item/weapon/stock_parts/circuitboard/bssilk_cons
	name = T_BOARD("bluespace snare console")
	origin_tech = list(TECH_DATA = 4, TECH_BLUESPACE = 6)
	build_path = /obj/machinery/computer/bssilk_control

/obj/item/weapon/stock_parts/circuitboard/bssilk_hub
	name = T_BOARD("bluespace snare hub")
	origin_tech = list(TECH_DATA = 4, TECH_BLUESPACE = 6)
	build_path = /obj/machinery/bssilk_hub
	req_components = list(
		/obj/item/bluespace_crystal = 2,
		/obj/item/weapon/stock_parts/capacitor/super = 2,
		/obj/item/stack/cable_coil = 1,
		/obj/item/weapon/stock_parts/subspace/crystal = 1
	)
	board_type = "machine"
	additional_spawn_components = list(
		/obj/item/weapon/stock_parts/console_screen = 1,
		/obj/item/weapon/stock_parts/power/apc/buildable = 1
	)
