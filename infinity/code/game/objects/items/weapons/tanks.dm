/obj/item/tank/phoron/full
	name = "phoron tank"
	desc = "Contains dangerous phoron. Do not inhale. Warning: extremely flammable."
	icon_state = "phoron"
	gauge_icon = null
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null	//they have no straps!
	starting_pressure = list(GAS_PHORON = 10 * ONE_ATMOSPHERE)


/obj/item/tank/flammable
	name = "flammable mix tank"
	icon_state = "emergency_double"
	gauge_icon = "indicator_emergency_double"
	volume = 120
	w_class = ITEM_SIZE_NORMAL
	starting_pressure = list(GAS_PHORON = 6 * ONE_ATMOSPHERE, GAS_OXYGEN = 2 * ONE_ATMOSPHERE)
