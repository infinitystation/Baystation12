/datum/gear/suit/medcoat
	allowed_roles = MEDICAL_ROLES

/datum/gear/suit/security_poncho
	allowed_roles = list(/datum/job/guard, /datum/job/merchant)

/datum/gear/suit/medical_poncho
	allowed_roles = list(/datum/job/doctor_contractor, /datum/job/psychiatrist, /datum/job/roboticist, /datum/job/merchant)

/datum/gear/suit/engineering_poncho
	allowed_roles = list(/datum/job/engineer_contractor, /datum/job/roboticist, /datum/job/merchant)

/datum/gear/suit/science_poncho
	allowed_roles = list(/datum/job/scientist, /datum/job/scientist_assistant)

/datum/gear/suit/nanotrasen_poncho
	allowed_roles = list(/datum/job/scientist, /datum/job/scientist_assistant, /datum/job/merchant)

/datum/gear/suit/cargo_poncho
	allowed_roles = list(/datum/job/cargo_contractor, /datum/job/merchant)

/datum/gear/suit/labcoat
	allowed_roles = STERILE_ROLES

/datum/gear/suit/labcoat_corp
	allowed_roles = list(/datum/job/scientist, /datum/job/engineer_contractor, /datum/job/scientist, /datum/job/rd, /datum/job/biomech, /datum/job/roboticist)

/datum/gear/suit/labcoat_corp_rd
	allowed_roles = list(/datum/job/rd)

/datum/gear/suit/wintercoat_dais
	display_name = "winter coat, DAIS"
	allowed_roles = list(/datum/job/engineer_contractor, /datum/job/scientist, /datum/job/rd)

/datum/gear/suit/wintercoat/engineering
	display_name = "expeditionary winter coat"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/solgov
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)

/datum/gear/suit/wintercoat/engineering
	display_name = "engineering winter coat"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/engineering
	allowed_roles = ENGINEERING_ROLES

/datum/gear/suit/wintercoat/cargo
	display_name = "cargo winter coat"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/cargo
	allowed_roles = SUPPLY_ROLES

/datum/gear/suit/wintercoat/medical
	display_name = "medical winter coat"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/medical
	allowed_roles = MEDICAL_ROLES

/datum/gear/suit/wintercoat/security
	display_name = "security winter coat"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/security
	allowed_roles = SECURITY_ROLES

/datum/gear/suit/wintercoat/research
	display_name = "science winter coat"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/science
	allowed_roles = RESEARCH_ROLES


/*
/datum/gear/tactical/pcarrier
	display_name = "black plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier
	cost = 1
	slot = slot_wear_suit
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/pcarrier/navy
	display_name = "navy blue plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier/navy
	allowed_branches = list(/datum/mil_branch/fleet, /datum/mil_branch/civilian)

/datum/gear/tactical/pcarrier/misc
	display_name = "miscellaneous plate carrier selection"
	allowed_roles = ARMORED_ROLES
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/tactical/pcarrier/misc/New()
	..()
	var/armors = list()
	armors["green plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/green
	armors["tan plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(armors)
*/