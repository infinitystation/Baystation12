//unathi peacoat

/obj/item/clothing/suit/storage/peacoat //a custom item... for now
	name = "peacoat"
	desc = "A custom made heavy pea coat. Looks like it is made of dark wool."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "peacoat"
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand.dmi'
	)
	item_state_slots = list(
		slot_l_hand_str = "jensencoat",
		slot_r_hand_str = "jensencoat",
		)
	sprite_sheets = list(
		SPECIES_VOX = 'icons/mob/species/vox/onmob_suit_vox.dmi',
		SPECIES_VOX_ARMALIS = 'icons/mob/species/vox/onmob_suit_vox_armalis.dmi',
		SPECIES_UNATHI = 'infinity/icons/mob/species/unathi/suit.dmi', //custom way,
		SPECIES_NABBER = 'icons/mob/species/nabber/onmob_suit_gas.dmi',
		SPECIES_MANTID_ALATE = 'icons/mob/species/mantid/onmob_suit_alate.dmi',
		SPECIES_MANTID_GYNE = 'icons/mob/species/mantid/onmob_suit_gyne.dmi',
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_suit_resomi.dmi'
		)
	trade_blacklisted = TRUE
