/obj/item/clothing/mask/gas/siegemask
	name = "IonLok panoramic gasmask"
	desc = "The IonLok gasmask AP-04-M is a face-covering globose mask that can be connected to an air supply. It has robust layer of anti-reflective coating combined with phoron-hardened ultra-clear glass. Filters harmful gases from the air."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegemask"
	item_state = "siegemask"
	item_icons = list(slot_wear_mask_str = CUSTOM_ITEM_MOB)

	trade_blacklisted = TRUE

/obj/item/clothing/mask/gas/siegemask/Initialize()
	. = ..()
	tint = 0

/obj/item/clothing/under/thermal/siegeuni
	name = "IonLok Suit"
	desc = "The IonLok suit AP-04-SL has advanced technology within tight body-hugging garments and materials. It provides environmental protection from various temperatures. This one is a special model with shorts made for amputees. It has a patch with \"Megan W. B(III)-\" written on it."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "siegeuni"
	item_state = "siegeuni"
	worn_state = "siegeuni"
	thermostat = T0C + 36

	trade_blacklisted = TRUE
