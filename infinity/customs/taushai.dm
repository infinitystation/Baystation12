// Field Engineer
/obj/item/clothing/shoes/sandal/xeno/caligae/taushai
	name = "tajaran workboots"
	desc = "Just workboots, seems this for Tajara."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_shoes_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	icon_state = "taushai_taj_boots"
	item_state = "taushai_taj_boots"
	trade_blacklisted = TRUE


/obj/item/clothing/suit/storage/hooded/taushai
	name = "common cloak"
	desc = "Tajar cloak, in the inner side there are small pockets for carrying small things, fashionable, but nothing special."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "taushai_taj_cloak"
	item_state = "taushai_taj_cloak"
	action_button_name = "Toggle Hood"
	flags_inv = HIDETAIL
	trade_blacklisted = TRUE
	hoodtype = /obj/item/clothing/head/taushai


/obj/item/clothing/head/taushai
	name = "cloak hood"
	desc = "A hood attached to cloak."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "taushai_taj_cloak"
	item_state = "taushai_taj_cloak_hood"
	body_parts_covered = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR
	trade_blacklisted = TRUE


/obj/item/clothing/suit/storage/hooded/taushai/on_update_icon()
	if(suittoggled)
		item_state_slots = list(
			slot_wear_suit_str = "taushai_taj_cloak_t",
		)
	else
		item_state_slots = list(
			slot_wear_suit_str = "taushai_taj_cloak",
		)


/obj/item/storage/backpack/industrial/taushai
	name = "field backpack"
	desc = "It's a tough backpack for the daily grind of field work."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB)
	icon_state = "taushai_taj_backpack"
	item_state = "taushai_taj_backpack"
	trade_blacklisted = TRUE


/obj/item/device/kit/suit/taushai
	name = "taj scavenger's voidsuit modification kit"
	desc = "A kit for modifying a voidsuit."
	uses = 2
	new_icon_file = CUSTOM_ITEM_OBJ
	new_mob_icon_file = CUSTOM_ITEM_MOB
	new_name = "scavenger"
	new_desc = "An older protective voidsuit used for field work."
	new_icon = "taushai_taj_field_engineer"
	trade_blacklisted = TRUE


/obj/item/clothingbag/taushai
	name = "clothing bag"
	desc = "Tajaran scavenger's property"
	trade_blacklisted = TRUE


/obj/item/clothingbag/taushai/New()
	..()
	new /obj/item/clothing/shoes/sandal/xeno/caligae/taushai(src)
	new /obj/item/clothing/suit/storage/hooded/taushai(src)
	new /obj/item/storage/backpack/industrial/taushai(src)
	new /obj/item/device/kit/suit/taushai(src)
