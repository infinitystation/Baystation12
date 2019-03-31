/obj/item/weapon/circuitboard/telesci_pad
	name = T_BOARD("telepad")
	build_path = "/obj/machinery/telepad"
	board_type = "machine"
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 4)
	req_components = list(
							/obj/item/bluespace_crystal = 2,
							/obj/item/weapon/stock_parts/capacitor = 1,
							/obj/item/stack/cable_coil = 1,
							/obj/item/weapon/stock_parts/console_screen = 1)