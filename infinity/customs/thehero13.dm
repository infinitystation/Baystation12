/obj/item/clothing/head/helmet/ballistic/marksman_helmet
	name = "PCRC marksman helmet"
	desc = "An imposing helmet designed for work in special operations. \
			Property of Proxima Centauri Risk Control. \
			This helmet can be connected to some kind of balloon \
			and allows you to work in a vacuum. \
			Oh, this helmet does not allow you to wear masks under it."

	icon = CUSTOM_ITEM_OBJ
	icon_state = "thehero13_helmet"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	item_state_slots = list(slot_head_str = "thehero13_helmet")

	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEMASK|BLOCKHAIR
	body_parts_covered = FACE|EYES|HEAD

	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	min_pressure_protection = 0
	max_pressure_protection = SPACE_SUIT_MAX_PRESSURE
	item_flags = ITEM_FLAG_AIRTIGHT

	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/ballistic/marksman_helmet/mob_can_equip(mob/living/carbon/human/H, slot, disable_warning)
	. = ..()
	// A person cannot wear this helmet when there is something on their face. ~ SidVeld
	if(H.wear_mask)
		return 0


// Screll helmet
/obj/item/clothing/head/helmet/tactical/screllhelmet
	name = "skrellian combat helmet"
	desc = "An advanced skrellian helmet designed for work in special operations. Looks reliable."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "heroh"
	item_state = "heroh"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	species_restricted = list(SPECIES_SKRELL)
	trade_blacklisted = TRUE

/obj/item/custkit/screllhelmet
	name = "skrellian helmet customization kit"
	input = /obj/item/clothing/head/helmet/tactical
	output = /obj/item/clothing/head/helmet/tactical/screllhelmet


// Scarf
/obj/item/clothing/accessory/scarf/inf/thehero13
	desc = "A scarf made with the yarn of the Satiporoja beetle. \
			Perfect conductor of The Ripple."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "thehero13_pater_scarf"
	item_state = "thehero13_pater_scarf"
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	item_icons = list(slot_wear_mask_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

//
// Skrellian tactical suit
//
/obj/item/clothing/under/solgov/utility/thehero13_skrellian
	name = "skrellian tactical suit"
	desc = "A comfortable tactical suit designed to not allot moisture away from the body. \
			The tag on the inner side appears to contain something written in Skrellian."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT
	)
	icon_state = "thehero13_qairo_uni"
	item_state = "thehero13_qairo_uni"
	worn_state = "thehero13_qairo_uni"
	gender_icons = FALSE

/obj/item/clothing/gloves/thick/thehero13_skrellian
	name = "skrellian tactical gloves"
	desc = "A pair of fingerless gloves. They look shabby."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_gloves_str = CUSTOM_ITEM_MOB
	)
	icon_state = "thehero13_qairo_gloves"
	item_state = "thehero13_qairo_gloves"

/obj/item/clothing/shoes/dutyboots/thehero13_skrellian
	name = "skrellian tactical boots"
	desc = "A pair of black boots with extra padding and armor."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_shoes_str = CUSTOM_ITEM_MOB
	)
	icon_state = "thehero13_qairo_boots"
	item_state = "thehero13_qairo_boots"

/obj/item/clothing/mask/gas/half/thehero13_skrellian
	name = "skrellian tactical mask"
	desc = "A close-fitting combat mask that can be connected to an air supply. \
			Filters harmful gases from the air."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT
	)
	icon_state = "thehero13_qairo_mask"
	item_state = "thehero13_qairo_mask"
	pull_mask = FALSE
	flags_inv = BLOCKHEADHAIR | BLOCKHAIR | HIDEFACE

/obj/item/clothingbag/thehero13_skrellian
	name = "skrellian tactical set"
	desc = "clothing bag with sckrellian suit"

/obj/item/clothingbag/thehero13_skrellian/Initialize()
	. = ..()
	new /obj/item/clothing/under/solgov/utility/thehero13_skrellian(src)
	new /obj/item/clothing/gloves/thick/thehero13_skrellian(src)
	new /obj/item/clothing/shoes/dutyboots/thehero13_skrellian(src)
	new /obj/item/clothing/mask/gas/half/thehero13_skrellian(src)
	new /obj/item/custkit/screllhelmet(src)
