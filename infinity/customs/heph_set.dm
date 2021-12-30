/obj/item/clothing/head/heph_hat
	name = "dark fedora"
	desc = "A stylish fedora. Looks easy to knock off."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "heph_hat"
	item_state = "heph_hat"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/suit/storage/heph_coat
	name = "large coat"
	desc = "The Mk. X Heat-Exchange Coat - a stylish garment tailored for Hephaestus's IPC employees, with internal pockets for armor plates to protect their vital parts. Makes you look big."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "heph_coat"
	item_state = "heph_coat"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	sprite_sheets = list()
	slots = 2
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_C)
	species_restricted = list(SPECIES_IPC)
	trade_blacklisted = TRUE

/obj/item/clothing/under/rank/security/heph_pants
	name = "gray slacks"
	desc = "Tight-fitting military-styled slacks held up on a sturdy green belt. Shirt not included."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "heph_pants"
	item_state = "heph_pants"
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	worn_state = null
	body_parts_covered = LOWER_TORSO|LEGS
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/jackboots/heph_boots
	name = "polished boots"
	desc = "A pair of heavy synthleather boots. They'll hear you coming."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "heph_boots"
	item_state = "heph_boots"
	var/footstep = 1
	species_restricted = list(SPECIES_IPC)  //ИС - по флавору иное строение ступней; ООС - предотвращение кражи обуви некоторыми личностями ради спама звуком. Вы знете кто вы.
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/jackboots/heph_boots/handle_movement(var/turf/walking, var/running)
	if(running)
		if(footstep >= 2)
			footstep = 0
			playsound(src, "heavystep", 50, 1) // this will get annoying very fast.
		else
			footstep++
	else
		playsound(src, "heavystep", 20, 1)

/obj/item/clothingbag/heph_set
	name = "uniform package"
	desc = "A utility bag stamped with a Hephaestus logo."
	New()
		new /obj/item/clothing/head/heph_hat(src)
		new /obj/item/clothing/suit/storage/heph_coat(src)
		new /obj/item/clothing/under/rank/security/heph_pants(src)
		new /obj/item/clothing/shoes/jackboots/heph_boots(src)
