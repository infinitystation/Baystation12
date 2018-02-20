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