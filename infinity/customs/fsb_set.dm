/obj/item/clothing/mask/balaclava/fsb
	name = "balaclava"
	desc = "Covers the head, forehead and face, leaving a small slit for the eyes."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "fsb_mask"
	item_state = "fsb_mask"
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB
		)
	sprite_sheets = list()
	pull_mask = 0
	trade_blacklisted = TRUE

/obj/item/clothing/under/rank/security/fsb
	name = "military uniform"
	desc = "Military uniform, very suitable for conducting military operations"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "fsb_uniform"
	item_state = "fsb_uniform"
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB
		)
	worn_state = null
	trade_blacklisted = TRUE

/obj/item/clothing/suit/armor/pcarrier/fsb
	name = "tunic"
	desc = "Ordinary clothing special team."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "fsb_suit"
	item_state = "fsb_suit"
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB
		)
	sprite_sheets = list()
	trade_blacklisted = TRUE

/obj/item/clothing/gloves/thick/fsb
	icon = CUSTOM_ITEM_OBJ
	icon_state = "fsb_gloves"
	item_state = "fsb_gloves"
	item_icons = list(
		slot_gloves_str = CUSTOM_ITEM_MOB
		)
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/nt/fsb
	name = "altyn"
	desc = "Head-covering airtight helmet. It appears that it is holded together by some magnetic mechanism."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "fsb_helmet"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	item_flags = ITEM_FLAG_AIRTIGHT|ITEM_FLAG_THICKMATERIAL
	body_parts_covered = FACE|EYES|HEAD
	trade_blacklisted = TRUE

/obj/item/storage/backpack/baul
	name = "baul"
	desc = "Comfortable bag and pouches to it, fixed straps."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "fsb_backpack"
	item_state = "fsb_backpack"
	item_icons = list(
		slot_back_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_backpacks.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_backpacks.dmi',
		)
	startswith = list(
		/obj/item/clothing/mask/balaclava/fsb,
		/obj/item/clothing/under/rank/security/fsb,
		/obj/item/clothing/suit/armor/pcarrier/fsb,
		/obj/item/clothing/gloves/thick/fsb,
		/obj/item/clothing/shoes/dutyboots,
		/obj/item/clothing/head/helmet/nt/fsb
		)
	trade_blacklisted = TRUE
