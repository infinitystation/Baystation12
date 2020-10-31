/datum/gear/head/zhan_scarf/neck
	display_name = "(Tajara) Tua-Tari scarf"
	path = /obj/item/clothing/accessory/scarf/tajaran
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/thermal
	sort_category = "Xenowear"
	display_name = "thermal suit selection"
	path = /obj/item/clothing/under
	whitelisted = list(SPECIES_TAJARA, SPECIES_RESOMI)

/datum/gear/uniform/thermal/New()
	..()
	var/thermal = list()
	thermal["Tajara, white thermal suit"]= /obj/item/clothing/under/thermal/tajara
	thermal["Tajara, tacticool thermal suit"]= /obj/item/clothing/under/thermal/tajara/tactic
	thermal["Tajara, gray thermal suit"]= /obj/item/clothing/under/thermal/tajara/gray
	thermal["Tajara, black thermal suit"]= /obj/item/clothing/under/thermal/tajara/black
	thermal["Resomi, black thermal suit"]= /obj/item/clothing/under/thermal/resomi
	thermal["Resomi, white thermal suit"]= /obj/item/clothing/under/thermal/resomi/white
	gear_tweaks += new/datum/gear_tweak/path(thermal)

/datum/gear/accessory/amulet
	display_name = "(Tajara) talisman selection"
	path = /obj/item/clothing/accessory/amulet
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/accessory/amulet
	sort_category = "Xenowear"
	display_name = "(Tajara) talisman selection"
	path = /obj/item/clothing/accessory/amulet
	whitelisted = list(SPECIES_TAJARA)

/datum/gear/accessory/amulet/New()
	..()
	var/amuleten = list()
	amuleten["amulet"]= /obj/item/clothing/accessory/amulet/medium
	amuleten["averter"]= /obj/item/clothing/accessory/amulet/strong
	amuleten["talisman"]= /obj/item/clothing/accessory/amulet
	gear_tweaks += new/datum/gear_tweak/path(amuleten)
