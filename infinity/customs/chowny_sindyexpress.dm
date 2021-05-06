/obj/item/clothing/shoes/jackboots/chowny
	name = "brown boots"
	desc = "A pair of brown boots. Looks like they were ordered from SindyExpress."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "chowny_boots"
	item_state = "chowny_boots_on_mob"
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/ears/earmuffs/headphones/chowny
	name = "nekophones"
	desc = "Nekophones - Red headphones with cat ears and a large red text: (S)yndiCat."
	icon = CUSTOM_ITEM_OBJ
	state_on = "chowny_headphones_on"
	state_off = "chowny_headphones_off"
	item_icons = list(
		slot_l_ear_str = CUSTOM_ITEM_MOB,
		slot_r_ear_str = CUSTOM_ITEM_MOB
		)
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/wcoat/chowny
	name = "black shorts"
	desc = "A black shorts with golden label of SindyExpress."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "chowny_shirt"
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/under/shorts/chowny
	name = "black shirt"
	desc = "A black shirt with sleeves. Looks like it was ordered from SindyExpress."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "chowny_shorts"
	item_state = "chowny_shorts"
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/braslet
	name = "golden braslet"
	desc = "A braslet with a small label of SindyExpress."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "chowny_gold_bracelet"
	w_class = ITEM_SIZE_TINY
	slot = ACCESSORY_SLOT_DECOR
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/braslet/pink
	name = "pink braslet"
	icon_state = "chowny_pink_bracelet"
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/braslet/black
	name = "black braslet"
	icon_state = "chowny_black_bracelet"
	trade_blacklisted = TRUE

/obj/item/clothingbag/chowny_clothing/New()
	new /obj/item/clothing/shoes/jackboots/chowny(src)
	new /obj/item/clothing/ears/earmuffs/headphones/chowny(src)
	new /obj/item/clothing/accessory/wcoat/chowny(src)
	new /obj/item/clothing/under/shorts/chowny(src)
	new /obj/item/clothing/accessory/braslet(src)
	new /obj/item/clothing/accessory/braslet/pink(src)
	new /obj/item/clothing/accessory/braslet/black(src)
