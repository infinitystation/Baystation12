/obj/item/clothing/suit/armor/pcarrier/troops
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/solgov)

/obj/item/clothing/suit/armor/pcarrier/troops/heavy
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/armguards, /obj/item/clothing/accessory/legguards, /obj/item/clothing/accessory/storage/pouches)

/obj/item/clothing/suit/armor/pcarrier/troops/heavy_pcrc
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/armguards, /obj/item/clothing/accessory/legguards, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/pcrc)

/obj/item/clothing/suit/armor/pcarrier/troops/heavy_scg
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/armguards, /obj/item/clothing/accessory/legguards, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/solgov)

/obj/item/clothing/suit/armor/pcarrier/troops/medical
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches)

/obj/item/clothing/head/helmet/solgov/green
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/green)

/obj/item/clothing/head/helmet/solgov/tan
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/tan)

/obj/item/clothing/head/helmet/solgov/navy
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/navy)

/*
 * RESOMI
 */

/obj/item/clothing/under/solgov/pt/expeditionary/resomi
	name = "small expeditionary pt smock"
	desc = "It looks fitted to nonhuman proportions."
	icon = 'infinity/icons/obj/clothing/species/resomi/obj_under_resomi.dmi'
	item_icons = list('infinity/icons/mob/species/resomi/onmob_under_resomi.dmi')
	icon_state = "resomi_expeditionpt"
	worn_state = "resomi_expeditionpt"
	species_restricted = list(SPECIES_RESOMI)
	sprite_sheets = list(SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_under_resomi.dmi')

/obj/item/clothing/under/solgov/utility/expeditionary/resomi
	name = "small expeditionary uniform"
	desc = "It looks fitted to nonhuman proportions."
	icon = 'infinity/icons/obj/clothing/species/resomi/obj_under_resomi.dmi'
	item_icons = list('infinity/icons/mob/species/resomi/onmob_under_resomi.dmi')
	icon_state = "resomi_blackutility"
	worn_state = "resomi_blackutility"
	species_restricted = list(SPECIES_RESOMI)
	sprite_sheets = list(SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_under_resomi.dmi')

/obj/item/clothing/under/solgov/utility/expeditionary/officer/resomi
	name = "small expeditionary officer's uniform"
	desc = "It looks fitted to nonhuman proportions."
	icon = 'infinity/icons/obj/clothing/species/resomi/obj_under_resomi.dmi'
	item_icons = list('infinity/icons/mob/species/resomi/onmob_under_resomi.dmi')
	icon_state = "resomi_blackutility_com"
	worn_state = "resomi_blackutility_com"
	species_restricted = list(SPECIES_RESOMI)
	sprite_sheets = list(SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_under_resomi.dmi')
	starting_accessories = list(/obj/item/clothing/accessory/solgov/department/command)

/obj/item/clothing/under/solgov/mildress/expeditionary/resomi
	name = "small expeditionary dress uniform"
	desc = "It looks fitted to nonhuman proportions."
	icon = 'infinity/icons/obj/clothing/species/resomi/obj_under_resomi.dmi'
	item_icons = list('infinity/icons/mob/species/resomi/onmob_under_resomi.dmi')
	icon_state = "resomi_greydress"
	worn_state = "resomi_greydress"
	species_restricted = list(SPECIES_RESOMI)
	sprite_sheets = list(SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_under_resomi.dmi')

/*
 * "Old" fleet uniform
 */

/obj/item/clothing/under/solgov/fleet/special
	name = "old fleet utility"
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	icon_override = 'infinity/icons/mob/onmob/onmob_under.dmi'
	icon_state = "fleet"
	worn_state = "fleet"

/obj/item/clothing/under/solgov/fleet/special/officer
	name = "old fleet command utility"
	icon_state = "fleet_of"
	starting_accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet)

/obj/item/clothing/under/solgov/fleet/special/officer/commander
	name = "old fleet high command uniform"
	icon_state = "fleet_com"
	starting_accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet)

/obj/item/clothing/head/soft/solgov/fleet_special
	name = "old fleet cap"
	desc = "A navy blue utility cover bearing the crest of the SCG Fleet."
	icon = 'infinity/icons/obj/clothing/obj_head.dmi'
	icon_override = 'infinity/icons/mob/onmob/onmob_head.dmi'
	icon_state = "fleetsoft"