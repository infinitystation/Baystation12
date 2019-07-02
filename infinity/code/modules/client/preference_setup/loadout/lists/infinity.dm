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

/* moved into maps/sierra/loadout/tactical due torch's problems
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
*/

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
	slot = slot_wear_id
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

/datum/gear/utility/pda/spawn_on_mob(var/mob/living/carbon/human/H, var/metadata)
	var/obj/item/modular_computer/pda/item = spawn_item(H, metadata)
	var/obj/item/weapon/card/id = H.GetIdCard()
	if(id)
		item.attackby(id, H)
	if(item.tesla_link && !istype(H, /mob/living/carbon/human/dummy))	//PDA in loadout shouldn't work
		item.turn_on()
	if(H.equip_to_slot_if_possible(item, slot, del_on_fail = 1))
		. = item

/datum/gear/utility/wrist_computer
	display_name = "Wrist computer selection"
	path = /obj/item/modular_computer/pda/wrist
	cost = 2

/datum/gear/utility/wrist_computer/New()
	..()
	var/wcomp = list()
	slot = slot_wear_id
	wcomp["black"]                   = /obj/item/modular_computer/pda/wrist/
	wcomp["lightgrey"]               = /obj/item/modular_computer/pda/wrist/grey
	wcomp["black-red (sec)"]         = /obj/item/modular_computer/pda/wrist/security
	wcomp["brown (sup)"]             = /obj/item/modular_computer/pda/wrist/cargo
	wcomp["yellow (eng)"]            = /obj/item/modular_computer/pda/wrist/engineering
	wcomp["navy (heads)"]            = /obj/item/modular_computer/pda/wrist/heads
	wcomp["navy-red (hos)"]          = /obj/item/modular_computer/pda/wrist/heads/hos
	wcomp["navy-gold (capt)"]        = /obj/item/modular_computer/pda/wrist/captain
	wcomp["navy-blue (cmo)"]         = /obj/item/modular_computer/pda/wrist/heads/cmo
	wcomp["navy-white (hop)"]        = /obj/item/modular_computer/pda/wrist/heads/hop
	wcomp["navy-yellow (ce)"]        = /obj/item/modular_computer/pda/wrist/heads/ce
	wcomp["navy-darkgreen (rd)"]     = /obj/item/modular_computer/pda/wrist/heads/rd
	wcomp["blue (med)"]              = /obj/item/modular_computer/pda/wrist/medical
	wcomp["purple (exp)"]            = /obj/item/modular_computer/pda/wrist/explorer
	wcomp["lightgrey-darkgreen (sci)"]   = /obj/item/modular_computer/pda/wrist/science
	wcomp["lightgrey-yellowblue (robot)"]= /obj/item/modular_computer/pda/wrist/roboticist
	wcomp["black (mercs)"]           = /obj/item/modular_computer/pda/wrist/syndicate
	wcomp["short (lightgrey)"]       = /obj/item/modular_computer/pda/wrist/lila
	wcomp["short (black)"]           = /obj/item/modular_computer/pda/wrist/lila/black
	gear_tweaks += new/datum/gear_tweak/path(wcomp)

/datum/gear/utility/wrist_computer/spawn_on_mob(var/mob/living/carbon/human/H, var/metadata)
	var/obj/item/modular_computer/pda/wrist/item = spawn_item(H, metadata)
	var/obj/item/weapon/card/id = H.GetIdCard()
	if(id)
		item.attackby(id, H)
	if(item.tesla_link && !istype(H, /mob/living/carbon/human/dummy))	//PDA in loadout shouldn't work
		item.turn_on()
	if(H.equip_to_slot_if_possible(item, slot, del_on_fail = 1))
		. = item
