/datum/design/item/stock_part/RPED_BS
	name = "bluespace rapid part exchange device"
	desc = "Powered by bluespace technology, this RPED variant can upgrade buildings from a distance, without needing to remove the panel first."
	id = "rped_bs"
	req_tech = list(TECH_ENGINEERING = 5, TECH_MATERIAL = 5, TECH_BLUESPACE = 4)
	materials = list(MATERIAL_STEEL = 20000, MATERIAL_GLASS = 5000, MATERIAL_SILVER = 2000)
	build_path = /obj/item/storage/part_replacer/bluespace
	sort_string = "CBAAB"

/datum/design/item/bluespace/bluespace_crystal
	name = "artificial bluespace crystal"
	desc = "An artificially made bluespace crystal."
	id = "bluespace_crystal"
	req_tech = list(TECH_BLUESPACE = 4, TECH_MATERIAL = 6)
	materials = list("gold" = 1500, "diamond" = 1500, "phoron" = 1500)
	build_path = /obj/item/bluespace_crystal/artificial
	sort_string = "VAEAB"

/datum/design/item/bluespace/bs_silk
	name = "BlueSpace Snare"
	id = "bs_snare"
	req_tech = list(TECH_BLUESPACE = 5, TECH_DATA = 4)
	materials = list(MATERIAL_STEEL = 3200)
	build_path = /obj/item/clothing/accessory/bs_silk
	sort_string = "VAFAF"
