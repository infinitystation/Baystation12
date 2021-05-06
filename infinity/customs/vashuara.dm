/obj/item/material/knife/folding/custom_vashuara
	name = "Aikuti knife"
	desc = "A custom knife with wooden scabbard and handle. The handle and scabbard are inlaid with brass inserts. \
	The Damascus steel blade is engraved and looks quite sharp."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "vashura_knife"
	takes_colour = FALSE
	hardware_open = "vashura_knife_open"
	hardware_closed = "vashura_knife"
	handle_icon = "vashura_knife"
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/riot/custom_vashuara
	name = "Crying Knight helmet"
	desc = "An uncommon reinforced headgear with attached ballistic mask to it. \
	The ballistic mask seems to be made to order."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "vashura_helmet"
	body_parts_covered = HEAD
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED
		)
	trade_blacklisted = TRUE

/obj/item/custkit/vashara_helmet
	name = "helmet customization kit"
	input = /obj/item/clothing/head/helmet/nt
	output = /obj/item/clothing/head/helmet/riot/custom_vashuara
