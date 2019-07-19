/obj/item/weapon/circuitboard/bssilk
	icon = 'icons/obj/module.dmi'
	icon_state = "mainboard"
	item_state = "electronic"
	origin_tech = list(TECH_DATA = 4, TECH_BLUESPACE = 6)
	w_class = ITEM_SIZE_SMALL
	obj_flags = OBJ_FLAG_CONDUCTIBLE




/obj/item/weapon/circuitboard/bssilk/console
	name = T_BOARD("bluespace snare console")
	build_path = /obj/machinery/computer/bssilk_control



/obj/item/weapon/circuitboard/bssilk/hub
	name = T_BOARD("bluespace snare hub")
	build_path = /obj/machinery/bssilk_hub
	req_components = list(
						/obj/item/bluespace_crystal = 2,
						/obj/item/weapon/stock_parts/capacitor/super = 2,
						/obj/item/stack/cable_coil = 1,
						/obj/item/weapon/stock_parts/subspace/crystal = 1
						)
	board_type = "machine"