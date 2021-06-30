/obj/item/clothing/accessory/armor/helmcover/custom_he11d1ver
	name = "SAARE pointman helmet modkit"
	desc = "A rugged-looking helmet cover with a ballistic faceplate. Stare death down the barrel, and raze hell to the ground."
	icon_override = CUSTOM_ITEM_MOB
	icon = CUSTOM_ITEM_OBJ
	icon_state = "helldiver_helmet"
	accessory_icons = list(slot_tie_str = CUSTOM_ITEM_MOB, slot_head_str = CUSTOM_ITEM_MOB)

	trade_blacklisted = TRUE

/datum/robolimb/custom_he11d1ver
	company = "combat prothestic limb"
	desc = "Some kind of sleek and useful Mars Military Industries 'Dominus' arm design, you wouldn't call it militaristic at all."
	icon = 'infinity/icons/customs/cyberlimbs/combat_limb.dmi'
	allowed_ckeys = list("he11d1ver")
	applies_to_part = list(BP_L_ARM, BP_L_HAND)
	unavailable_at_fab = 1

	brute_mod = 0.7
	burn_mod = 0.7
	speed_mod = 0.18

/obj/item/clothing/suit/armor/pcarrier/tactical/rex
	name = "OP plate carrier"
	desc = " A mostly common, yet stylish TAA-4 plate carrier model, belonging to Outer Paradise PMC."
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/tactical)
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
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "rexv"
	item_state = "rexv"
	body_parts_covered = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/tactical/rex
	name = "OP combat hood"
	desc = "Made from military-grade bi-weave plasteel fibres, this hood is as tough as most of the common human-known helmets. Nevertheless, this one is very flexible."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rexh"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_head_str = "rexh"
	)
	trade_blacklisted = TRUE
	action_button_name = "Toggle hood"
	var/isHoodUp = 0

/obj/item/clothing/head/helmet/tactical/rex/on_update_icon()
	. = ..()
	var/tmp = "[initial(icon_state)][isHoodUp ? "_up" : ""]"
	item_state_slots = list(slot_head_str = tmp)
	icon_state = tmp
	update_clothing_icon()

/obj/item/clothing/head/helmet/tactical/rex/attack_self(mob/user as mob)
	isHoodUp = !isHoodUp
	to_chat(user, "You [isHoodUp ? "lower" : "raise"] the hood on the [src].")
	update_icon()

/obj/item/clothingbag/rex
	name = "clothing bag"
	desc = "Aard's property"
	trade_blacklisted = TRUE

/obj/item/clothingbag/rex/New()
	..()
	new /obj/item/clothing/head/helmet/tactical/rex(src)
	new /obj/item/clothing/suit/armor/pcarrier/tactical/rex(src)
	new /obj/item/clothing/under/rank/chaplain/wolf(src)
	new /obj/item/clothing/shoes/jackboots/wolf(src)
	new /obj/item/clothing/accessory/storage/black_vest/wolf(src)
	new /obj/item/clothing/accessory/cloak/wolf(src)
