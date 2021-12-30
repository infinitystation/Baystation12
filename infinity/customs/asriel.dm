/obj/item/clothing/accessory/locket/custom/asriel_locket
	name = "dark locket"
	desc = "Dark locket with a photo within. On the photo, you can see two siblings: One is a tall well-built man with white hair, the other is a short thin girl with same haircolour. They seem to be happy."
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "asriel_locket"
	message = "\"Be safe, bro)! From Alisa\""
	held = 1
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/custom_asriel
	name = "rogue knight helmet"
	desc = "A black, somewhat rusty-looking helmet with some unreadable markings and words on it."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "asriel_helmet"
	trade_blacklisted = TRUE

// ROGUE KNIGHT ZIMMER
/obj/item/clothing/head/helmet/ballistic/asriel
	name = "rogue knight helmet"
	desc = "A black, somewhat rusty-looking helmet with some unreadable markings and words on it."
	icon = CUSTOM_ITEM_OBJ
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB,
					  slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					  slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	item_state_slots = list(slot_l_hand_str = "mando_helm",
							slot_r_hand_str = "mando_helm",)
	icon_state = "mando_helm"
	item_state = "mando_helm"
	body_parts_covered = HEAD | FACE | EYES
	trade_blacklisted = TRUE

/obj/item/clothing/suit/armor/bulletproof/asriel
	name = "rogue knight armor"
	desc = "Nice suit."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB,
					  slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					  slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	icon_state = "mando_suit"
	item_state = "mando_suit"
	body_parts_covered = UPPER_TORSO | LOWER_TORSO | ARMS | LEGS
	starting_accessories = list()
	trade_blacklisted = TRUE

/obj/item/clothingbag/asriel_rogue_set
	name = "rogue knight battle set"
	desc = "Zimmer's property"
	trade_blacklisted = TRUE

/obj/item/clothingbag/asriel_rogue_set/Initialize()
	. = ..()
	new /obj/item/clothing/head/helmet/ballistic/asriel(src)
	new /obj/item/clothing/suit/armor/bulletproof/asriel(src)

/obj/item/clothing/gloves/thick/duty/asriel
	name = "rogue knight glovess"
	desc = "Nice gloves."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	icon_state = "mando_gloves"
	item_state = "mando_gloves"
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/dutyboots/asriel
	name = "rogue knight boots"
	desc = "Nice boots."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "mando_boots"
	item_state = "mando_boots"
	trade_blacklisted = TRUE

/obj/item/clothing/under/syndicate/tacticool/asriel
	name = "Rogue knight turtleneck"
	desc = "Nice turtleneck."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB,
					  slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					  slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	item_state_slots = list(slot_l_hand_str = "mando_uniform",
							slot_r_hand_str = "mando_uniform",)
	icon_state = "mando_uniform"
	item_state = "mando_uniform"
	worn_state = "mando_uniform"
	gender_icons = 0
	trade_blacklisted = TRUE

/obj/item/storage/backpack/asriel
	name = "Rogue knight cape"
	desc = "Nice cape."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB,
					  slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					  slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	item_state_slots = list(slot_l_hand_str = "mando_back",
							slot_r_hand_str = "mando_back",)
	icon_state = "mando_back"
	item_state = "mando_back"
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	trade_blacklisted = TRUE

/obj/item/clothingbag/asriel_rogue_set_civ
	name = "rogue knight set"
	desc = "Zimmer's property"
	trade_blacklisted = TRUE

/obj/item/clothingbag/asriel_rogue_set_civ/Initialize()
	. = ..()
	new /obj/item/clothing/gloves/thick/duty/asriel(src)
	new /obj/item/clothing/shoes/dutyboots/asriel(src)
	new /obj/item/clothing/under/syndicate/tacticool/asriel(src)
	new /obj/item/storage/backpack/asriel(src)
