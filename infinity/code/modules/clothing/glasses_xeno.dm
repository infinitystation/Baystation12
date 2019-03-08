/obj/item/clothing/glasses/sunglasses/lenses
	name = "small sun lenses"
	desc = "It looks fitted to nonhuman proportions. Usually, you can(?) see them in resomis' or monkeys' eyes."
	item_icons = list(slot_glasses_str = 'icons/mob/onmob/Resomi/eyes.dmi')
	icon = 'icons/obj/clothing/infinity/glasses.dmi'
	icon_state = "sun_lenses"
	item_state = null
	species_restricted = list(SPECIES_RESOMI)
	flash_protection = FLASH_PROTECTION_MODERATE
	body_parts_covered = 0

/obj/item/clothing/glasses/sunglasses/sechud/lenses
	name = "small sechud lenses"
	desc = "Lenses with a HUD. This one has a sechud."
	item_icons = list(slot_glasses_str = 'icons/mob/onmob/Resomi/eyes.dmi')
	icon = 'icons/obj/clothing/infinity/glasses.dmi'
	icon_state = "sec_lenses"
	item_state = null
	species_restricted = list(SPECIES_RESOMI)
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/hud/health/lenses
	name = "small medhud lenses"
	desc = "A small lenses that scans the creatures in view and provides accurate data about their health status."
	item_icons = list(slot_glasses_str = 'icons/mob/onmob/Resomi/eyes.dmi')
	icon = 'icons/obj/clothing/infinity/glasses.dmi'
	icon_state = "med_lenses"
	item_state = null
	flash_protection = FLASH_PROTECTION_MODERATE
	species_restricted = list(SPECIES_RESOMI)
