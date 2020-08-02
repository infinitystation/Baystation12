/obj/item/clothing/accessory/locket/custom/asriel_locket
	name = "dark locket"
	desc = "Dark locket with a photo within. On the photo, you can see two siblings: One is a tall well-built man with white hair, the other is a short thin girl with same haircolour. They seem to be happy."
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "asriel_locket"
	held = ""
	message = "\"Be safe, bro)! From Alisa\""
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/riot/custom_asriel
	name = "rogue knight helmet"
	desc = "A black, somewhat rusty-looking helmet with some unreadable markings and words on it."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "asriel_helmet"
	body_parts_covered = HEAD
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED
		)
	trade_blacklisted = TRUE
