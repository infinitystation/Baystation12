/obj/item/clothing/mask/gas/siegemask
	name = "IonLok panoramic gasmask"
	desc = "The IonLok gasmask AP-04-M is a face-covering globose mask that can be connected to an air supply. It has robust layer of anti-reflective coating combined with phoron-hardened ultra-clear glass. Filters harmful gases from the air."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegemask"
	item_state = "siegemask"
	item_icons = list(slot_wear_mask_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE
	tint = 0

/obj/item/clothing/head/siegehood
	name = "IonLok Hood"
	desc = "The IonLok Hood AP-04-SL has advanced technology within tight body-hugging garments and materials. Seems like a part of the environmental suit. It provides environmental protection from various temperatures. It has some bracings for a mask"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegehood"
	item_state = "siegehood"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	body_parts_covered = 0
	item_flags = ITEM_FLAG_THICKMATERIAL
	flags_inv = BLOCKHAIR
	action_button_name = "Toggle Hood Light"
	brightness_on = 0.5
	on = 0
	trade_blacklisted = TRUE

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

/obj/item/weapon/storage/backpack/siegepack
	name = "Belt Poaches"
	desc = "A belt designed to be a convenient way of carrying supplies in countless poaches while keeping the hands free. It is made out of durable material to survive the struggles a field researcher may face."
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	icon = CUSTOM_ITEM_OBJ
	icon_state = "siegepack"
	item_state = "siegepack"
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/datum/robolimb/siegecustom/auronsol
	company = "Auron Solutions partial legs prothetics"
	icon = 'infinity/icons/mob/human_races/cyberlimbs/auronsol/auronsol.dmi'
	applies_to_part = list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	brute_mod = 1.5
	burn_mod = 1.5
	speed_mod = -0.18
	allowed_ckeys = list("diesiege")

/obj/item/weapon/clothingbag/diesiegeset
	name = "IonLok outfit pack"
	desc = "A utility bag. Simple as that"

/obj/item/weapon/clothingbag/diesiegeset/New()
	. = ..()
	new /obj/item/clothing/mask/gas/siegemask(src)
	new /obj/item/clothing/under/thermal/siegeuni(src)
	new /obj/item/weapon/storage/backpack/siegepack(src)
	new /obj/item/clothing/head/siegehood(src)
