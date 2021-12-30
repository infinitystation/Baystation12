/obj/item/clothing/suit/storage/explanded_comm_cloak
	name = "old fleet commisar coat"
	desc = "Old and time-worn cloak with a belt, decorated inside with insulated red velvet, and on the outside with gold buttons and a belt plate made of the same material "
	icon = CUSTOM_ITEM_OBJ
	icon_state = "expladed_commcloak"
	item_state = "expladed_commcloak"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	sprite_sheets = list()
	slots = 2
	valid_accessory_slots = list(, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L, ACCESSORY_SLOT_ARMOR_C)
	trade_blacklisted = TRUE

/obj/item/clothing/head/beret/explanded_comm_cap
	name = "old fleet commisar cap"
	desc = "An ancient shabby high cap, covered with red velvet from the inside. The officer's cord and cockade depicting a diving eagle are made of gold. It instills in you a true fear and unprincipled loyalty to your cause. "
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	icon_state = "explanded_commcap"
	item_state = "explanded_commcap"
	trade_blacklisted = TRUE

/obj/item/clothingbag/explanded_comm_set
	name = "uniform package"
	desc = "An utility bag stamped with a strange logo."

/obj/item/clothingbag/explanded_comm_set/Initialize()
	. = ..()
	new /obj/item/clothing/suit/storage/explanded_comm_cloak(src)
	new /obj/item/clothing/head/beret/explanded_comm_cap(src)
