/datum/gear/gloves/latex
	allowed_roles = STERILE_ROLES

/datum/gear/gloves/nitrile
	allowed_roles = STERILE_ROLES

/datum/gear/gloves/botany
	allowed_roles = list(/datum/job/rd, /datum/job/scientist, /datum/job/scientist_assistant, /datum/job/chef, /datum/job/bartender, /datum/job/assistant, /datum/job/merchant)

/datum/gear/gloves/dress
	display_name = "gloves, dress"
	path = /obj/item/clothing/gloves/color/white

/datum/gear/gloves/duty
	display_name = "gloves, duty"
	path = /obj/item/clothing/gloves/duty
	cost = 3
	allowed_roles = MILITARY_ROLES

/datum/gear/gloves/insulated
	display_name = "insulated gloves selection"
	path = /obj/item/clothing/gloves/insulated
	allowed_roles = ENGINEERING_ROLES
	cost = 3

/datum/gear/gloves/insulated/New()
	..()
	var/glovtype = list()
	glovtype["yellow insulated"] = /obj/item/clothing/gloves/insulated
	glovtype["black insulated"] = /obj/item/clothing/gloves/insulated/black
	gear_tweaks += new/datum/gear_tweak/path(glovtype)
