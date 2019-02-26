/datum/design/item/disk/flora
	name = "flora data"
	desc = "Produce additional disks for storing data on plant genetics."
	id = "flora_disk"
	req_tech = list(TECH_DATA = 1)
	materials = list(MATERIAL_STEEL = 30, MATERIAL_GLASS = 10)
	build_path = /obj/item/weapon/disk/botany
	sort_string = "AAAAC"

/datum/design/item/stock_part/BS_RPED
	name = "bluespace rapid part exchange device"
	desc = "Powered by bluespace technology, this RPED variant can upgrade buildings from a distance, without needing to remove the panel first."
	id = "bs_rped"
	req_tech = list(TECH_ENGINEERING = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 4)
	materials = list(MATERIAL_STEEL = 20000, MATERIAL_GLASS = 5000, MATERIAL_SILVER = 2000)
	build_path = /obj/item/weapon/storage/part_replacer/bluespace
	sort_string = "CBAAB"

/datum/design/item/hud/health
	name = "health scanner"
	id = "health_hud"
	req_tech = list(TECH_BIO = 2, TECH_MAGNET = 3)
	build_path = /obj/item/clothing/glasses/hud/health
	sort_string = "GAAAA"

/datum/design/item/medical/plant_scanner
	desc = "A hand-held botanical scanner used to analyze plants."
	id = "plant_scanner"
	req_tech = list(TECH_MAGNET = 2, TECH_BIO = 2)
	materials = list(MATERIAL_STEEL = 150, MATERIAL_GLASS = 100)
	build_path = /obj/item/device/analyzer/plant_analyzer
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

/datum/design/item/bluespace/bluespace_crystal
	name = "artificial bluespace crystal"
	desc = "An artificially made bluespace crystal."
	id = "bluespace_crystal"
	req_tech = list(TECH_BLUESPACE = 4, TECH_MATERIAL = 6)
	materials = list("gold" = 1500, "diamond" = 1500, "phoron" = 1500)
	build_path = /obj/item/bluespace_crystal/artificial
	sort_string = "VAEAB"

/datum/design/item/tool/rpd
	name = "rapid pipe dispenser"
	desc = "This device can rapidly dispense atmospherics and disposals piping, manipulate loose piping, and recycle any detached pipes it is applied to."
	id="rpd"
	req_tech = list(TECH_ENGINEERING = 5, TECH_MATERIAL = 3)
	materials = list(DEFAULT_WALL_MATERIAL = 50000)
	build_path = /obj/item/weapon/rpd
	sort_string = "VAGAK"

/datum/design/item/tool/powersink
	name = "powersink"
	desc = "A nulling power sink which drains energy from electrical systems."
	id="powersink"
	req_tech = list(TECH_POWER = 4, TECH_ILLEGAL = 5)
	materials = list(MATERIAL_STEEL = 5000, MATERIAL_GLASS = 5000, MATERIAL_DIAMOND = 500)
	build_path = /obj/item/device/powersink
	sort_string = "VAGAN"

/datum/design/item/tool/multimeter
	name = "multimeter"
	desc = "Используетс&#255; дл&#255; измерени&#255; потреблени&#255; электроэнергии оборудовани&#255; и прозвонки проводов. Рекомендуетс&#255; докторами."
	id = "multimeter"
	req_tech = list(TECH_MAGNET = 4, TECH_ENGINEERING = 5, TECH_MATERIAL = 6)
	materials = list(DEFAULT_WALL_MATERIAL = 1000, MATERIAL_GLASS = 1000, MATERIAL_SILVER = 500)
	build_path = /obj/item/device/multitool/multimeter
	sort_string = "VAGAM"

/datum/design/item/optical/hybrid
	name = "hybrid"
	id = "hybrid_mw"
	req_tech = list(TECH_MAGNET = 4, TECH_ENGINEERING = 5)
	materials = list(DEFAULT_WALL_MATERIAL = 50, "glass" = 50, "silver" = 100)
	build_path = /obj/item/clothing/glasses/material/hybrid
	sort_string = "GBAAD"

// CIRCUITS

datum/design/circuit/telesci_console
	name = "telepad control console"
	id = "telesci_console"
	req_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 2)
	build_path = /obj/item/weapon/circuitboard/telesci_console
	sort_string = "HAAAD"

datum/design/circuit/telepad
	name = "telepad board"
	id = "telepad"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 4)
	build_path = /obj/item/weapon/circuitboard/telesci_pad
	sort_string = "HAAAF"

/datum/design/circuit/bsa
	name = "bluespace artillery control"
	id = "bsa"
	req_tech = list(TECH_ENGINEERING = 5, TECH_COMBAT = 5, TECH_BLUESPACE = 5)
	build_path = /obj/item/weapon/circuitboard/bsa
	sort_string = "KCAAG"