/datum/gear/tactical/bloodpatch
	display_name = "blood patch selection"
	path = /obj/item/clothing/accessory/armor/tag
	allowed_roles = list(/datum/job/detective, /datum/job/officer, /datum/job/hos)

/datum/gear/tactical/bloodpatch/New()
	..()
	var/blatch = list()
	blatch["O+ blood patch"] = /obj/item/clothing/accessory/armor/tag/opos
	blatch["O- blood patch"] = /obj/item/clothing/accessory/armor/tag/oneg
	blatch["A+ blood patch"] = /obj/item/clothing/accessory/armor/tag/apos
	blatch["A- blood patch"] = /obj/item/clothing/accessory/armor/tag/aneg
	blatch["B+ blood patch"] = /obj/item/clothing/accessory/armor/tag/bpos
	blatch["B- blood patch"] = /obj/item/clothing/accessory/armor/tag/bneg
	blatch["AB+ blood patch"] = /obj/item/clothing/accessory/armor/tag/abpos
	blatch["AB- blood patch"] = /obj/item/clothing/accessory/armor/tag/abneg
	gear_tweaks += new/datum/gear_tweak/path(blatch)


/datum/gear/tactical/armor_pouches
	display_name = "armor pouches selection"
	path = /obj/item/clothing/accessory/storage/pouches
	allowed_roles = list(/datum/job/detective, /datum/job/officer, /datum/job/hos)
	cost = 3

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
	allowed_roles = list(/datum/job/detective, /datum/job/officer, /datum/job/hos)
	cost = 6

/datum/gear/tactical/large_pouches/New()
	..()
	var/lpouches = list()
	lpouches["large tan storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large/tan
	lpouches["large navy storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large/navy
	lpouches["large green storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large/green
	lpouches["large blue storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large/blue
	lpouches["large black storage pouches"] = /obj/item/clothing/accessory/storage/pouches/large
	gear_tweaks += new/datum/gear_tweak/path(lpouches)


/datum/gear/tactical/armor_deco
	display_name = "armor tags selection"
	path = /obj/item/clothing/accessory/armor/tag
	allowed_roles = list(/datum/job/detective, /datum/job/officer, /datum/job/hos)

/datum/gear/tactical/armor_deco/New()
	..()
	var/atags = list()
	atags["NTSF tag"] = /obj/item/clothing/accessory/armor/tag/nt
	atags["PCRC tag"] = /obj/item/clothing/accessory/armor/tag/pcrc
	atags["SAARE tag"] = /obj/item/clothing/accessory/armor/tag/saare
//	atags["SCP tag"] = /obj/item/clothing/accessory/armor/tag/scp
	atags["ZPCI tag"] = /obj/item/clothing/accessory/armor/tag/zpci
	gear_tweaks += new/datum/gear_tweak/path(atags)

/datum/gear/tactical/pcarrier
	display_name = "empty plate carriers selection"
	path = /obj/item/clothing/suit/armor/pcarrier
	cost = 1
	slot = slot_wear_suit
	allowed_roles = list(/datum/job/detective, /datum/job/officer, /datum/job/hos)

/datum/gear/tactical/pcarrier/New()
	..()
	var/armor = list()
	armor["black plate carrier"]	= /obj/item/clothing/suit/armor/pcarrier
	armor["blue plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/blue
	armor["navy plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/navy
	armor["green plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/green
	armor["tan plate carrier"] 		= /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(armor)

/datum/gear/tactical/gunciv
	display_name = "TH22 pistol selection"
	path = /obj/item/weapon/gun/projectile/spistol/civ
	cost = 2

/datum/gear/tactical/gunciv/New()
	..()
	var/gunciv = list()
	gunciv["Standard TH22"] = /obj/item/weapon/gun/projectile/spistol/civ
	gunciv["Black TH22"] = /obj/item/weapon/gun/projectile/spistol/civ/black
	gunciv["White TH22"] = /obj/item/weapon/gun/projectile/spistol/civ/white
	gunciv["Silver TH22"] = /obj/item/weapon/gun/projectile/spistol/civ/silver
	gear_tweaks += new/datum/gear/tactical/gunciv(gunciv)

/datum/gear/tactical/ammo
	display_name = "TH22 ammo box"
	path = /obj/item/ammo_magazine/box/pistol/civgun
	cost = 1

/datum/gear/tactical/gunciv/gold
	display_name = "TH22, luxury"
	path = /obj/item/weapon/gun/projectile/spistol/civ/gold
	cost = 19