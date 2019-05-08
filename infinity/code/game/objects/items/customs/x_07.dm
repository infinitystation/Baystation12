/*/obj/item/clothing/head/x_four
	name = "X-4 helmet"
	desc = "The glass of the helmet is made of armored glass, from the side you can see the laser designator. SCP inscription on back of helmet."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "X-04"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		slot_w_head_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_l_hand_str = "lefthand_X-04",
		slot_r_hand_str = "righthand_x-04",
		slot_w_head_str = "x-04_on_mob"
	)*/

/obj/item/clothing/head/helmet/x_four
	name = "X-4 helmet"
	desc = "The glass of the helmet is made of armored glass, from the side you can see the laser designator. SCP inscription on back of helmet."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "X-04"
	item_icons = list(slot_w_head_str = CUSTOM_ITEM_MOB,
					slot_l_hand_str = CUSTOM_ITEM_MOB,
					slot_r_hand_str = CUSTOM_ITEM_MOB
	)
	//item_state = "x-04_on_mob"
	item_state_slots = list(
		slot_l_hand_str = "lefthand_X-04",
		slot_r_hand_str = "righthand_x-04",
		slot_w_head_str = "x-04_on_mob"
	)