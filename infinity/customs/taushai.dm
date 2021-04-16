// Field Engineer
/obj/item/clothing/shoes/sandal/xeno/caligae/taushai
	name = "Tajaran workboots"
	desc = "Just workboots, seems this for Tajara."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_shoes_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = 'infinity/icons/customs/infinity_custom_guns_slot_r_hand.dmi',
		slot_l_hand_str = 'infinity/icons/customs/infinity_custom_guns_slot_l_hand.dmi',
	)
	icon_state = "taushai_taj_boots"
	item_state = "taushai_taj_boots"
	trade_blacklisted = TRUE


/obj/item/clothing/suit/storage/hooded/taushai
	name = "Common cloak"
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
	name = "Cloak hood"
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


/obj/item/weapon/storage/backpack/taushai
	name = "field backpack"
	desc = "It's a tough backpack for the daily grind of field work."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB)
	icon_state = "taushai_taj_backpack"
	item_state = "taushai_taj_backpack"
	trade_blacklisted = TRUE


/obj/item/device/kit/suit/taushai
	name = "Rajirra's voidsuit modification kit"
	desc = "A kit for modifying a voidsuit."
	uses = 2
	new_icon_file = CUSTOM_ITEM_OBJ
	new_mob_icon_file = CUSTOM_ITEM_MOB
	new_name = "Field engineer"
	new_desc = "An older protective voidsuit used for field work."
	new_icon = "taushai_taj_field_engineer"
	trade_blacklisted = TRUE


/obj/item/weapon/clothingbag/taushai
	name = "Clothing bag"
	desc = "Rajirra's property"
	trade_blacklisted = TRUE


/obj/item/weapon/clothingbag/taushai/New()
	..()
	new /obj/item/clothing/shoes/sandal/xeno/caligae/taushai(src)
	new /obj/item/clothing/suit/storage/hooded/taushai(src)
	new /obj/item/weapon/storage/backpack/taushai(src)
	new /obj/item/device/kit/suit/taushai(src)
