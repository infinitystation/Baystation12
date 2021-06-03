/obj/item/clothing/head/helmet/daft_punk //By KaReTa
	name = "Daft Punk helm"
	desc = "This fancy helm gives you the ability to see through clothes! Well, at least that's what rumors say.."
	icon = INF_CLOTHING_ICON_OBJ("head")
	item_icons = list(slot_head_str = INF_CLOTHING_ICON_MOB("head"))
	icon_state = "daft_helmet"

/obj/item/clothing/head/helmet/pcrc/cover
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/pcrc)

/obj/item/clothing/head/helmet/saare/cover
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/saare)

/obj/item/clothing/head/helmet/skrell/navy
	name = "navy skrellian helmet"
	desc = "A navy blue helmet built for use by a Skrell. This one appears to be fairly standard and reliable."
	icon = 'infinity/icons/obj/clothing/species/skrell/obj_head_skrell.dmi'
	icon_state = "helmet_skrell_navy"

	item_icons = list(
		slot_head_str = 'infinity/icons/mob/species/skrell/onmob_head_skrell.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_hats.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_hats.dmi'
		)

/obj/item/clothing/head/helmet/skrell/green
	name = "green skrellian helmet"
	desc = "A green helmet built for use by a Skrell. This one appears to be fairly standard and reliable."
	icon = 'infinity/icons/obj/clothing/species/skrell/obj_head_skrell.dmi'
	icon_state = "helmet_skrell_green"

	item_icons = list(
		slot_head_str = 'infinity/icons/mob/species/skrell/onmob_head_skrell.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_hats.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_hats.dmi'
		)

/obj/item/clothing/head/helmet/skrell/tan
	name = "tan skrellian helmet"
	desc = "A tan helmet built for use by a Skrell. This one appears to be fairly standard and reliable."
	icon = 'infinity/icons/obj/clothing/species/skrell/obj_head_skrell.dmi'
	icon_state = "helmet_skrell_tan"

	item_icons = list(
		slot_head_str = 'infinity/icons/mob/species/skrell/onmob_head_skrell.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_hats.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_hats.dmi'
		)

/obj/item/clothing/head/helmet/merc
	name = "combat helmet"
	desc = "A heavily reinforced helmet painted with red markings. Feels like it could take a lot of punishment."
	icon_state = "helmet_merc"
	icon = INF_CLOTHING_ICON_OBJ("head")
	item_icons = list(slot_head_str = INF_CLOTHING_ICON_MOB("head"))
	body_parts_covered = HEAD | FACE  // bcs spites have masks

/obj/item/clothing/head/helmet/tactical
	name = "tactical helmet"
	desc = "A tan helmet made from advanced ceramic. Comfortable and robust."
	icon_state = "helmet_tac"
	icon = INF_CLOTHING_ICON_OBJ("head")
	item_icons = list(slot_head_str = INF_CLOTHING_ICON_MOB("head"))
	body_parts_covered = HEAD | FACE // bcs spites have masks
