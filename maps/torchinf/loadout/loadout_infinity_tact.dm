/*********************
 tactical accessories
*********************/
/datum/gear/tactical/ubac
	display_name = "UBAC shirt selection"
	path = /obj/item/clothing/accessory/ubac
	allowed_roles = MILITARY_ROLES
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/tactical/armor_decor
	display_name = "armor tags selection"
	path = /obj/item/clothing/accessory/armor/tag
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/armor_decor/New()
	..()
	var/artags = list()
	artags["NTSF tag"] = /obj/item/clothing/accessory/armor/tag/nt
	artags["PCRC tag"] = /obj/item/clothing/accessory/armor/tag/pcrc
	artags["SAARE tag"] = /obj/item/clothing/accessory/armor/tag/saare
	artags["SCP tag"] = /obj/item/clothing/accessory/armor/tag/scp
	artags["SCG tag"] = /obj/item/clothing/accessory/armor/tag/solgov
	gear_tweaks += new/datum/gear_tweak/path(artags)

/datum/gear/tactical/armor_pouches
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/large_pouches
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/tacticool
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/bloodpatch
	allowed_roles = ARMED_ROLES

/datum/gear/tactical/pcarrier_press
	display_name = "journalist's plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier/light/press
	cost = 3
	allowed_roles = list("Journalist")

/datum/gear/tactical/pcarrier
	display_name = "empty plate carriers selection"
	path = /obj/item/clothing/suit/armor/pcarrier
	cost = 1
	slot = slot_wear_suit
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/pcarrier/New()
	..()
	var/armor = list()
	armor["black plate carrier"]	= /obj/item/clothing/suit/armor/pcarrier
	armor["blue plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/blue
	armor["navy plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/navy
	armor["green plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/green
	armor["tan plate carrier"] 		= /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(armor)
