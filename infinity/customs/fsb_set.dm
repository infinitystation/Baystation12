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

/obj/item/clothing/gloves/thick/fsb
	icon = CUSTOM_ITEM_OBJ
	icon_state = "fsb_gloves"
	item_state = "fsb_gloves"
	item_icons = list(
		slot_gloves_str = CUSTOM_ITEM_MOB
		)

/obj/item/weapon/storage/backpack/baul
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
		/obj/item/clothing/shoes/dutyboots
		)