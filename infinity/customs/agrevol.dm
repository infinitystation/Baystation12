/obj/item/clothing/mask/gas/revolmask
	name = "IonLok panoramic gasmask"
	desc = "The IonLok gasmask AP-04-M-Blue is a face-covering globose mask that can be connected to an air supply. It has robust layer of anti-reflective coating combined with phoron-hardened ultra-clear glass. Filters harmful gases from the air."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "revolmask"
	item_state = "revolmask"
	item_icons = list(slot_wear_mask_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE
	tint = 0

/obj/item/clothing/under/thermal/revoluni
	name = "IonLok Suit"
	desc = "The IonLok suit AP-05-MP has advanced technology within tight body-hugging garments and materials. It provides environmental protection from various temperatures. This one is made to be worn by medical specialists on field duty and has a blue cross on its back. It has a patch with 'Mathias W. B(III)-' written on it."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "revoluni"
	item_state = "revoluni"
	worn_state = "revoluni"
	thermostat = T0C + 36
	trade_blacklisted = TRUE

/obj/item/storage/backpack/revolpack
	name = "Belt Poaches"
	desc = "A belt designed to be a convenient way of carrying supplies in countless poaches while keeping the hands free. It is made out of durable material to survive the struggles a field researcher may face. You can see a small medical badge on its back."
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	icon = CUSTOM_ITEM_OBJ
	icon_state = "revolpack"
	item_state = "revolpack"
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/head/beret/revolberet
	name = "PRD Beret"
	desc = "Beret of Lorriman Pharmaceutical Research Division. It is grey with a small blue symbol on the forehead. The symbol depicts a stylized atom scheme with planet in the middle. How trivial."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "revolberet"
	item_state = "revolberet"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/jackboots/revolboots
	name = "Reinforced Sole Boots"
	desc = "Fine leather shoes reinforced by metal wire and rubber. They look comfy and durable."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "revolboot"
	item_state = "revolboot"
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothingbag/revolset
	name = "outfit pack"
	desc = "A utility bag. Simple as that"

/obj/item/clothingbag/revolset/New()
	..()
	new /obj/item/clothing/mask/gas/revolmask(src)
	new /obj/item/clothing/under/thermal/revoluni(src)
	new /obj/item/storage/backpack/revolpack(src)
	new /obj/item/clothing/head/beret/revolberet(src)
	new /obj/item/clothing/shoes/jackboots/revolboots(src)
