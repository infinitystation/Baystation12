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
	display_name = "(Tajara) talisman"
	path = /obj/item/clothing/accessory/amulet
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA)

/datum/gear/accessory/amulet/medium
	display_name = "(Tajara) amulet"
	path = /obj/item/clothing/accessory/amulet/medium
	cost = 3

/datum/gear/accessory/amulet/stronk
	display_name = "(Tajara) averter"
	path = /obj/item/clothing/accessory/amulet/stronk
	cost = 6

/datum/gear/utility/light
	sort_category = "Xenowear"
	display_name = "(Dionae) light source selection"
	path = /obj/item/device/flashlight
	whitelisted = list(SPECIES_DIONA)
	cost = 5

/datum/gear/utility/light/New()
	..()
	var/light = list()
	light["maglight"]= /obj/item/device/flashlight/maglight
	light["lantern"]= /obj/item/device/flashlight/lantern
	light["glowing slime extract"]= /obj/item/device/flashlight/slime
	light["duty flashlight"]= /obj/item/device/flashlight/upgraded
	gear_tweaks += new/datum/gear_tweak/path(light)
