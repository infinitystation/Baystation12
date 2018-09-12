/datum/gear/accessory/talisman
	display_name = "bone talisman"
	path = /obj/item/clothing/accessory/necklace/talisman

/datum/gear/accessory/collar
	display_name = "collar selection"
	path = /obj/item/clothing/accessory/necklace/collar

/datum/gear/accessory/collar/New()
	..()
	var/collar = list()
	collar["gold collar"] = /obj/item/clothing/accessory/necklace/collar/gold
	collar["bell collar"] = /obj/item/clothing/accessory/necklace/collar/bell
	collar["spike collar"] = /obj/item/clothing/accessory/necklace/collar/spike
	collar["pink collar"] = /obj/item/clothing/accessory/necklace/collar/pink
	collar["holo collar"] = /obj/item/clothing/accessory/necklace/collar/holo
	gear_tweaks += new/datum/gear_tweak/path(collar)
/*
/datum/gear/music
	display_name = "instruments selection"
	description = "Musical instruments. Be ready for tomatoes and a spoiled eggs!"
	path = /obj/item/device

/datum/gear/music/New()
	..()
	var/instruments = list()
	instruments["violin"] = /obj/item/device/violin
	instruments["guitar"] = /obj/item/device/guitar
	gear_tweaks += new /datum/gear_tweak/path(instruments)
*/
/datum/gear/head/kittyears
	display_name = "fake kitty ears"
	path = /obj/item/clothing/head/kitty/fake
	sort_category = "Earwear"

/datum/gear/tactical/bloodpatch
	display_name = "blood patch selection"
	path = /obj/item/clothing/accessory/armor/tag/opos

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
	blatch += new/datum/gear_tweak/path(blatch)
