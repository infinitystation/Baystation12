/obj/item/clothing/accessory/cloak/hacso
	name = "leather coat"
	desc = "A red coat made of thick leather, with plastic elbow pads."
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB,
	)
	icon_state = "hacsoc"
	item_state = "hacsoc"
	item_state_slots = list(
		slot_tie_str = "hacsoc",
		slot_wear_suit_str = "hacsoc",
	)
	trade_blacklisted = TRUE

/obj/item/clothing/head/terran/beret/hacso
	name = "Red ICCG Beret"
	desc = "A red ICCGN Beret. It bears the crest of the ICCG on the front."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	siemens_coefficient = 0.9
	icon_state = "hacso_beret"
	item_state = "hacso_beret"
	body_parts_covered = 0
