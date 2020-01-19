/obj/item/clothing/accessory/armor/helmcover/custom_he11d1ver
	name = "SAARE pointman helmet modkit"
	desc = "A rugged-looking helmet cover with a ballistic faceplate. Stare death down the barrel, and raze hell to the ground."
	icon_override = CUSTOM_ITEM_MOB
	icon = CUSTOM_ITEM_OBJ
	icon_state = "helldiver_helmet"
	accessory_icons = list(slot_tie_str = CUSTOM_ITEM_MOB, slot_head_str = CUSTOM_ITEM_MOB)

	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/ronin_helmet
	name = "skull-shaped helmet"
	desc = "A full helmet bent and painted to resemble a cow's skull - a grim representation of it's owner's cruelty. The engraving on the back reads 'R O N I N'."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "roninhelmet"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = FACE|EYES|HEAD
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_head_str = "ronin_helmet"
	)
	trade_blacklisted = TRUE
