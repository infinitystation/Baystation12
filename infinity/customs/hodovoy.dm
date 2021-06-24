/obj/item/clothing/suit/storage/hooded/hodovoy
	name = "bio-protected operational medical suit"
	desc = "Futuristic Medical Chemical and Biological Protection Suit for Surgery."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	icon_state = "hodovoy_suit"
	item_state = "hodovoy_suit"
	item_state_slots = list(
		slot_wear_suit_str = "hodovoy_suit",
	)
	hoodtype = /obj/item/clothing/head/hodovoy
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS|HANDS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = FIRESUIT_MAX_PRESSURE
	item_flags = ITEM_FLAG_THICKMATERIAL
	allowed = list(
		/obj/item/pen,/obj/item/paper,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/storage/box/matches,
		/obj/item/reagent_containers/food/drinks/flask,
		/obj/item/device/flashlight,
		/obj/item/tank,
		/obj/item/shovel/custom_multishowel,
		/obj/item/pickaxe/silver/custom_multishowel,
		/obj/item/crowbar/custom_multishowel)
	flags_inv = HIDEJUMPSUIT
	valid_accessory_slots = list(
		ACCESSORY_SLOT_UTILITY, ACCESSORY_SLOT_HOLSTER,
		ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK,
		ACCESSORY_SLOT_DEPT, ACCESSORY_SLOT_DECOR,
		ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_OVER)
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bio = ARMOR_BIO_SHIELDED,
		)
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	permeability_coefficient = 0.01
	germ_level = 0
	trade_blacklisted = TRUE
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/hodovoy


/obj/item/clothing/head/hodovoy
	name = "bio-protected operational medical hood"
	desc = "Futuristic Medical Chemical and Biological Protection Hood for Surgery."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "hodovoy_hood"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state = "hodovoy_hood"
	body_parts_covered = HEAD
	item_flags = ITEM_FLAG_THICKMATERIAL
	flags_inv = HIDEEARS | BLOCKHAIR
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = FIRESUIT_MAX_PRESSURE
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		bio = ARMOR_BIO_SHIELDED,
		)
	heat_protection = HEAD
	canremove = 0
	trade_blacklisted = TRUE


/obj/item/clothing/mask/hodovoy
	name = "bio-protected operational medical mask"
	desc = "Futuristic Medical Chemical and Biological Protection Mask for Surgery."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB
	)
	icon_state = "hodovoy_mask"
	item_state = "hodovoy_mask"
	item_flags = ITEM_FLAG_AIRTIGHT|ITEM_FLAG_FLEXIBLEMATERIAL|ITEM_FLAG_THICKMATERIAL
	w_class = ITEM_SIZE_SMALL
	gas_transfer_coefficient = 0.10
	permeability_coefficient = 0.50
	down_gas_transfer_coefficient = 1
	down_body_parts_covered = null
	down_item_flags = ITEM_FLAG_THICKMATERIAL
	down_icon_state = "hodovoy_mask_down"
	pull_mask = 1
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	max_pressure_protection = FIRESUIT_MAX_PRESSURE


/obj/item/clothingbag/hodovoy
	name = "clothbag"
	desc = "Bio-protected Operational Medical Suit"
	trade_blacklisted = TRUE


/obj/item/clothingbag/hodovoy/Initialize()
	. = ..()
	new /obj/item/clothing/suit/storage/hooded/hodovoy(src)
	new /obj/item/clothing/mask/hodovoy(src)
