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
	path = /obj/item/clothing/accessory/armor/tag

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

/datum/gear/tactical/armor_deco/New()
	..()
	var/atags = list()
	atags["NTSF tag"] = /obj/item/clothing/accessory/armor/tag/nt
	atags["PCRC tag"] = /obj/item/clothing/accessory/armor/tag/pcrc
	atags["SAARE tag"] = /obj/item/clothing/accessory/armor/tag/saare
	atags["SCP tag"] = /obj/item/clothing/accessory/armor/tag/scp
	atags["ZPCI tag"] = /obj/item/clothing/accessory/armor/tag/zpci
	gear_tweaks += new/datum/gear_tweak/path(atags)

/datum/gear/eyes/security/goggles
	display_name = "Security HUD goggles"
	path = /obj/item/clothing/glasses/sunglasses/sechud/goggles

/datum/gear/zippo_decorated
	display_name = "zippo (decorated)"
	path = /obj/item/weapon/flame/lighter/zippo/infinity
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/utility/pda
	display_name = "PDA selection"
	path = /obj/item/modular_computer/pda
	cost = 2

/datum/gear/utility/pda/New()
	..()
	var/pdas = list()
	pdas["grey"]                    = /obj/item/modular_computer/pda
	pdas["grey-red (sec)"]          = /obj/item/modular_computer/pda/security
	pdas["lightgrey-brown (sup)"]   = /obj/item/modular_computer/pda/cargo
	pdas["lightgrey-yellow (eng)"]  = /obj/item/modular_computer/pda/engineering
	pdas["navy (heads)"]            = /obj/item/modular_computer/pda/heads
	pdas["navy-red (hos)"]          = /obj/item/modular_computer/pda/heads/hos
	pdas["navy-gold (capt)"]        = /obj/item/modular_computer/pda/captain
	pdas["navy-blue (cmo)"]         = /obj/item/modular_computer/pda/heads/cmo
	pdas["navy-white (hop)"]        = /obj/item/modular_computer/pda/heads/hop
	pdas["navy-yellow (ce)"]        = /obj/item/modular_computer/pda/heads/ce
	pdas["navy-darkgreen (rd)"]     = /obj/item/modular_computer/pda/heads/rd
	pdas["white-blue (med)"]        = /obj/item/modular_computer/pda/medical
	pdas["white-purple (exp)"]      = /obj/item/modular_computer/pda/explorer
	pdas["white-darkgreen (sci)"]   = /obj/item/modular_computer/pda/science
	pdas["white-yellowblue (robot)"]= /obj/item/modular_computer/pda/roboticist
	pdas["black (mercs)"]           = /obj/item/modular_computer/pda/syndicate
	gear_tweaks += new/datum/gear_tweak/path(pdas)
