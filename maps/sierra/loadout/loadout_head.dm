/datum/gear/head/surgical
	allowed_roles = STERILE_ROLES

/datum/gear/head/hardhat
	allowed_roles = TECHNICAL_ROLES

/datum/gear/head/welding
	allowed_roles = TECHNICAL_ROLES
/*
/datum/gear/head/scp_cap
	allowed_roles = list(/datum/job/detective, /datum/job/officer)
	allowed_branches = list(/datum/mil_branch/contractor)
*/

/datum/gear/head/beret_selection
	display_name = "contractor beret selection"
	description = "A list of berets used by various organizations and corporights."
	path = /obj/item/clothing/head/beret
	allowed_roles = SECURITY_ROLES

/datum/gear/head/beret_selection/New()
	..()
	var/beret_selection_type = list()
	beret_selection_type["white-blue corporight security beret"] = /obj/item/clothing/head/beret/guard
	beret_selection_type["white-red corporight security beret"] = /obj/item/clothing/head/beret/sec/corporate/whitered
	beret_selection_type["SAARE beret"] = /obj/item/clothing/head/beret/sec/corporate/saare
	beret_selection_type["PCRC beret"] = /obj/item/clothing/head/beret/sec/corporate/pcrc
	beret_selection_type["ZPCI beret"] = /obj/item/clothing/head/beret/sec/corporate/zpci
	gear_tweaks += new/datum/gear_tweak/path(beret_selection_type)

// department berets
/datum/gear/head/beret_department_medical
	display_name = "department beret, medical"
	description = "A department beret used by a medical personnel."
	path = /obj/item/clothing/head/beret/infinity/medical
	allowed_roles = MEDICAL_ROLES

/datum/gear/head/beret_department_science
	display_name = "department beret, science"
	description = "A beret used by a science personnel."
	path = /obj/item/clothing/head/beret/infinity/science
	allowed_roles = RESEARCH_ROLES

/datum/gear/head/beret_department_service
	display_name = "department beret, service"
	description = "A department beret used by a service personnel."
	path = /obj/item/clothing/head/beret/infinity
	allowed_roles = SERVICE_ROLES

/datum/gear/head/beret_department_supply
	display_name = "beret, supply"
	description = "A department beret used by a supply personnel."
	path = /obj/item/clothing/head/beret/infinity/cargo
	allowed_roles = SUPPLY_ROLES

// department berets for heads
/datum/gear/head/beret_captain
	display_name = "beret, captain"
	description = "A head of department beret used by a captain."
	path = /obj/item/clothing/head/beret/infinity/captain
	allowed_roles = list(/datum/job/captain)

/datum/gear/head/beret_hop
	display_name = "beret, head of personnel"
	description = "A head of department beret used by a head of personnel."
	path = /obj/item/clothing/head/beret/infinity/hop
	allowed_roles = list(/datum/job/hop)

/datum/gear/head/beret_hos
	display_name = "beret, head of security"
	description = "A head of department beret used by a head of security."
	path = /obj/item/clothing/head/beret/infinity/hos
	allowed_roles = list(/datum/job/hos)

/datum/gear/head/beret_rd
	display_name = "beret, research director"
	description = "A head of department beret used by a research director."
	path = /obj/item/clothing/head/beret/infinity/science_rd
	allowed_roles = list(/datum/job/rd)

/datum/gear/head/beret_ce
	display_name = "beret, chief engineer"
	description = "A head of department beret used by a chief engineer."
	path = /obj/item/clothing/head/beret/infinity/engineer_ce
	allowed_roles = list(/datum/job/chief_engineer)

/datum/gear/head/beret_cmo
	display_name = "beret, chief medical officer"
	description = "A head of department beret used by a chief medical officer."
	path = /obj/item/clothing/head/beret/infinity/medical_cmo
	allowed_roles = list(/datum/job/cmo)

/datum/gear/head/beret_qm
	display_name = "beret, quartermaster"
	description = "A head of department beret used by a quartermaster."
	path = /obj/item/clothing/head/beret/infinity/cargo_qm
	allowed_roles = list(/datum/job/qm)
