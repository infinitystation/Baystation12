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

//  Ares Price - gaiaset
/obj/item/clothing/suit/storage/hodovoy_fleet
	name = "SCG fleet officer's service jacket"
	desc = "A navy blue SCG Fleet dress jacket with silver accents."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "hodovoy_price_off_jacket"
	item_state = "hodovoy_price_off_jacket"
	body_parts_covered = UPPER_TORSO | ARMS
	allowed = list(
		/obj/item/tank/emergency,
		/obj/item/device/flashlight,
		/obj/item/pen,
		/obj/item/clothing/head/soft,
		/obj/item/clothing/head/beret,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/flame/lighter,
		/obj/item/device/taperecorder,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio,
		/obj/item/taperoll
	)
	valid_accessory_slots = list(
		ACCESSORY_SLOT_ARMBAND,
		ACCESSORY_SLOT_MEDAL,
		ACCESSORY_SLOT_INSIGNIA,
		ACCESSORY_SLOT_RANK,
		ACCESSORY_SLOT_DEPT,
		ACCESSORY_SLOT_DECOR,
		ACCESSORY_SLOT_OVER
	)
	trade_blacklisted = TRUE

/obj/item/clothing/under/hodovoy_fleet
	name = "SCG fleet officer's uniform"
	desc = "A service uniform of some kind."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "hodovoy_price_off_under"
	item_state = "hodovoy_price_off_under"
	rolled_sleeves = 0
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/ranks_hodovoy_fleet
	name = "SCG fleet ranks (O-6 captain)"
	desc = "Sparkling gold shoulder straps of a fleet captain"
	icon_state = "hodovoy_price_off_jacket_fleetrank"
	item_state = "hodovoy_price_off_jacket_fleetrank"
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	w_class = ITEM_SIZE_TINY
	on_rolled = list("down" = "none")
	slot = ACCESSORY_SLOT_RANK
	high_visibility = 1
	trade_blacklisted = TRUE

/obj/item/clothing/head/hodovoy_fleet
	name = " SCG fleet officer's peaked cap"
	desc = "A peaked black uniform cap. This one is trimmed in gold."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "hodovoy_price_off_cap"
	item_state = "hodovoy_price_off_cap"
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/medal_hodovoy_fleet
	name = "solar honor medal"
	desc = "Gold medal of a veteran officer for bravery during the conflict on Gaia.  Only real heroes received such an award."
	icon_state = "hodovoy_price_off_medal"
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	slot = ACCESSORY_SLOT_MEDAL
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/cloak/hodovoy_fleet
	name = "SCG fleet officer's navy pea jacket"
	desc = "The captain's Navy pea jacket, with the captain's distinctive signs. \
			It consists of expensive strong materials. \
			This pea jacket elevates the wearer above his subordinates with all its appearance."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "hodovoy_price_off_cloak"
	item_state = "hodovoy_price_off_cloak"
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	trade_blacklisted = TRUE

/obj/item/clothingbag/hodovoy_fleet
	name = "clothbag"
	desc = "true SCG hero"
	trade_blacklisted = TRUE

/obj/item/clothingbag/hodovoy_fleet/Initialize()
	. = ..()
	new /obj/item/clothing/accessory/cloak/hodovoy_fleet(src)
	new /obj/item/clothing/accessory/medal_hodovoy_fleet(src)
	new /obj/item/clothing/accessory/ranks_hodovoy_fleet(src)
	new /obj/item/clothing/head/hodovoy_fleet(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/suit/storage/hodovoy_fleet(src)
	new /obj/item/clothing/under/hodovoy_fleet(src)


//Еще один мед-сет

/obj/item/clothing/suit/storage/hooded/hodovoy/armor
	name = "NT Сomfortable Lightweight Medical Suit"
	desc = "Very technological and futuristic NT Сomfortable Lightweight Medical suit for shift work on a spacecraft made of strong ultra-light materials. Very convenient, a medic's dream!"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	icon_state = "hodovoy_a"
	item_state = "hodovoy_a"
	item_state_slots = list(
		slot_wear_suit_str = "hodovoy_a",
	)
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		bio = ARMOR_BIO_SHIELDED,
		)
	hoodtype = /obj/item/clothing/head/hodovoy/armor
	trade_blacklisted = TRUE

/obj/item/clothing/head/hodovoy/armor
	name = "NT Сomfortable Lightweight Medical Helmet"
	desc = "Very technological and futuristic NT Сomfortable Lightweight Medical helmet for shift work on a spacecraft made of strong ultra-light materials. Very convenient, a medic's dream!"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "hodovoy_ah"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state = "hodovoy_ah"
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_AIRTIGHT
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		bio = ARMOR_BIO_SHIELDED,
		)
	canremove = 0
	trade_blacklisted = TRUE
