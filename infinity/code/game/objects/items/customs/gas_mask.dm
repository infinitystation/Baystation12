/obj/item/clothing/mask/gas/gm15m
	name ="Gas Mask 15M"
	desc = "An improved military gas mask is most often used by PMCs by companies  have a built-in night vision device and an improved breathing system."
	icon = 'icons/infinity_custom_items_obj.dmi'
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
		slot_l_hand_str = 'icons/infinity_custom_items_mob.dmi',
		slot_r_hand_str = 'icons/infinity_custom_items_mob.dmi',
		slot_wear_mask_str = 'icons/infinity_custom_items_mob.dmi'
	)
	item_state_slots = list(
		slot_l_hand_str = "gas_mask_lh",
		slot_r_hand_str = "gas_mask_rh"
	)