/obj/item/clothing/mask/gas/alt
	icon = 'icons/obj/clothing/infinity/TG_copy/infinity_work.dmi'
	icon_state = "gas_alt"
	item_icons = list(slot_wear_mask_str = 'icons/mob/infinity/masks.dmi')
	flags_inv = HIDEEARS|HIDEFACE

/obj/item/clothing/mask/gas/creo
	name = "heavy unit mask"
	desc = "BFM \"Cyclops\" - A plasteel military facemask designed with intimidation in mind. Has an in-built voice amplifier and enchanced optics to assist it's wearer in combat situation assessment and control. Due to higher production value issued only to promising combat personnel."
	icon_override = 'icons/mob/infinity/masks.dmi'
	icon_state = "creo"
	item_state = "creo"
	item_flags = ITEM_FLAG_BLOCK_GAS_SMOKE_EFFECT | ITEM_FLAG_AIRTIGHT
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_NORMAL
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 0, bomb = 0, bio = 75, rad = 0)

/obj/item/clothing/mask/gas/creo/update_icon()
	overlays.Cut()
	var/image/eye = overlay_image(icon, "[icon_state]_eye")
	overlays += eye

/obj/item/clothing/mask/gas/creo/get_mob_overlay(mob/user_mob, slot)
	var/image/res = ..()
	var/image/eye = overlay_image(res.icon, "[icon_state]_eye")
	eye.layer = ABOVE_LIGHTING_LAYER
	eye.plane = EFFECTS_ABOVE_LIGHTING_PLANE
	res.overlays += eye
	return res