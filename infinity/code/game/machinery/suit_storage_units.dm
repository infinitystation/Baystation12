/obj/machinery/suit_storage_unit/emag_act()
	if(!emagged)
		emagged = TRUE
		safetieson = 0
		return 1

/obj/machinery/suit_storage_unit/security/sapper
	name = "Sapper Voidsuit Storage Unit"
	suit = /obj/item/clothing/suit/space/void/sapper/prepared
