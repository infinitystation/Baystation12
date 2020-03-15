/datum/design/item/optical/hybrid
	name = "hybrid"
	id = "hybrid_mw"
	req_tech = list(TECH_MAGNET = 4, TECH_ENGINEERING = 5)
	materials = list(DEFAULT_WALL_MATERIAL = 50, "glass" = 50, "silver" = 100)
	build_path = /obj/item/clothing/glasses/material/hybrid
	sort_string = "GBAAD"

/datum/design/item/optical/cheapmodglas
	name = "cheap modular glasses"
	id = "mglasses_che"
	req_tech = list(TECH_DATA = 1)
	materials = list(MATERIAL_STEEL = 100, MATERIAL_GLASS = 200)
	build_path = /obj/item/clothing/glasses/modular
	sort_string = "GBAAL"

/datum/design/item/optical/modglas
	name = "modular glasses"
	id = "mglasses_no"
	req_tech = list(TECH_DATA = 1, TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	materials = list(MATERIAL_STEEL = 200, MATERIAL_GLASS = 200, MATERIAL_SILVER = 250)
	build_path = /obj/item/clothing/glasses/modular/normal
	sort_string = "GBAAO"

/datum/design/item/optical/advmodglas
	name = "advanced modular glasses"
	id = "mglasses_adva"
	req_tech = list(TECH_DATA = 3, TECH_MAGNET = 3, TECH_ENGINEERING = 4, TECH_MATERIAL = 4)
	materials = list(MATERIAL_STEEL = 250, MATERIAL_GLASS = 200, MATERIAL_SILVER = 250, MATERIAL_GOLD = 250)
	build_path = /obj/item/clothing/glasses/modular/advanced
	sort_string = "GBAAP"

/datum/design/item/optical/mmeson
	name = "meson cartrige"
	id = "mgcartrige_me"
	req_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 3)
	materials = list(MATERIAL_STEEL = 250, MATERIAL_GLASS = 200, MATERIAL_ALUMINIUM = 100)
	build_path = /obj/item/glass_cartridge/meson
	sort_string = "GBAAQ"

/datum/design/item/optical/mmater
	name = "material cartrige"
	id = "mgcartrige_ma"
	req_tech = list(TECH_MAGNET = 4, TECH_ENGINEERING = 4)
	materials = list(MATERIAL_STEEL = 250, MATERIAL_GLASS = 200, MATERIAL_SILVER = 250, MATERIAL_ALUMINIUM = 100)
	build_path = /obj/item/glass_cartridge/material
	sort_string = "GBAAR"

/datum/design/item/optical/mwelding
	name = "welding cartrige"
	id = "mgcartrige_we"
	req_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 4, TECH_MATERIAL = 4)
	materials = list(MATERIAL_STEEL = 250, MATERIAL_GLASS = 200, MATERIAL_URANIUM = 300, MATERIAL_ALUMINIUM = 150)
	build_path = /obj/item/glass_cartridge/welding
	sort_string = "GBAAS"

/datum/design/item/optical/mnight
	name = "nightvision cartrige"
	id = "mgcartrige_ni"
	req_tech = list(TECH_ENGINEERING = 4, TECH_MATERIAL = 4, TECH_COMBAT = 5)
	materials = list(MATERIAL_STEEL = 250, MATERIAL_URANIUM = 200, MATERIAL_SILVER = 250, MATERIAL_GOLD = 250)
	build_path = /obj/item/glass_cartridge/night
	sort_string = "GBAAT"

/datum/design/item/optical/mpres
	name = "lense cartrige"
	id = "mgcartrige_le"
	req_tech = list(TECH_BIO = 2, TECH_ENGINEERING = 2)
	materials = list(MATERIAL_ALUMINIUM = 50, MATERIAL_GLASS = 50)
	build_path = /obj/item/glass_cartridge/prescription
	sort_string = "GBAAV"

/datum/design/item/optical/mmedhud
	name = "MedHUD cartrige"
	id = "mgcartrige_mh"
	req_tech = list(TECH_BIO = 3, TECH_MAGNET = 3)
	materials = list(MATERIAL_ALUMINIUM = 50, MATERIAL_GLASS = 50)
	build_path = /obj/item/glass_cartridge/medhud
	sort_string = "GBAAW"

/datum/design/item/optical/msechud
	name = "SecHUD cartrige"
	id = "mgcartrige_sh"
	req_tech = list(TECH_MAGNET = 3, TECH_COMBAT = 3)
	materials = list(MATERIAL_ALUMINIUM = 50, MATERIAL_GLASS = 50)
	build_path = /obj/item/glass_cartridge/sechud
	sort_string = "GBAAX"

/datum/design/item/optical/mjanhud
	name = "janiHUD cartrige"
	id = "mgcartrige_jh"
	req_tech = list(TECH_BIO = 1, TECH_MAGNET = 3)
	materials = list(MATERIAL_ALUMINIUM = 50, MATERIAL_GLASS = 50)
	build_path = /obj/item/glass_cartridge/janihud
	sort_string = "GBAAY"

/datum/design/item/optical/mthermal
	name = "thermal cartrige"
	id = "mgcartrige_th"
	req_tech = list(TECH_ESOTERIC = 7, TECH_BLUESPACE = 5, TECH_BIO = 5, TECH_COMBAT = 8)
	materials = list(MATERIAL_GOLD = 3000, MATERIAL_DIAMOND = 1500, MATERIAL_URANIUM = 2500, MATERIAL_SILVER = 5000, MATERIAL_STEEL = 250)
	build_path = /obj/item/glass_cartridge/thermal
	sort_string = "GBAAZ"