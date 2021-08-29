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

/obj/item/clothing/under/hooded/kilkameduni
	name = "hazardous materials suit"
	desc = "A set of personal protective equipment designed to protect its wearer from toxic substances and biological agents. The Outer Paradise logo emblazoned on its shoulder."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kilmeduni"
	item_state = "kilmeduni"
	worn_state = "kilmeduni"
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	item_state_slots = list(
		slot_wear_mask_str = "kilmeduni",
		slot_l_hand_str = "kilmeduni",
		slot_r_hand_str = "kilmeduni"
		)
	armor = list(
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	body_parts_covered = FULL_TORSO|LEGS|ARMS
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/kilhood
	trade_blacklisted = TRUE

/obj/item/clothing/head/kilhood
	name = "hazardous materials hood"
	desc = "A hood that protects the head from biological comtaminants."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kilmeduni_hood"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	armor = list(
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	flags_inv = BLOCKHEADHAIR
	trade_blacklisted = TRUE

/obj/item/clothing/gloves/latex/kilkamedglov
	name = "rubber gloves"
	desc = "A pair of sterile rubber protective gloves that reach past the elbow. They smell like a hospital."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kilmedglov"
	item_state = "kilmedglov"
	item_icons = list(
		slot_gloves_str = CUSTOM_ITEM_MOB
	)
	armor = list(
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	germ_level = 0
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/kilkahelm
	name = "white helmet"
	desc = "Reinforced headgear. On the back side there is a medic's insignia."
	icon_state = "kilhelm"
	item_state = "kilhelm"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	item_state_slots = list(
		slot_l_hand_str = "kilhelm",
		slot_r_hand_str = "kilhelm"
	)
	trade_blacklisted = TRUE


/obj/item/clothing/suit/armor/pcarrier/kilkapc
	name = "medic plate carrier"
	desc = "Specially designed lightweight plate carrier for medical personnel of the Outer Paradise. The tag on the shoulder reads LAZARUS."
	icon_state = "kilmedvest"
	item_state = "kilmedvest"
	starting_accessories = list(/obj/item/clothing/accessory/armorplate)
	valid_accessory_slots = list(
		ACCESSORY_SLOT_INSIGNIA,
		ACCESSORY_SLOT_ARMOR_C,
		ACCESSORY_SLOT_ARMOR_A,
		ACCESSORY_SLOT_ARMOR_L,
		ACCESSORY_SLOT_ARMOR_S,
		ACCESSORY_SLOT_ARMOR_M,
		ACCESSORY_SLOT_OVER
	)

	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	trade_blacklisted = TRUE

/obj/item/clothing/mask/gas/kilkamask
	name = "shielded gas mask"
	desc = "A face-covering mask that can be connected to an air supply. Filters harmful gases from the air. The reflective screen looks quite menacing."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "kilmedmask"
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	item_state_slots = list(
		slot_wear_mask_str = "kilmedmask",
		slot_l_hand_str = "kilmedmask",
		slot_r_hand_str = "kilmedmask"
		)
	armor = list(
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	tint = 2
	trade_blacklisted = TRUE

obj/item/clothing/shoes/jackboots/kilkamedshoe
	name = "hazardous materials boots"
	desc = "Rubberized boots, tightly fitting to the body designed to protect its owner from toxic substances and biological agents."
	icon_state = "kilshoes"
	item_state = "kilshoes"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB
	)
	armor = list(
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	trade_blacklisted = TRUE

/obj/item/clothingbag/kilmed
	name = "clothing bag"
	desc = "It has the Outer Paradise logo on it"
	trade_blacklisted = TRUE

/obj/item/clothingbag/kilmed/New()
	..()
	new /obj/item/clothing/under/hooded/kilkameduni(src)
	new /obj/item/clothing/gloves/latex/kilkamedglov(src)
	new /obj/item/clothing/mask/gas/kilkamask(src)
	new /obj/item/clothing/suit/armor/pcarrier/kilkapc(src)
	new /obj/item/clothing/head/helmet/kilkahelm(src)
	new /obj/item/clothing/shoes/jackboots/kilkamedshoe(src)
	new /obj/item/storage/backpack/wolforbykot(src)

