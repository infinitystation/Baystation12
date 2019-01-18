/obj/item/clothing/mask/balaclava/fsb
	name = "balaclava"
	desc = "Covers the head, forehead and face, leaving a small slit for the eyes."

	icon = 'icons/infinity_custom_items_obj.dmi'

	icon_state = "fsb_mask"
	item_state = "fsb_mask"

	item_icons = list(
		slot_wear_mask_str = 'icons/infinity_custom_items_mob.dmi'
		)

	sprite_sheets = list()

	pull_mask = 0

/obj/item/clothing/under/rank/security/fsb
	name = "military uniform"
	desc = "Military uniform, very suitable for conducting military operations"

	icon = 'icons/infinity_custom_items_obj.dmi'

	icon_state = "fsb_uniform"
	item_state = "fsb_uniform"

	item_icons = list(
		slot_w_uniform_str = 'icons/infinity_custom_items_mob.dmi'
		)

	worn_state = null

/obj/item/clothing/suit/storage/fsb_suit
	name = "Tunic"
	desc = "Ordinary clothing special team."

	icon = 'icons/infinity_custom_items_obj.dmi'

	icon_state = "fsb_suit"
	item_state = "fsb_suit"

	item_icons = list(
		slot_wear_suit_str = 'icons/infinity_custom_items_mob.dmi'
		)

	sprite_sheets = list()

	slots = 6

	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_C)

/obj/item/clothing/gloves/thick/fsb
	icon = 'icons/infinity_custom_items_obj.dmi'

	icon_state = "fsb_gloves"
	item_state = "fsb_gloves"

	item_icons = list(
		slot_gloves_str = 'icons/infinity_custom_items_mob.dmi'
		)

/obj/item/weapon/storage/backpack/baul
	name = "Baul"
	desc = "Comfortable bag and pouches to it, fixed straps."

	icon = 'icons/infinity_custom_items_obj.dmi'

	icon_state = "fsb_backpack"
	item_state = "fsb_backpack"

	item_icons = list(
		slot_back_str = 'icons/infinity_custom_items_mob.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_backpacks.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_backpacks.dmi',
		)
	startswith = list(
		/obj/item/clothing/mask/balaclava/fsb,
		/obj/item/clothing/under/rank/security/fsb,
		/obj/item/clothing/suit/storage/fsb_suit,
		/obj/item/clothing/gloves/thick/fsb,
		/obj/item/clothing/shoes/dutyboots
		)
/*
#define slot_back_str		"slot_back"
#define slot_l_hand_str		"slot_l_hand"
#define slot_r_hand_str		"slot_r_hand"
#define slot_w_uniform_str	"slot_w_uniform"
#define slot_head_str		"slot_head"
#define slot_wear_suit_str	"slot_suit"
#define slot_l_ear_str      "slot_l_ear"
#define slot_r_ear_str      "slot_r_ear"
#define slot_belt_str       "slot_belt"
#define slot_shoes_str      "slot_shoes"
#define slot_wear_mask_str 	"slot_wear_mask"
#define slot_handcuffed_str "slot_handcuffed"
#define slot_legcuffed_str "slot_legcuffed"
#define slot_wear_id_str  	"slot_wear_id"
#define slot_gloves_str  	"slot_gloves"
#define slot_glasses_str  	"slot_glasses"
#define slot_s_store_str	"slot_s_store"
#define slot_tie_str		"slot_tie"*/