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

/obj/item/clothing/suit/hooded/rex
	name = "OP plate carrier"
	desc = " A mostly common, yet stylish TAA-4 plate carrier model, belonging to Outer Paradise PMC."
	allowed = list(
		/obj/item/gun/energy,
		/obj/item/device/radio,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/gun/projectile,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/melee/baton,
		/obj/item/handcuffs,
		/obj/item/gun/magnetic,
		/obj/item/clothing/head/helmet,
		/obj/item/device/flashlight
	)
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
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	icon_state = "rexv"
	item_state = "rexv"
	body_parts_covered = UPPER_TORSO | LOWER_TORSO
	item_flags = ITEM_FLAG_THICKMATERIAL
	hoodtype = /obj/item/clothing/head/helmet/tactical/rex
	action_button_name = "Toggle Hood"
/obj/item/clothing/suit/hooded/rex/on_update_icon()
	if(suittoggled)
		item_state = "[initial(item_state)]_t"
	else
		item_state = "[initial(item_state)]"
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
	canremove = 0
	trade_blacklisted = TRUE

/obj/item/clothing/mask/gas/rex
	name = "OP combat mask"
	desc = "An intimidating mix of respirator and balaclava with dimmed lenses to blend in better with the dark."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "rexm"
	item_icons = list(
		slot_wear_mask_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	item_state_slots = list(
		slot_wear_mask_str = "rexm",
		slot_l_hand_str = "rexml",
		slot_r_hand_str = "rexmr"
		)
	tint = 0
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR

/obj/item/clothingbag/rex
	name = "clothing bag"
	desc = "PMC Outer Paradise's property"
	trade_blacklisted = TRUE

/obj/item/clothingbag/rex/New()
	..()
	new /obj/item/clothing/suit/hooded/rex(src)
	new /obj/item/clothing/mask/gas/rex(src)
	new /obj/item/clothing/under/solgov/utility/wolf(src)
	new /obj/item/clothing/shoes/jackboots/wolf(src)
	new /obj/item/clothing/accessory/storage/black_vest/wolf(src)
	new /obj/item/clothing/accessory/cloak/wolf(src)
	new /obj/item/clothing/gloves/thick/duty/wolforbykot(src)
	new /obj/item/storage/backpack/wolforbykot(src)
