/datum/design/item/paimod
	req_tech = list(TECH_DATA = 2)
	materials = list(MATERIAL_STEEL = 500)


/datum/design/item/paimod/memory
	req_tech = list(TECH_DATA = 3)
/datum/design/item/paimod/memory/standart
	name = "Standart memory PAImod"
	id = "pai_mem_mod_std"
	build_path = /obj/item/paimod/memory/standart
	sort_string = "VBAGA"
/datum/design/item/paimod/memory/advanced
	name = "Advanced memory PAImod"
	id = "pai_mem_mod_adv"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/paimod/memory/advanced
	sort_string = "VBAGB"
/datum/design/item/paimod/memory/lambda
	name = "Lambda memory PAImod"
	id = "pai_mem_mod_lmbd"
	req_tech = list(TECH_DATA = 5)
	build_path = /obj/item/paimod/memory/lambda
	sort_string = "VBAGC"


/datum/design/item/paimod/hack_speed
	req_tech = list(TECH_DATA = 4)
/datum/design/item/paimod/hack_speed/standart
	name = "Standart Hack Speed PAIMod"
	id = "pai_hack_mod_std"
	build_path = /obj/item/paimod/hack_speed/standart
	sort_string = "VBAGD"
/datum/design/item/paimod/hack_speed/advanced
	name = "Advanced Hack Speed PAIMod"
	id = "pai_hack_mod_adv"
	req_tech = list(TECH_DATA = 5)
	build_path = /obj/item/paimod/hack_speed/advanced
	sort_string = "VBAGE"


/datum/design/item/paimod/hack_camo
	name = "Hack Camouflage PAIMod"
	id = "pai_hc_mod"
	req_tech = list(TECH_DATA = 5, TECH_ENGINEERING = 4)
	build_path = /obj/item/paimod/special/hack_camo
	sort_string = "VBAGF"
/datum/design/item/paimod/advanced_holo
	name = "Advanced Holo Mod"
	id = "pai_ah_mod"
	req_tech = list(TECH_DATA = 3, TECH_MAGNET = 2)
	build_path = /obj/item/paimod/special/advanced_holo
	sort_string = "VBAGG"
