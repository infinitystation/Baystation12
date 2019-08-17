/datum/design/circuit/telesci_console
	name = "telepad control console"
	id = "telesci_console"
	req_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 2)
	build_path = /obj/item/weapon/stock_parts/circuitboard/telesci_console
	sort_string = "HAAAD"

/datum/design/circuit/telepad
	name = "telepad board"
	id = "telepad"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 4)
	build_path = /obj/item/weapon/stock_parts/circuitboard/telesci_pad
	sort_string = "HAAAF"

/datum/design/circuit/bs_silk_control
	name = "bluespace snare control"
	id = "bsc"
	req_tech = list(TECH_BLUESPACE = 5, TECH_DATA = 4)
	build_path = /obj/item/weapon/stock_parts/circuitboard/bssilk_cons
	sort_string = "KCAAH"

/datum/design/circuit/bs_silk_hub
	name = "bluespace snare hub"
	id = "bsh"
	req_tech = list(TECH_BLUESPACE = 5, TECH_DATA = 4)
	build_path = /obj/item/weapon/stock_parts/circuitboard/bssilk_hub
	sort_string = "KCAAI"

	/obj/machinery/teleport/hub

	/obj/machinery/recharger

	/obj/machinery/recharger/wallcharger

	/obj/machinery/cell_charger