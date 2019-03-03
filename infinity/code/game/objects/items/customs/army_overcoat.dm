/obj/item/clothing/suit/storage/army_overcoat
	name = "army overcoat"
	desc = "Army overcoat standard Terran tailoring. On the back is a two-headed eagle, the edges bordered with brown fabric. On the shoulders are dark-red pagons, but they have no identification marks. Buttons are faintly gilded and have already faded. The overcoat was clearly worn and was in hot spots."
	icon = 'icons/obj/clothing/infinity/suits.dmi' 
	icon_state = "army_overcoat"
	item_state = "army_overcoat"
	item_icons = list(
		slot_wear_suit_str = 'icons/mob/infinity/suits.dmi',
		slot_l_hand_str = 'icons/mob/onmob/infinity/l_hand_suits.dmi',
		slot_r_hand_str = 'icons/mob/onmob/infinity/r_hand_suits.dmi',
		)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 5, bomb = 10, bio = 0, rad = 0)
