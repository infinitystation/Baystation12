/*********************
 tactical accessories
*********************/
/datum/gear/tactical/ubac
	display_name = "UBAC shirt selection"
	path = /obj/item/clothing/accessory/ubac
	allowed_roles = list(/datum/job/exploration_leader, /datum/job/explorer, /datum/job/explorer_pilot, /datum/job/explorer_medic, /datum/job/explorer_engineer, /datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/officer) //camo + tactical
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/tactical/armor_deco
	allowed_roles = list(/datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/officer)

/datum/gear/tactical/helm_covers
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/armor_pouches
	display_name = "armor pouches selection"
	path = /obj/item/clothing/accessory/storage/pouches
	cost = 3
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/armor_pouches/New()
	..()
	var/pouches = list()
	pouches["tan storage pouches"] = /obj/item/clothing/accessory/storage/pouches/tan
	pouches["navy storage pouches"] = /obj/item/clothing/accessory/storage/pouches/navy
	pouches["green storage pouches"] = /obj/item/clothing/accessory/storage/pouches/green
	pouches["blue storage pouches"] = /obj/item/clothing/accessory/storage/pouches/blue
	pouches["black storage pouches"] = /obj/item/clothing/accessory/storage/pouches
	gear_tweaks += new/datum/gear_tweak/path(pouches)

/datum/gear/tactical/large_pouches
	display_name = "large armor pouches selection"
	path = /obj/item/clothing/accessory/storage/pouches/large
	cost = 6
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/large_pouches/New()
	..()
	var/lpouches = list()
	lpouches["large tan storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large/tan
	lpouches["large navy storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large/navy
	lpouches["large green storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large/green
	lpouches["large blue storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large/blue
	lpouches["large black storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large
	gear_tweaks += new/datum/gear_tweak/path(lpouches)

/datum/gear/tactical/tacticool

/datum/gear/tactical/bloodpatch
	allowed_roles = ARMED_ROLES

/datum/gear/tactical/holster
	allowed_roles = ARMED_ROLES
/*
/datum/gear/tactical/pcarrier_press
	display_name = "journalist's plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier/light/press
	cost = 3
	allowed_roles = list("Journalist") //etc.broken
*/
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

/datum/gear/tactical/security_uniforms
	display_name = "security uniform"
	allowed_roles = SECURITY_ROLES
	path = /obj/item/clothing/under
	slot = slot_w_uniform

/datum/gear/tactical/security_uniforms/New()
	..()
	var/uniforms = list()
	uniforms +=	/obj/item/clothing/under/rank/security/corp/alt
	uniforms +=	/obj/item/clothing/under/rank/security/navyblue
	uniforms +=	/obj/item/clothing/under/rank/security/navyblue/alt
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(uniforms)

/datum/gear/tactical/camo_inf/
	display_name = "camo uniform - colorable"
	allowed_roles = SECURITY_ROLES
	path = /obj/item/clothing/under/gray_camo
	slot = slot_w_uniform
	flags = GEAR_HAS_COLOR_SELECTION

