/obj/item/shield/riot/augment
	icon_state = "aug_shield_as_item_inf"
	item_state = list(r_hand = "aug_shield_r_hand_inf", l_hand = "aug_shield_as_item_inf")
	name = "shield"
	icon = 'infinity/icons/obj/augments/shield_inf.dmi'
	icon_state = "shield"
	icon_state = "shield"
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/augments/augments_l.dmi',
		slot_r_hand_str = 'infinity/icons/mob/augments/augments_r.dmi',
		)
	desc = "tactical shield."
	base_parry_chance = 40
	unacidable = TRUE
	sharp = TRUE
	attack_verb = list("bashed", "sliced")
	max_block = 40
	can_block_lasers = TRUE
	slowdown_general = 0.5

/obj/item/organ/internal/augment/active/simple/shield
	name = "embedded shield"
	desc = "tactical embedded plasteel augment shield."
	action_button_name = "Deploy shield"
	icon_state = "armblade"
	allowed_organs = list(BP_AUGMENT_R_ARM, BP_AUGMENT_L_ARM)
	holding_type = /obj/item/shield/riot/augment
	//Limited to robolimbs
	augment_flags = AUGMENTATION_MECHANIC
