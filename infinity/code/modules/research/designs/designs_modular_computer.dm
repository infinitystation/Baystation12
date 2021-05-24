/datum/design/item/modularcomponent/battery/lambda
	name = "lambda battery module"
	id = "bat_lambda"
	req_tech = list(TECH_POWER = 7, TECH_ENGINEERING = 6)
	materials = list(MATERIAL_STEEL = 3200)
	build_path = /obj/item/stock_parts/computer/battery_module/lambda
	sort_string = "VBAEK"

/datum/design/item/modularcomponent/netcard/lambda
	name = "lambda network card"
	id = "netcard_lambda"
	req_tech = list(TECH_DATA = 5, TECH_ENGINEERING = 4, TECH_BLUESPACE = 5)
	build_type = IMPRINTER
	materials = list(MATERIAL_STEEL = 500, MATERIAL_GLASS = 400)
	chemicals = list(/datum/reagent/acid = 20)
	build_path = /obj/item/stock_parts/computer/network_card/lambda
	sort_string = "VBABD"
