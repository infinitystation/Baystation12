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

/datum/gear/eyes/security/goggles
	display_name = "Security HUD goggles"
	path = /obj/item/clothing/glasses/sunglasses/sechud/goggles

/datum/gear/zippo_decorated
	display_name = "zippo (decorated)"
	path = /obj/item/weapon/flame/lighter/zippo/infinity
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/accessory/tags
	display_name = "dog tags"
	path = /obj/item/clothing/accessory/badge/dog_tags

/datum/gear/uniform/pmc
	display_name = "PMC uniform selection"
	allowed_roles = list(/datum/job/detective, /datum/job/officer, /datum/job/hos)
	path = /obj/item/clothing/under

/datum/gear/uniform/pmc/New()
	..()
	var/pmc = list()
	pmc["SAARE utility uniform"]= /obj/item/clothing/under/saare
	pmc["PCRC utility uniform"]	= /obj/item/clothing/under/pcrc
	pmc["PCRC formal uniform"]	= /obj/item/clothing/under/pcrcsuit
	pmc["SCP utility uniform"]	= /obj/item/clothing/under/scp_uniform
	pmc["ZPCI utility uniform"]	= /obj/item/clothing/under/zpci_uniform
	gear_tweaks += new/datum/gear_tweak/path(pmc)

/datum/gear/head/scp_cap
	display_name = "SCP cap"
	path = /obj/item/clothing/head/soft/scp_cap
	allowed_roles = list(/datum/job/detective, /datum/job/officer, /datum/job/hos)

/datum/gear/gloves/insulated
	display_name = "insulated gloves selection"
	path = /obj/item/clothing/gloves/insulated
//	allowed_roles = write_engineers_here
	cost = 3

/datum/gear/gloves/insulated/New()
	..()
	var/glovtype = list()
	glovtype["yellow insulated"] = /obj/item/clothing/gloves/insulated
	glovtype["black insulated"] = /obj/item/clothing/gloves/insulated/black
	gear_tweaks += new/datum/gear_tweak/path(glovtype)
