/obj/machinery/fabricator/coin
	name = "coinmachine"
	desc = "It produces coins from materials"
	icon = 'icons/obj/machines/fabricators/autolathe.dmi'
	icon_state = "autolathe"
	idle_power_usage = 15
	active_power_usage = 2000
	fabricator_class = FABRICATOR_CLASS_COIN
	base_storage_capacity = list(
		/material/iron =     25000,
		/material/gold = 25000,
		/material/silver =     25000,
		/material/diamond =   25000,
		/material/uranium =   25000,
		/material/platinum =   25000,
		/material/phoron =   25000,
	)
	machine_name = "coinmachine"
	machine_desc = "Industrial machine which can produce coins from materials"
