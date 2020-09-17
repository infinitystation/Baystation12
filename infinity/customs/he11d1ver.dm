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
	allowed_ckeys = list("he11diver")
	applies_to_part = list(BP_L_ARM, BP_L_HAND)
	unavailable_at_fab = 1

	brute_mod = 0.7
	burn_mod = 0.7
	speed_mod = 0.18
