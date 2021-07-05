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
