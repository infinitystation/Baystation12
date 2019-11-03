/datum/gear/head/zhan_scarf/neck
	display_name = "(Tajara) Tua-Tari scarf"
	path = /obj/item/clothing/accessory/scarf/tajaran
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/thermal
	display_name = "thermal suit selection"
	path = /obj/item/clothing/under
	whitelisted = list(SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_SKRELL, SPECIES_TAJARA, SPECIES_RESOMI)

/datum/gear/uniform/thermal/New()
	..()
	var/thermos = list()
	thermos["Tajara, White thermal suit"]= /obj/item/clothing/under/thermal/tajara
	thermos["Tajara, Tacticool thermal suit"]= /obj/item/clothing/under/thermal/tajara/tactic
	thermos["Tajara, Gray thermal suit"]= /obj/item/clothing/under/thermal/tajara/gray
	thermos["Tajara, Black thermal suit"]= /obj/item/clothing/under/thermal/tajara/black
	thermos["Resomi, Black thermal suit"]= /obj/item/clothing/under/thermal/resomi
	thermos["Resomi, White thermal suit"]= /obj/item/clothing/under/thermal/resomi/white
	thermos["Skrell, Black thermal suit"]= /obj/item/clothing/under/thermal/heat
	thermos["Skrell, White thermal suit"]= /obj/item/clothing/under/thermal/heat/white
	thermos["Unati, Black thermal suit"]= /obj/item/clothing/under/thermal/heat/unati
	thermos["Unati, White thermal suit"]= /obj/item/clothing/under/thermal/heat/unati/white
	gear_tweaks += new/datum/gear_tweak/path(thermal)