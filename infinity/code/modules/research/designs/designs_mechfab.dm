/datum/design/item/mechfab/augment/kitchen
	name = "Kitchen toolset"
	build_path = /obj/item/organ/internal/augment/active/polytool/kitchen
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_ALUMINIUM = 1000, "glass" = 1000)
	id = "augment_toolset_kitchen"

/datum/design/item/mechfab/augment/surgical_hi_tech
	name = "Hi-tech surgical toolset"
	build_path = /obj/item/organ/internal/augment/active/polytool/surgical_hi_tech
	time = 30
	materials = list(MATERIAL_STEEL = 20000, "glass" = 15000, "silver" = 2500, "gold" = 3000, "phoron" = 500)
	req_tech = list(TECH_MATERIAL = 6, TECH_ENGINEERING = 7, TECH_BIO = 6, TECH_PHORON = 3)
	id = "augment_toolset_surgery_hi_tech"
	
/datum/design/item/mechfab/augment/baton
	name = "Stunbaton"
	build_path = /obj/item/organ/internal/augment/active/simple/baton
	materials = list(DEFAULT_WALL_MATERIAL = 4000, "glass" = 750)
	req_tech = list(TECH_MAGNET = 4, TECH_COMBAT = 4, TECH_MATERIAL = 4, TECH_BIO = 3)
	id = "augment_stunbaton"
	
/datum/design/item/mechfab/augment/anatomy
	name = "Surgery booster"
	build_path = /obj/item/organ/internal/augment/boost/anatomy
	materials = list(DEFAULT_WALL_MATERIAL = 750, "glass" = 750, "silver" = 100)
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 4, TECH_BIO = 5)
	id = "augment_booster_anatomy"
	
/datum/design/item/mechfab/augment/medical
	name = "Medical booster"
	build_path = /obj/item/organ/internal/augment/boost/medical
	materials = list(DEFAULT_WALL_MATERIAL = 750, "glass" = 750, "silver" = 100)
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 4, TECH_BIO = 5)
	id = "augment_booster_medical"

/datum/design/item/mechfab/augment/pilot
	name = "Pilot booster"
	build_path = /obj/item/organ/internal/augment/boost/pilot
	materials = list(DEFAULT_WALL_MATERIAL = 750, "glass" = 750, "silver" = 100)
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 6, TECH_BIO = 4)
	id = "augment_booster_pilot"
