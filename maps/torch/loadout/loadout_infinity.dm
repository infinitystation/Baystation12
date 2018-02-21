/datum/gear/suit/special
	display_name = "special jackets selection"

/datum/gear/suit/special/New()
	..()
	var/sjackets = list()
	sjackets += /obj/item/clothing/suit/storage/toggle/longjacket
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(sjackets)

/datum/gear/accessory/talisman
	display_name = "bone talisman"
	path = /obj/item/clothing/accessory/necklace/talisman

/datum/gear/accessory/collar
	display_name = "collar selection"

/datum/gear/accessory/collar/New()
	..()
	var/collar = list()
	collar += /obj/item/clothing/accessory/necklace/collar
	collar += /obj/item/clothing/accessory/necklace/collar/gold
	collar += /obj/item/clothing/accessory/necklace/collar/bell
	collar += /obj/item/clothing/accessory/necklace/collar/spike
	collar += /obj/item/clothing/accessory/necklace/collar/pink
	collar += /obj/item/clothing/accessory/necklace/collar/holo
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(collar)