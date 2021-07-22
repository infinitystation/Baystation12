/obj/item/clothing/under/kilkauni
	name = "skrellian uniform"
	desc = "A set of green fatigues worn over a black jumpsuit. Surprisingly comfy."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kiluni"
	item_state = "kiluni"
	worn_state = "kiluni"
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB
	)
	trade_blacklisted = TRUE

/obj/item/clothing/gloves/thick/kilkaglov
	name = "fingerless gloves"
	desc = "Tactical fingerless gloves with small inserts of flexible plastic on the joints."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kilglov"
	item_state = "kilglov"
	item_icons = list(
		slot_gloves_str = CUSTOM_ITEM_MOB
	)
	trade_blacklisted = TRUE

/obj/item/storage/backpack/satchel/kilkapack
	name = "load-bearing equipment"
	desc = "Set of load-carrying equipment with many pouches."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kilpack"
	item_state = "kilpack"
	item_icons = list(
		slot_back_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	item_state_slots = list(
		slot_l_hand_str = "kilpack",
		slot_r_hand_str = "kilpack"
	)
	trade_blacklisted = TRUE

/obj/item/clothingbag/kil
	name = "clothing bag"
	desc = "From Qerrbalak with Love"
	trade_blacklisted = TRUE

/obj/item/clothingbag/kil/New()
	..()
	new /obj/item/clothing/under/kilkauni(src)
	new /obj/item/clothing/gloves/thick/kilkaglov(src)
	new /obj/item/storage/backpack/satchel/kilkapack(src)
