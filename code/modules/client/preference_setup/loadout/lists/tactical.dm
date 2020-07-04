/datum/gear/tactical/
	sort_category = "Tactical Equipment"
	category = /datum/gear/tactical/
	slot = slot_tie

/datum/gear/tactical/armor_deco
	display_name = "armor customization"
	path = /obj/item/clothing/accessory/armor/tag
	flags = GEAR_HAS_SUBTYPE_SELECTION

/datum/gear/tactical/helm_covers
	display_name = "helmet covers"
	path = /obj/item/clothing/accessory/armor/helmcover
//INF	flags = GEAR_HAS_SUBTYPE_SELECTION
//[INF]
/datum/gear/tactical/helm_covers/New()
	..()
	var/helm_covers = list()
	helm_covers += /obj/item/clothing/accessory/armor/helmcover/blue
	helm_covers += /obj/item/clothing/accessory/armor/helmcover/navy
	helm_covers += /obj/item/clothing/accessory/armor/helmcover/green
	helm_covers += /obj/item/clothing/accessory/armor/helmcover/tan
	helm_covers += /obj/item/clothing/accessory/armor/helmcover/nt
	helm_covers += /obj/item/clothing/accessory/armor/helmcover/pcrc
	helm_covers += /obj/item/clothing/accessory/armor/helmcover/saare
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(helm_covers)
//[/INF]
/datum/gear/tactical/kneepads
	display_name = "kneepads"
	path = /obj/item/clothing/accessory/kneepads

/datum/gear/tactical/holster
	display_name = "holster selection"
	path = /obj/item/clothing/accessory/storage/holster
	cost = 3
//[INF]
/datum/gear/tactical/holster/New()
	..()
	var/holsters = list()
	holsters += /obj/item/clothing/accessory/storage/holster
	holsters += /obj/item/clothing/accessory/storage/holster/armpit
	holsters += /obj/item/clothing/accessory/storage/holster/hip
	holsters += /obj/item/clothing/accessory/storage/holster/thigh
	holsters += /obj/item/clothing/accessory/storage/holster/waist
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(holsters)
//[/INF]
/datum/gear/tactical/sheath
	display_name = "machete sheath"
	path = /obj/item/clothing/accessory/storage/holster/machete

/datum/gear/tactical/tacticool
	display_name = "tacticool turtleneck"
	path = /obj/item/clothing/under/syndicate/tacticool
	slot = slot_w_uniform
