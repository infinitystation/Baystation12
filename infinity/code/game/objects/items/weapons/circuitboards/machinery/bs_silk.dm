/obj/item/weapon/stock_parts/circuitboard/bssilk_hub
	name = T_BOARD("bluespace snare hub")
//	icon = 'icons/obj/module.dmi'
//	icon_state = "mainboard"
//	item_state = "electronic"
//	w_class = ITEM_SIZE_SMALL
//	obj_flags = OBJ_FLAG_CONDUCTIBLE
	build_path = /obj/machinery/bssilk_hub
	origin_tech = list(TECH_DATA = 4, TECH_BLUESPACE = 6)
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
