/datum/gear/uniform/utility
	display_name = "Utility Uniform"
	path = /obj/item/clothing/under/solgov/utility

/datum/gear/uniform/roboticist_skirt
	allowed_roles = list(/datum/job/roboticist)

/datum/gear/uniform/sterile
	allowed_roles = STERILE_ROLES

/datum/gear/uniform/hazard
	allowed_roles = TECHNICAL_ROLES

/datum/gear/uniform/pmc
	display_name = "PMC uniform selection"
	allowed_roles = SECURITY_ROLES
	path = /obj/item/clothing/under

/datum/gear/uniform/pmc/New()
	..()
	var/pmc = list()
	pmc += /obj/item/clothing/under/saare
	pmc += /obj/item/clothing/under/pcrc
	pmc += /obj/item/clothing/under/pcrcsuit
	pmc += /obj/item/clothing/under/scp_uniform
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(pmc)
