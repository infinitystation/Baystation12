/obj/item/clothing/suit/bio_suit/anomaly
	name = "anomaly suit"
	desc = "A suit that protects against exotic alien energies and biological contamination."
	icon = 'icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/onmob_suit.dmi')
	icon_state = "bio_anom"
//[INF]
	sprite_sheets = list(
		SPECIES_TAJARA = 'icons/mob/species/tajaran/suit.dmi'
		)
//[/INF]

/obj/item/clothing/head/bio_hood/anomaly
	name = "anomaly hood"
	desc = "A hood that protects the head and face from exotic alien energies and biological contamination."
	icon = 'icons/obj/clothing/obj_head.dmi'
	item_icons = list(slot_head_str = 'icons/mob/onmob/onmob_head.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_hats.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_hats.dmi')
	icon_state = "bio_anom"
	item_state = "bio_anom"
//[INF]
	sprite_sheets = list(
		SPECIES_TAJARA = 'icons/mob/species/tajaran/helmet.dmi'
		)
//[/INF]

/obj/item/clothing/suit/space/void/excavation
	name = "excavation voidsuit"
	desc = "A specially shielded voidsuit that insulates against some exotic alien energies, as well as the more mundane dangers of excavation."
	icon_state = "rig-excavation"
	item_state = "rig-excavation"
	sprite_sheets = list(
		SPECIES_TAJARA = 'icons/mob/species/tajaran/suit.dmi',
		SPECIES_EROSAN = 'infinity/icons/mob/species/erosan/suit.dmi',
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_suit_resomi.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_suit_unathi.dmi',
		SPECIES_SKRELL = 'icons/mob/species/skrell/onmob_suit_skrell.dmi',
		)
	sprite_sheets_obj = list(
		SPECIES_TAJARA = 'icons/obj/clothing/species/tajaran/suits.dmi',
		SPECIES_EROSAN = 'infinity/icons/obj/clothing/species/erosan/suits.dmi',
		SPECIES_RESOMI = 'infinity/icons/obj/clothing/species/resomi/obj_suit_resomi.dmi',
		SPECIES_UNATHI = 'icons/obj/clothing/species/unathi/obj_suit_unathi.dmi',
		SPECIES_SKRELL = 'icons/obj/clothing/species/skrell/obj_suit_skrell.dmi',
		)
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/stack/flag,/obj/item/storage/excavation,/obj/item/pickaxe,/obj/item/device/scanner/health,/obj/item/device/measuring_tape,/obj/item/device/ano_scanner,/obj/item/device/depth_scanner,/obj/item/device/core_sampler,/obj/item/device/gps,/obj/item/pinpointer/radio,/obj/item/device/radio/beacon,/obj/item/pickaxe/xeno,/obj/item/storage/bag/fossils)

/obj/item/clothing/head/helmet/space/void/excavation
	name = "excavation voidsuit helmet"
	desc = "A sophisticated voidsuit helmet, capable of protecting the wearer from many exotic alien energies."
	icon_state = "rig0-excavation"
	item_state = "excavation-helm"
	sprite_sheets = list(
		SPECIES_TAJARA = 'icons/mob/species/tajaran/helmet.dmi',
		SPECIES_EROSAN = 'infinity/icons/mob/species/erosan/helmet.dmi',
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_head_resomi.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_helmet_unathi.dmi',
		SPECIES_SKRELL = 'icons/mob/species/skrell/onmob_head_skrell.dmi',
		)
	sprite_sheets_obj = list(
		SPECIES_TAJARA = 'icons/obj/clothing/species/tajaran/hats.dmi',
		SPECIES_EROSAN = 'infinity/icons/obj/clothing/species/erosan/hats.dmi',
		SPECIES_RESOMI = 'infinity/icons/obj/clothing/species/resomi/obj_head_resomi.dmi',
		SPECIES_UNATHI = 'icons/obj/clothing/species/unathi/obj_head_unathi.dmi',
		SPECIES_SKRELL = 'icons/obj/clothing/species/skrell/obj_head_skrell.dmi',
		)
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)
	light_overlay = "hardhat_light"

/obj/item/clothing/suit/space/void/excavation/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/excavation
	boots = /obj/item/clothing/shoes/magboots

/obj/item/storage/belt/archaeology
	name = "excavation gear-belt"
	desc = "Can hold various excavation gear."
	icon_state = "gearbelt"
	item_state = ACCESSORY_SLOT_UTILITY
	can_hold = list(
		/obj/item/storage/box/samplebags,
		/obj/item/device/core_sampler,
		/obj/item/pinpointer/radio,
		/obj/item/device/radio/beacon,
		/obj/item/device/gps,
		/obj/item/device/measuring_tape,
		/obj/item/device/flashlight,
		/obj/item/pickaxe,
		/obj/item/device/depth_scanner,
		/obj/item/device/camera,
		/obj/item/paper,
		/obj/item/photo,
		/obj/item/folder,
		/obj/item/pen,
		/obj/item/folder,
		/obj/item/material/clipboard,
		/obj/item/anodevice,
		/obj/item/clothing/glasses,
		/obj/item/wrench,
		/obj/item/storage/excavation,
		/obj/item/anobattery,
		/obj/item/device/ano_scanner,
		/obj/item/taperoll,
		/obj/item/pickaxe/xeno/hand)
