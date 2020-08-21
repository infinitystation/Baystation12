//	Hephaestus_outfit
/obj/item/clothing/mask/gas/half/rivalmask
	name = "thermal cover"
	desc = "A close-fitting mask with a single tear in the middle."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rivalmask_obj"
	item_state = "rivalmask"
	item_icons = list(slot_wear_mask_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/suit/storage/rivalcoat
	name = "hazard greatcoat"
	desc = "A large coat made of tarp-like material held together by a synthfiber layering and dotted with various hazard labels. An organic, almost heart-like cooling device is fit to the chest."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rivalcoat_obj"
	item_state = "rivalcoat"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	sprite_sheets = list()
	slots = 2
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_C)
	species_restricted = list(SPECIES_IPC)
	trade_blacklisted = TRUE

/obj/item/clothing/under/rank/security/rivalpants
	name = "dark slacks"
	desc = "Tight-fitting military-styled slacks held up on a sturdy green belt, shirt not included. Where you're going, you won't need one."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rivalpants_obj"
	item_state = "rivalpants"
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	worn_state = null
	body_parts_covered = LOWER_TORSO|LEGS
	trade_blacklisted = TRUE

/obj/item/clothing/gloves/thick/duty/rivalgloves
	name = "thick fingerless gloves"
	desc = "A pair of hard-knuckled synthleather gloves."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rivalgloves_obj"
	item_state = "rivalgloves"
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/jackboots/heph_boots/rivalboots
	name = "polished jackboots"
	desc = "A pair of steel-toed boots, a thunderous stomp accompanying each heavy step."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "rivalboots_obj"
	item_state = "rivalboots"
	species_restricted = list(SPECIES_IPC)
	trade_blacklisted = TRUE

/obj/item/weapon/clothingbag/rivalset
	name = "outfit delivery package"
	desc = "A utility bag stamped with a Hephaestus logo and a 'prototype' warning label."

/obj/item/weapon/clothingbag/rivalset/New()
	..()
	new /obj/item/clothing/mask/gas/half/rivalmask(src)
	new /obj/item/clothing/suit/storage/rivalcoat(src)
	new /obj/item/clothing/under/rank/security/rivalpants(src)
	new /obj/item/clothing/gloves/thick/duty/rivalgloves(src)
	new /obj/item/clothing/shoes/jackboots/heph_boots/rivalboots(src)

//	dEUS VULT
/obj/item/clothing/head/helmet/space/void/pilot/adro
	name = "Knight helmet"
	desc = "This helmet look like part of ancient armor, but this one from Avalon and has hight-teck technologies, wich makes it more easier to wear and support HUDs."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adro_knight_helmet"
	item_state = "adro_knight_helmet"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/suit/space/void/pilot/adro
	name = "Knight armor"
	desc = "Personal metall armor with parts of hydraulic mechanism inside, they make this armor easier to wear and support their owner in all situations"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "adro_knight_suit"
	item_state = "adro_knight_suit"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

	helmet = /obj/item/clothing/head/helmet/space/void/pilot/adro
