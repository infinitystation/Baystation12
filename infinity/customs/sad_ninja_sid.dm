/obj/item/clothing/shoes/dutyboots/sad_ninja_sid
	name = "blue duty boots"
	desc = "Duty boots in a special color to fit blue armor."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_shoes_str = CUSTOM_ITEM_MOB
	)
	icon_state = "sad_ninja_sid_sidnie_boots"
	item_state = "sad_ninja_sid_sidnie_boots"
	trade_blacklisted = TRUE


/obj/item/clothing/under/sad_ninja_sid
	name = "white shirt and pants"
	desc = "Common set of clothes."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB
	)
	icon_state = "sad_ninja_sid_sidnie_uni"
	item_state = "sad_ninja_sid_sidnie_uni"
	worn_state = "sad_ninja_sid_sidnie_uni"
	trade_blacklisted = TRUE


/obj/item/clothing/head/beret/sad_ninja_sid
	name = "moonlight Guardians beret"
	desc = "Made in colors of moon PSO, this one belongs to a medic officer."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	icon_state = "sad_ninja_sid_sidnie_beret"
	item_state = "sad_ninja_sid_sidnie_beret"
	trade_blacklisted = TRUE


/obj/item/clothing/accessory/armor/tag/sad_ninja_sid
	name = "combat medic patch"
	desc = "A medical cross, that can be attached to a plate carrier."
	icon_override = CUSTOM_ITEM_MOB
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	icon_state = "sad_ninja_sid_sidnie_medpatch"
	item_state = "sad_ninja_sid_sidnie_medpatch"
	trade_blacklisted = TRUE


/obj/item/clothingbag/sad_ninja_sid
	name = "blue clothbag"
	desc = "Sidnie Cloud's property"
	trade_blacklisted = TRUE


/obj/item/clothingbag/sad_ninja_sid/Initialize()
	. = ..()
	new /obj/item/clothing/shoes/dutyboots/sad_ninja_sid(src)
	new /obj/item/clothing/under/sad_ninja_sid(src)
	new /obj/item/clothing/head/beret/sad_ninja_sid(src)
	new /obj/item/clothing/accessory/armor/tag/sad_ninja_sid(src)
