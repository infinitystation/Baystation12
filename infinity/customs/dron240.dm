/obj/item/clothing/head/helmet/space/rig/vox_rig/dron240
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	icon_state = "dron240_vox_rig_helmet"

/obj/item/clothing/suit/space/rig/vox_rig/dron240
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "dron240_vox_rig_chest"

/obj/item/clothing/gloves/rig/vox_rig/dron240
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	icon_state = "dron240_vox_rig_gloves"

/obj/item/clothing/shoes/magboots/rig/vox_rig/dron240
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB)
	icon_state = "dron240_vox_rig_boots"

/obj/item/rig/vox/dron240
	name = "Dark matter rig"
	desc = "Dark matter rig control module. An unidentified drilling rig of dark color, made of an incredibly strong composite alloy. The moving components are made of extremely ductile metal, and the power plant shines with the fading light of dark matter."
	suit_type = "alien rig"
	icon = CUSTOM_ITEM_OBJ
	icon_override = CUSTOM_ITEM_MOB
	icon_state = "dron240_vox_rig"
	custom = TRUE
	online_slowdown = 0.3
	piece_icon_state_overrides = list(
		"helmet" = "dron240_vox_rig_helmet",
		"chest" = "dron240_vox_rig_chest",
		"gloves" = "dron240_vox_rig_gloves",
		"boots" = "dron240_vox_rig_boots"
	)

	helm_type = /obj/item/clothing/head/helmet/space/rig/vox_rig/dron240
	chest_type = /obj/item/clothing/suit/space/rig/vox_rig/dron240
	glove_type = /obj/item/clothing/gloves/rig/vox_rig/dron240
	boot_type = /obj/item/clothing/shoes/magboots/rig/vox_rig/dron240

	initial_modules = list(
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/teleporter,
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/cooling_unit
		)

	trade_blacklisted = TRUE
