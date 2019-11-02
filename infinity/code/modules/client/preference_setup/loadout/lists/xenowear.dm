/datum/gear/head/zhan_scarf/neck
	display_name = "(Tajara) Tua-Tari scarf"
	path = /obj/item/clothing/accessory/scarf/tajaran
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/thermos
	display_name = "thermal suit selection, non-skrell thermal clothing won't fit on other races."
	path = /obj/item/clothing/under

/datum/gear/uniform/thermos/New()
	..()
	var/thermos = list()
	thermos["Tajara, White thermalsuit"]= /obj/item/clothing/under/thermos/tajara
	thermos["Tajara, Tacticool thermalsuit"]= /obj/item/clothing/under/thermos/tajara/tactic
	thermos["Tajara, Gray thermalsuit"]= /obj/item/clothing/under/thermos/tajara/gray
	thermos["Tajara, Black thermalsuit"]= /obj/item/clothing/under/thermos/tajara/black
	thermos["Resomi, Black thermalsuit"]= /obj/item/clothing/under/thermos/resomi
	thermos["Resomi, White thermalsuit"]= /obj/item/clothing/under/thermos/resomi/white
	thermos["Skrell, Black thermalsuit"]= /obj/item/clothing/under/thermos/heat
	thermos["Skrell, White thermalsuit"]= /obj/item/clothing/under/thermos/heat/white
	thermos["Unati, Black thermalsuit"]= /obj/item/clothing/under/thermos/heat/unati
	thermos["Unati, White thermalsuit"]= /obj/item/clothing/under/thermos/heat/unati/white
	gear_tweaks += new/datum/gear_tweak/path(thermos)