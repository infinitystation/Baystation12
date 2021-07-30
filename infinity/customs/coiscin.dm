/obj/item/clothing/suit/storage/det_trench/grey/coiscin
	name = "FTU Merchant coat"
	desc = "Worn and old coat with the FTU logo, all patched and lightly hemmed, which does not help much to maintain a presentable look. On the front side there are four rather deep pockets, and on the back side, in turn, there is a circle embroidered with red thread, in the center of which is the letter 'A' - the sign of the anarchists."
	slots = 4
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	allowed = list (
	/obj/item/stack/medical,
	/obj/item/reagent_containers/dropper,
	/obj/item/reagent_containers/hypospray,
	/obj/item/reagent_containers/syringe,
	/obj/item/device/scanner/health,
	/obj/item/device/flashlight,
	/obj/item/reagent_containers/glass/bottle,
	/obj/item/clothing/head/beret)

	icon_state = "FTUlabcoat"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	trade_blacklisted = TRUE

/obj/item/clothing/gloves/vox/coiscin
	name = "sterile vox gloves"
	desc = "Three-fingered glove made of sterile material, stinks strongly of alcohol."
	permeability_coefficient = 0.05
	germ_level = 0
	icon = CUSTOM_ITEM_OBJ
	icon_state = "FTUgloves"
	item_state = "FTUgloves"
	item_icons = list(
		slot_gloves_str = CUSTOM_ITEM_MOB
	)
	trade_blacklisted = TRUE

/obj/item/clothing/glasses/coiscin
	name = "FTU Merchant vox visors"
	desc = "Old cracked FTU Merchant visors adapted for vox."
	species_restricted = list(SPECIES_VOX)
	icon = CUSTOM_ITEM_OBJ
	icon_state = "FTUvisor"
	item_state = "FTUvisor"
	item_icons = list(
		slot_glasses_str = CUSTOM_ITEM_MOB
	)
	trade_blacklisted = TRUE

/obj/item/clothing/head/beret/coiscin
	name = "FTU Merchant beret"
	desc = "An unremarkable burgundy beret with the FTU badge."
	species_restricted = list(SPECIES_VOX)
	icon = CUSTOM_ITEM_OBJ
	icon_state = "FTUberet"
	item_state = "FTUberet"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	trade_blacklisted = TRUE

/obj/item/clothingbag/coiscin
	name = "Garbage bag"
	desc = "An ordinary garbage bag... Take out the trash, huh?"
	trade_blacklisted = TRUE


/obj/item/clothingbag/coiscin/Initialize()
	. = ..()
	new /obj/item/clothing/suit/storage/det_trench/grey/coiscin(src)
	new /obj/item/clothing/head/beret/coiscin(src)
	new /obj/item/clothing/glasses/coiscin(src)
	new /obj/item/clothing/gloves/vox/coiscin(src)
