/obj/item/clothing/under/custom_flunif
	name = "service uniform"
	desc = "An uniform of SCG Fleet. This one belongs to officers."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "os_uniform"
	item_state = "os_uniform"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		slot_w_uniform_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_l_hand_str = "os_uniform_lefthand",
		slot_r_hand_str = "os_uniform_righthand"
	)
	starting_accessories = list(/obj/item/clothing/accessory/medal/solgov/silver/sword, /obj/item/clothing/accessory/ribbon/solgov/marksman, /obj/item/clothing/accessory/solgov/rank/fleet/officer/o3)
	trade_blacklisted = TRUE
