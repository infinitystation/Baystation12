/obj/item/clothing/under/unchi_turtleneck
	name = "old turtleneck"
	desc = "Dark green, military turtleneck with army cargo pants. They look pretty worn, and seems like, turtleneck have been hemmed in some day."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "unchi_turtleneck"
	item_state = "unchi_turtleneck"
	worn_state = "unchi_turtleneck"
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	gender_icons = 1
	trade_blacklisted = TRUE

/obj/item/gun/projectile/shotgun/pump/combat/armory/unchi
	name = "combat shotgun"
	desc = "Built for close quarters combat, the Hephaestus Industries KS-40 is widely regarded as a weapon of choice for repelling boarders."
	icon = CUSTOM_GUN_ICONS
	item_icons = list(
		slot_r_hand_str = CUSTOM_GUN_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_GUN_INHANDS_LEFT,
		slot_back_str = CUSTOM_ITEM_MOB
	)
	icon_state = "unchi-shotgun"
	item_state = "unchi-shotgun"
	wielded_item_state = "unchi-shotgun-wielded"

/obj/item/custkit/unchi
	icon = CUSTOM_ITEM_OBJ
	icon_state = "modkit-box"
	unkit_icon_state = "unmodkit-box"
	input = /obj/item/gun/projectile/shotgun/pump/combat/armory
	output = /obj/item/gun/projectile/shotgun/pump/combat/armory/unchi
	can_unkit = 1
	delay = 10 MINUTES
