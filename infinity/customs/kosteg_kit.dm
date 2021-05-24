/obj/item/clothing/under/zonesweeater
	name = "purple sweater"
	desc = "Dark-purple stockings and purple off-the-shoulder sweater with skull picture in its center."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "kosteg_suit"
	item_state = "kosteg_suit"
	rolled_sleeves = -1
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/zoneboots
	name = "go-go boots"
	desc = "A pair of dark-purple go-go boots, perfect for every occasion, from working in a bar to fighting off tentacles, if you somehow manage to find yourself in such situation."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "kosteg_boots"
	item_state = "kosteg_boots"
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/zonehairclip
	name = "skull hairclip"
	desc = "A skull shaped hairclip, nuff said."
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	item_icons = list(slot_r_ear_str = CUSTOM_ITEM_MOB, slot_l_ear_str  = CUSTOM_ITEM_MOB)
	icon_state = "kosteg_mask"
	item_state = "kosteg_mask"
	slot_flags = SLOT_EARS | SLOT_TIE
	trade_blacklisted = TRUE

/obj/item/clothingbag/zone
	New()
		new /obj/item/clothing/under/zonesweeater(src)
		new /obj/item/clothing/shoes/zoneboots(src)
		new /obj/item/clothing/accessory/zonehairclip(src)
