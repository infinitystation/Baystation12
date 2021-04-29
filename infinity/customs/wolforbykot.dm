/obj/item/clothing/suit/armor/pcarrier/medium/nt/wolforbykot
	name = "old army overcoat"
	desc = "An old Gaian Conflict-era GCC shocktroop coat. \
			Worn, but well-maintained, with armor plates woven in at vital points. \
			Straps with bright-red identification marks sit at the shoulders, \
			and a two-headed eagle spreads its gilded wings across the wearer's back."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB,
					  slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					  slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	icon_state = "kegancoat"
	item_state = "kegancoat"
	starting_accessories = list()
	body_parts_covered = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	trade_blacklisted = TRUE


/obj/item/clothing/head/helmet/ballistic/wolforbykot
	name = "GSFH-2"
	desc = "Closed helmet harking back to times of bloody war, a fearful visage of foreign special forces. \
			Contains an IFF-enabled HUD, but an obvious shot mark on the right side of the plating has long \
			since disabled any electronics beyond hope of repair. Its built-in air filtration system persists yet."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB,
					  slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					  slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	item_state_slots = list(slot_l_hand_str = "keganhelmet",
							slot_r_hand_str = "keganhelmet",)
	icon_state = "keganhelmet"
	item_state = "keganhelmet"
	flags_inv = HIDEFACE | HIDEEYES | HIDEEARS | BLOCKHAIR
	body_parts_covered = HEAD | FACE | EYES
	item_flags = ITEM_FLAG_AIRTIGHT
	trade_blacklisted = TRUE


/obj/item/weapon/storage/backpack/wolforbykot
	name = "CAB"
	desc = "A waist-slung Gaian shocktroop bag. Compact and roomy."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB,
					  slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					  slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	item_state_slots = list(slot_l_hand_str = "keganbackpack",
							slot_r_hand_str = "keganbackpack",)
	icon_state = "keganbackpack"
	item_state = "keganbackpack"
	trade_blacklisted = TRUE


/obj/item/clothing/gloves/thick/duty/wolforbykot
	name = "fingerless gloves"
	desc = "A pair of sturdy fingerless gloves. The hard knuckles bear many a stain."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	icon_state = "kegangloves"
	item_state = "kegangloves"
	trade_blacklisted = TRUE


/obj/item/weapon/clothingbag/wolforbykot
	name = "clothing bag"
	desc = "Rajirra's property"
	trade_blacklisted = TRUE

/obj/item/weapon/clothingbag/wolforbykot/New()
	..()
	new /obj/item/clothing/head/helmet/ballistic/wolforbykot(src)
	new /obj/item/clothing/suit/armor/pcarrier/medium/nt/wolforbykot(src)
	new /obj/item/clothing/gloves/thick/duty/wolforbykot(src)
	new /obj/item/weapon/storage/backpack/wolforbykot(src)
