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
	whitelisted = list(SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_SKRELL, SPECIES_TAJARA, SPECIES_RESOMI)

/datum/gear/uniform/thermal/New()
	..()
	var/thermal = list()
	thermal["Tajara, white thermal suit"]= /obj/item/clothing/under/thermal/tajara
	thermal["Tajara, tacticool thermal suit"]= /obj/item/clothing/under/thermal/tajara/tactic
	thermal["Tajara, gray thermal suit"]= /obj/item/clothing/under/thermal/tajara/gray
	thermal["Tajara, black thermal suit"]= /obj/item/clothing/under/thermal/tajara/black
	thermal["Resomi, black thermal suit"]= /obj/item/clothing/under/thermal/resomi
	thermal["Resomi, white thermal suit"]= /obj/item/clothing/under/thermal/resomi/white
	thermal["Skrell, black thermal suit"]= /obj/item/clothing/under/thermal/heat
	thermal["Skrell, white thermal suit"]= /obj/item/clothing/under/thermal/heat/white
	thermal["Unati, black thermal suit"]= /obj/item/clothing/under/thermal/heat/unati
	thermal["Unati, white thermal suit"]= /obj/item/clothing/under/thermal/heat/unati/white
	gear_tweaks += new/datum/gear_tweak/path(thermal)
