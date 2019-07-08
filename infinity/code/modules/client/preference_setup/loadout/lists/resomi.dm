/datum/gear/uniform/resomi
	display_name = "(Resomi) smock, grey"
	path = /obj/item/clothing/under/resomi
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/uniform/resomi/white
	display_name = "(Resomi) smock, colored"
	path = /obj/item/clothing/under/resomi/white
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/resomi/dress
	display_name = "(Resomi) dresses selection"
	path = /obj/item/clothing/under/resomi/dress
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/resomi/utility
	display_name = "(Resomi) uniform selection"
	path = /obj/item/clothing/under/resomi/utility
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/resomi/sport
	display_name = "(Resomi) uniform, Sport"
	path = /obj/item/clothing/under/resomi/sport

/datum/gear/uniform/resomi/rainbow
	display_name = "(Resomi) smock, rainbow"
	path = /obj/item/clothing/under/resomi/rainbow

/datum/gear/uniform/resomi/eng
	display_name = "(Resomi) smock, Engineering"
	path = /obj/item/clothing/under/resomi/yellow

/datum/gear/uniform/resomi/roboitcs
	display_name = "(Resomi) smock, Robotics"
	path = /obj/item/clothing/under/resomi/robotics

/datum/gear/uniform/resomi/sec
	display_name = "(Resomi) smock, Security"
	path = /obj/item/clothing/under/resomi/red

/datum/gear/uniform/resomi/med
	display_name = "(Resomi) uniform, Medical"
	path = /obj/item/clothing/under/resomi/medical

/datum/gear/uniform/resomi/science
	display_name = "(Resomi) uniform, Science"
	path = /obj/item/clothing/under/resomi/science

/datum/gear/uniform/resomi/dark_worksmock
	display_name = "(Resomi) work uniform, dark"
	path = /obj/item/clothing/under/resomi/work_black
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/resomi/light_worksmock
	display_name = "(Resomi) work uniform, light"
	path = /obj/item/clothing/under/resomi/work_white
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/eyes/resomi
	display_name = "(Resomi) sun lenses"
	path = /obj/item/clothing/glasses/sunglasses/lenses
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/eyes/resomi/lenses_sec
	display_name = "(Resomi) sun sechud lenses"
	path = /obj/item/clothing/glasses/sunglasses/sechud/lenses

/datum/gear/eyes/resomi/lenses_med
	display_name = "(Resomi) sun medhud lenses"
	path = /obj/item/clothing/glasses/hud/health/lenses

/datum/gear/accessory/resomi_mantle
	display_name = "(Resomi) small mantle"
	path = /obj/item/clothing/accessory/scarf/resomi
	flags = GEAR_HAS_COLOR_SELECTION
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/suit/resomi_cloak
	display_name = "(Resomi) small cloak"
	path = /obj/item/clothing/suit/storage/toggle/Resomicoat
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/suit/resomi_cloak/New()
	..()
	var/resomi = list()
	resomi["black cloak"] = /obj/item/clothing/suit/storage/toggle/Resomicoat
	resomi["white cloak"] = /obj/item/clothing/suit/storage/toggle/Resomicoat/white
	gear_tweaks += new/datum/gear_tweak/path(resomi)

/datum/gear/shoes/resomi
	display_name = "(Resomi) small workboots"
	path = /obj/item/clothing/shoes/workboots/resomi
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/shoes/resomi/footwraps
	display_name = "(Resomi) foots clothwraps"
	flags = GEAR_HAS_COLOR_SELECTION
	path = /obj/item/clothing/shoes/footwraps

/datum/gear/suit/resomi_labcoat
	display_name = "(Resomi) small labcoat"
	path = /obj/item/clothing/suit/storage/toggle/Resomilabcoat
	flags = GEAR_HAS_COLOR_SELECTION
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)
