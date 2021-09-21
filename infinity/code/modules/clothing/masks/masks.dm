/obj/item/clothing/mask/gas/alt
	name = "panoramic gas mask"
	icon = 'infinity/icons/obj/clothing/TG_copy/infinity_work.dmi'
	item_icons = list(slot_wear_mask_str = 'infinity/icons/mob/onmob/onmob_mask.dmi')
	icon_state = "gas_alt"
	item_state = "gas_alt"
	tint = 1
	flags_inv = HIDEEARS
	sprite_sheets = list(
		SPECIES_VOX = 'icons/mob/species/vox/onmob_mask_vox.dmi',
		SPECIES_VOX_ARMALIS = 'icons/mob/species/vox/onmob_mask_vox_armalis.dmi',
		SPECIES_TAJARA = 'icons/mob/species/tajaran/mask.dmi',
		SPECIES_UNATHI = 'icons/mob/onmob/Unathi/mask.dmi',
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_mask_resomi.dmi',
		SPECIES_EROSAN = 'infinity/icons/mob/species/erosan/mask.dmi',
		) //inf, was nothing

/obj/item/clothing/mask/balaclava/humanized
	name = "balaclava"
	desc = "Designed to both hide identities and keep your face comfy and warm. This one only for humans."
	icon = 'infinity/icons/obj/clothing/obj_mask.dmi'
	icon_state = "balaclava_black"
	item_state = "balaclava_black"
	down_icon_state = "balaclava_black_r"
	down_flags_inv = BLOCKHEADHAIR
	item_icons = list(
		slot_wear_mask_str = 'infinity/icons/mob/onmob/onmob_mask.dmi'
	)
	species_restricted = list(
		SPECIES_HUMAN
	)

/obj/item/clothing/mask/balaclava/humanized/black
	name = "black balaclava"
	icon_state = "balaclava_black"
	item_state = "balaclava_black"
	down_icon_state = "balaclava_black_r"

/obj/item/clothing/mask/balaclava/humanized/red
	name = "red balaclava"
	icon_state = "balaclava_red"
	item_state = "balaclava_red"
	down_icon_state = "balaclava_red_r"

/obj/item/clothing/mask/balaclava/humanized/blue
	name = "blue balaclava"
	icon_state = "balaclava_blue"
	item_state = "balaclava_blue"
	down_icon_state = "balaclava_blue_r"

/obj/item/clothing/mask/balaclava/humanized/green
	name = "green balaclava"
	icon_state = "balaclava_green"
	item_state = "balaclava_green"
	down_icon_state = "balaclava_green_r"

/obj/item/clothing/mask/balaclava/humanized/grey
	name = "grey balaclava"
	icon_state = "balaclava_grey"
	item_state = "balaclava_grey"
	down_icon_state = "balaclava_grey_r"
