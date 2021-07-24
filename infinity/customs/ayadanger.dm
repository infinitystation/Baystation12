/obj/item/clothing/under/ayadanger_sabi
	name = "sabi-yukata"
	desc = "Just well-tailored clothes. \
			You can see a small piece of juban and black pants peeking out from under a light green kimono with a cube pattern. \
			If you take a closer look, you will notice that all these things are sewn together. Interesting."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
		)
	icon_state = "ayadanger_sabito_uni"
	item_state = "ayadanger_sabito_uni"
	trade_blacklisted = TRUE

/obj/item/clothing/mask/ayadanger_sabi
	name = "sabi-mask"
	desc = "When you look at this mask, you can notice that it looks quite a bit like a fox. \
			If you look at this mask twice, you may notice that it is welded to peach colored synthetic hair. \
			It looks very soft, though."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
		)
	icon_state = "ayadanger_sabito_mask"
	item_state = "ayadanger_sabito_mask"
	down_icon_state = "ayadanger_sabito_mask_up"
	body_parts_covered = FULL_HEAD
	flags_inv = BLOCKHEADHAIR
	pull_mask = 1
	down_body_parts_covered = HEAD
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/ayadanger_sabi
	name = "sabi-sandals"
	desc = "Just a pair of sandals. \
			One thing you may notice is that they have a bit more bindings than regular sandals. \
			These sandals are probably made for running prostheses."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_shoes_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
		)
	icon_state = "ayadanger_sabito_sandals"
	item_state = "ayadanger_sabito_sandals"
	trade_blacklisted = TRUE

/obj/item/clothing/suit/ayadanger_sabi
	name = "haori"
	desc = "This is haori - light, loose, beautiful white clothes. \
			It has no wadding, which means that this garment is for the summer season. \
			It is so loose that it seems that it will fit even on a spacesuit."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
		)
	icon_state = "ayadanger_sabito_suit"
	item_state = "ayadanger_sabito_suit"
	trade_blacklisted = TRUE

/obj/item/clothingbag/ayadanger_sabi
	name = "Rosesteel's set"
	desc = "Something japan"
	trade_blacklisted = TRUE

/obj/item/clothingbag/ayadanger_sabi/Initialize()
	. = ..()
	new /obj/item/clothing/mask/ayadanger_sabi(src)
	new /obj/item/clothing/shoes/ayadanger_sabi(src)
	new /obj/item/clothing/suit/ayadanger_sabi(src)
	new /obj/item/clothing/under/ayadanger_sabi(src)
