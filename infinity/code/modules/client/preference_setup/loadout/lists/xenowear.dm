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

/datum/gear/eyes/modvisor
	sort_category = "Xenowear"
	display_name = "(Tajara) modular visor selection"
	path = /obj/item/clothing/glasses/modular/normal/taj
	whitelisted = list(SPECIES_TAJARA)
	cost = 2

/datum/gear/eyes/modvisor/New()
	..()
	var/mvis = list()
	mvis["green modular visor"]= /obj/item/clothing/glasses/modular/normal/taj
	mvis["blue modular visor"]= /obj/item/clothing/glasses/modular/normal/taj/b
	mvis["red modular visor"]= /obj/item/clothing/glasses/modular/normal/taj/r
	gear_tweaks += new/datum/gear_tweak/path(mvis)

/datum/gear/eyes/admodvisor
	sort_category = "Xenowear"
	display_name = "(Tajara) advancer modular visor selection"
	path = /obj/item/clothing/glasses/modular/advanced/taj
	whitelisted = list(SPECIES_TAJARA)
	cost = 4

/datum/gear/eyes/admodvisor/New()
	..()
	var/admvis = list()
	admvis["green modular visor"]= /obj/item/clothing/glasses/modular/advanced/taj
	admvis["blue modular visor"]= /obj/item/clothing/glasses/modular/advanced/taj/b
	admvis["red modular visor"]= /obj/item/clothing/glasses/modular/advanced/taj/r
	gear_tweaks += new/datum/gear_tweak/path(admvis)
