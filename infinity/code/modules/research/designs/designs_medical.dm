/datum/design/item/medical/plant_scanner
	desc = "A hand-held botanical scanner used to analyze plants."
	id = "plant_scanner"
	req_tech = list(TECH_MAGNET = 2, TECH_BIO = 2)
	materials = list(MATERIAL_STEEL = 150, MATERIAL_GLASS = 100)
	build_path = /obj/item/device/scanner/plant //obj/item/device/scanner/plant
	sort_string = "MACFD"

/datum/design/item/medical/defib
	name = "defibrillator"
	desc = "A device that delivers powerful shocks via detachable paddles to resuscitate incapacitated patients."
	id="defib"
	req_tech = list(TECH_BIO = 4, TECH_POWER = 2)
	materials = list(MATERIAL_STEEL = 15000, MATERIAL_GLASS = 7500, MATERIAL_SILVER = 1500)
	build_path = /obj/item/weapon/defibrillator
	sort_string = "MADAC"

/datum/design/item/medical/c_defib
	name = "compact defibrillator"
	desc = "A belt-equipped defibrillator that can be rapidly deployed."
	id="c_defib"
	req_tech = list(TECH_BIO = 5, TECH_POWER = 3)
	materials = list(MATERIAL_STEEL = 10000, MATERIAL_GLASS = 5000, MATERIAL_SILVER = 2000)
	build_path = /obj/item/weapon/defibrillator/compact
	sort_string = "MADAD"

/datum/design/item/surgery/pico_grasper
	name = "precision grasper"
	desc = "A thin rod with pico manipulators embedded in it allowing for fast and precise extraction."
	id = "pico_grasper"
	req_tech = list(TECH_MATERIAL = 4, TECH_ENGINEERING = 3, TECH_BIO = 4)
	materials = list (DEFAULT_WALL_MATERIAL = 10000, "glass" = 5000, "phoron" = 80)
	build_path = /obj/item/weapon/hemostat/pico
	sort_string = "MBEAE"

/datum/design/item/surgery/plasmasaw
	name = "plasma saw"
	desc = "Perfect for cutting through ice."
	id = "plasmasaw"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 4, TECH_BIO = 5, TECH_PHORON = 3)
	materials = list (DEFAULT_WALL_MATERIAL = 10000, "glass" = 5000, "phoron" = 500)
	build_path = /obj/item/weapon/circular_saw/plasmasaw
	sort_string = "MBEAF"

/datum/design/item/surgery/bonemender
	name = "bone mender"
	desc = "A favorite among skeletons. It even sounds like a skeleton too."
	id = "bonemender"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 4, TECH_BIO = 5)
	materials = list (DEFAULT_WALL_MATERIAL = 10000, "glass" = 5000, "gold" = 500, "silver" = 250)
	build_path = /obj/item/weapon/bonesetter/bone_mender
	sort_string = "MBEAG"

/datum/design/item/surgery/clot
	name = "capillary laying operation tool"
	desc = "A canister like tool that stores synthetic vein."
	id = "clot"
	req_tech = list(TECH_MATERIAL = 5, TECH_ENGINEERING = 4, TECH_BIO = 5)
	materials = list (DEFAULT_WALL_MATERIAL = 10000, "glass" = 8000, "silver" = 1000)
	build_path = /obj/item/weapon/FixOVein/clot
	sort_string = "MBEAH"
