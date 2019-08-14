//Try to keep this limited. I don't want unique solgov or NT items in here, it should only be things that require the sierra map datums like access.

/obj/item/weapon/rig/hazard/guard
	name = "hazard hardsuit control module"

/obj/item/clothing/head/helmet/space/rig/hazard/guard
	camera = /obj/machinery/camera/network/research

/obj/item/weapon/rig/hazard/guard

	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/mounted/taser
		)

/obj/item/clothing/head/helmet/space/void/exploration
	name = "exploration voidsuit helmet"
	desc = "A helmet of Exoplanet Exploration Unit, standard issue for Expeditionary Corps away missions. It has an armored glass dome for superiour visibility and extra anti-radiation lining."
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')
	icon_state = "helm_explorer"
	sprite_sheets = list(
		SPECIES_SKRELL = 'maps/torch/icons/mob/skrell/onmob_head_solgov_skrell.dmi',
		SPECIES_TAJARA = 'icons/mob/species/tajaran/helmet.dmi',
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_head_resomi.dmi'
		)
	sprite_sheets_obj = list(
		SPECIES_TAJARA = 'icons/obj/clothing/species/tajaran/hats.dmi',
		SPECIES_RESOMI = 'infinity/icons/obj/clothing/species/resomi/obj_head_resomi.dmi'
		)
	armor = list(melee = 30, bullet = 10, laser = 15,energy = 45, bomb = 30, bio = 100, rad = 90)
	light_overlay = "yellow_light"
	tinted = FALSE
	tint = 1 //at standart, should be 2

/obj/item/clothing/suit/space/void/exploration
	name = "exploration voidsuit"
	icon = 'maps/torch/icons/obj/obj_suit_solgov.dmi' //torch, anyway
	item_icons = list(slot_wear_suit_str = 'maps/torch/icons/mob/onmob_suit_solgov.dmi')
	desc = "The bulky Exoplanet Exploration Unit is a standard voidsuit for Expeditionary Corps field operations. It features extra padding and respectable radiation-resistant lining."
	icon_state = "void_explorer"
	sprite_sheets = list(
		SPECIES_UNATHI = 'maps/torch/icons/mob/unathi/onmob_suit_solgov_unathi.dmi',
		SPECIES_TAJARA = 'icons/mob/species/tajaran/suit.dmi',
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_suit_resomi.dmi'
		)
	sprite_sheets_obj = list(
		SPECIES_TAJARA = 'icons/obj/clothing/species/tajaran/suits.dmi',
		SPECIES_RESOMI = 'infinity/icons/obj/clothing/species/resomi/obj_suit_resomi.dmi'
		)
	armor = list(melee = 40, bullet = 10, laser = 15,energy = 45, bomb = 30, bio = 100, rad = 90)
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/stack/flag,/obj/item/device/scanner/health,/obj/item/device/gps,/obj/item/weapon/pinpointer/radio,/obj/item/device/radio/beacon,/obj/item/weapon/material/hatchet/machete,/obj/item/weapon/shovel)
