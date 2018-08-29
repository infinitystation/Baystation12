/*********************
 tactical accessories
*********************/
/datum/gear/tactical/ubac
	display_name = "UBAC shirt selection"
	path = /obj/item/clothing/accessory/ubac
	allowed_roles = list(SOLGOV_ROLES, SECURITY_ROLES) //camo + tactical
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/tactical/armor_pouches
	display_name = "black armor pouches"
	path = /obj/item/clothing/accessory/storage/pouches
	cost = 2
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/large_pouches
	display_name = "black large armor pouches"
	path = /obj/item/clothing/accessory/storage/pouches/large
	cost = 5
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/holster
	allowed_roles = ARMED_ROLES

/datum/gear/tactical/large_pouches
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/armor_deco
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/helm_covers
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/tacticool

/datum/gear/tactical/press_tag
	display_name = "Press tag"
	path = /obj/item/clothing/accessory/armor/tag/press
	allowed_roles = list("Journalist")

/datum/gear/tactical/pcarrier/navy
	display_name = "journalist's navy plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier/light/press
	allowed_roles = list("Journalist")

/datum/gear/tactical/pcarrier
	display_name = "plate carriers selection"
	path = /obj/item/clothing/suit/armor/pcarrier
	cost = 1
	slot = slot_wear_suit
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/pcarrier/New()
	..()
	var/cool_armors = list()
	cool_armors["black plate carrier"] = /obj/item/clothing/suit/armor/pcarrier
	cool_armors["blue plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/blue
	cool_armors["navy plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/navy
	cool_armors["green plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/green
	cool_armors["tan plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(cool_armors)

