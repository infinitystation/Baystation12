/obj/item/clothing/mask/gas/gm15m
	name = "Gas Mask 15M"
	desc = "An improved military gas mask is most often used by PMCs by companies  have a built-in night vision device and an improved breathing system."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "gas_mask"
	item_state = "gas_mask_face"
	item_flags = ITEM_FLAG_BLOCK_GAS_SMOKE_EFFECT | ITEM_FLAG_AIRTIGHT
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_NORMAL
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 0, bomb = 0, bio = 75, rad = 0)
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		slot_wear_mask_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_l_hand_str = "gas_mask_lh",
		slot_r_hand_str = "gas_mask_rh"
	)