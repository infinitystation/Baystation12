/obj/item/clothing/glasses/sunglasses/lenses
	name = "small sun lenses"
	desc = "It looks fitted to nonhuman proportions. Usually, you can (?) see them in resomis' or monkeys' eyes."
	item_icons = list(slot_glasses_str = 'icons/mob/onmob/Resomi/masks.dmi')
	icon = 'icons/obj/clothing/infinity/glasses.dmi'
	icon_state = "sun_lenses"
	species_restricted = list(SPECIES_RESOMI)
	body_parts_covered = 0 //no real protection

/obj/item/clothing/glasses/sunglasses/sechud/lenses
	name = "small sechud lenses"
	desc = "Lenses with a HUD. This one has a sechud."
	flash_protection = FLASH_PROTECTION_MODERATE
	item_icons = list(slot_glasses_str = 'icons/mob/onmob/Resomi/masks.dmi')
	icon = 'icons/obj/clothing/infinity/glasses.dmi'
	icon_state = "sec_lenses"
	item_state = "sun_lenses" // no sec_lenses special sprite
	species_restricted = list(SPECIES_RESOMI)
	body_parts_covered = 0

/obj/item/clothing/glasses/hud/health/lenses
	name = "small medhud lenses"
	desc = "A small lenses that scans the creatures in view and provides accurate data about their health status."
	flash_protection = FLASH_PROTECTION_MODERATE
	item_icons = list(slot_glasses_str = 'icons/mob/onmob/Resomi/masks.dmi')
	icon = 'icons/obj/clothing/infinity/glasses.dmi'
	icon_state = "med_lenses"
	item_state = "sun_lenses" // no med_lenses special sprite
	darkness_view = -1
	species_restricted = list(SPECIES_RESOMI)
