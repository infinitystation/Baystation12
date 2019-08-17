#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/weapon/stock_parts/circuitboard/crusher
	name = T_BOARD("crusher")
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 3, TECH_MATERIALS = 3)
	build_path = /obj/machinery/crusher_base
	req_components = list(
		/obj/item/weapon/stock_parts/matter_bin = 3,
		/obj/item/weapon/stock_parts/manipulator = 3,
		/obj/item/weapon/reagent_containers/glass/beaker = 3
	)
	additional_spawn_components = list(
		/obj/item/weapon/stock_parts/power/apc/buildable = 1
	)

/obj/item/weapon/stock_parts/circuitboard/pile_ripper
	name = T_BOARD("pile ripper")
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 3)
	build_path = /obj/machinery/pile_ripper
	req_components = list(
		/obj/item/weapon/stock_parts/manipulator = 1
	)
	additional_spawn_components = list(
		/obj/item/weapon/stock_parts/power/apc/buildable = 1
	)

/obj/item/weapon/stock_parts/circuitboard/recycler
	name = T_BOARD("recycler")
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 3)
	build_path = /obj/machinery/recycler
	req_components = list(
		/obj/item/weapon/stock_parts/manipulator = 1
	)
	additional_spawn_components = list(
		/obj/item/weapon/stock_parts/power/apc/buildable = 1
	)

