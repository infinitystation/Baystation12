/obj/item/clothing/suit/armor/pcarrier/troops
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches)

/obj/item/clothing/suit/armor/pcarrier/troops/heavy
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/armguards, /obj/item/clothing/accessory/legguards, /obj/item/clothing/accessory/storage/pouches)

/obj/item/clothing/suit/armor/pcarrier/troops/heavy/pcrc
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/armguards, /obj/item/clothing/accessory/legguards, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/pcrc)

/obj/item/clothing/suit/armor/pcarrier/green/heavy_saare
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/armguards/green, /obj/item/clothing/accessory/legguards/green, /obj/item/clothing/accessory/storage/pouches/green, /obj/item/clothing/accessory/armor/tag/saare)

/obj/item/clothing/suit/armor/pcarrier/tactical
	name = "tactical plate carrier"
	desc = "A heavy plate carrier. It can be equipped with armor plates, but provides no protection of its own."
	icon = INF_SPRITE_OBJ_CLOTHING_SUIT
	item_icons = list(slot_wear_suit_str = INF_SPRITE_ONMOB_CLOTHING_SUIT)
	icon_state = "pcarrier_tac"
	starting_accessories = list(
		/obj/item/clothing/accessory/armorplate/tactical,
		/obj/item/clothing/accessory/armguards/tactical,
		/obj/item/clothing/accessory/legguards/tactical)

/obj/item/clothing/suit/storage/leather_jacket/armored
	desc = "A black leather coat. It is reinforced with some armor plates..."
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED,
	)

/obj/item/clothing/suit/armor/pcarrier/merc
	name = "heavy plate carrier"
	desc = "A heavy red and black plate carrier. It can be equipped with armor plates, but provides no protection of its own."
	icon = INF_SPRITE_OBJ_CLOTHING_SUIT
	item_icons = list(slot_wear_suit_str = INF_SPRITE_ONMOB_CLOTHING_SUIT)
	icon_state = "pcarrier_merc"
	starting_accessories = list(
		/obj/item/clothing/accessory/armorplate/merc,
		/obj/item/clothing/accessory/armguards/merc,
		/obj/item/clothing/accessory/legguards/merc,
		/obj/item/clothing/accessory/storage/pouches)
