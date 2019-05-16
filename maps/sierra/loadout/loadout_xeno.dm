// Unathi clothing

// Skrell clothing

// Resomi clothing

/datum/gear/uniform/resomi/eng
	allowed_roles = ENGINEERING_ROLES

/datum/gear/uniform/resomi/sec
	allowed_roles = SECURITY_ROLES

/datum/gear/uniform/resomi/med
	allowed_roles = MEDICAL_ROLES

/datum/gear/uniform/resomi/science
	allowed_roles = RESEARCH_ROLES

/datum/gear/uniform/resomi/roboitcs
	allowed_roles = list(/datum/job/roboticist)

/datum/gear/eyes/resomi/lenses_sec
	allowed_roles = SECURITY_ROLES

/datum/gear/eyes/resomi/lenses_med
	allowed_roles = MEDICAL_ROLES

/datum/gear/suit/storage/resomicloak/standard
	display_name = "(Resomi) standard cloak / job cloak"
	sort_category = "Xenowear"
	path = /obj/item/clothing/suit/storage/resomicloak
	cost = 1
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/suit/storage/resomicloak/standard/New()
	..()
	var/resomicloaks = list()
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_orange
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_midgrey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_lightgrey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_white
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_red
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_yellow
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_green
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_blue
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_purple
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_pink
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_brown
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/orange_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/lightgrey_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/white_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/red_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/orange
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/yellow_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/green_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/blue_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/purple_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/pink_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/brown_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/rainbow
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(resomicloaks)

// Uh, i know what looks crooked, but it works quite interestingly.

/datum/gear/suit/storage/resomicloak/standard/New()
	..()
	var/resomicloaks = list()
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/iaa
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/service
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/qm
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/sec
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/robo
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/sci
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/para
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/viro
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/chemistry
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/medical
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/cmo
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/atmos
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/eningeer
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/ce
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/command
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/mining
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/cargo
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(resomicloaks)

/datum/gear/under/resomi/undercoat/standard
	display_name = "(Resomi) standard undercoat / job undercoat"
	sort_category = "Xenowear"
	path = /obj/item/clothing/under/resomi/undercoat
	cost = 1
	slot = slot_w_uniform
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/under/resomi/undercoat/standard/New()
	..()
	var/undercoats = list()
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_orange
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_midgrey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_lightgrey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_white
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_red
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_yellow
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_green
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_blue
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_purple
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_pink
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_brown
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/orange_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/white_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/lightgrey_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/red_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/orange
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/yellow_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/green_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/blue_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/purple_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/pink_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/brown_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/rainbow
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(undercoats)

/datum/gear/under/resomi/undercoat/standard/New()
	..()
	var/undercoats = list()
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/cargo
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/mining
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/command
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/command_g
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/ce
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/ce_w
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/engineer
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/atmos
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/cmo
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/medical
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/chemistry
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/viro
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/para
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/sci
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/robo
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/sec
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/qm
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/service
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/iaa
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(undercoats)

// IPC clothing

/datum/gear/suit/lab_xyn_machine
	display_name = "(IPC) Xynergy labcoat"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/xyn_machine
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_IPC)
	allowed_branches = list(/datum/mil_branch/contractor)

// Misc clothing

// Tajaran clothing

// Pre-modified gloves

/datum/gear/gloves/dress/modified
	display_name = "modified gloves, dress"
	path = /obj/item/clothing/gloves/color/white/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

// Vox clothing

/datum/gear/mask/gas/vox
	allowed_roles = list(/datum/job/merchant, /datum/job/merchant_trainee, /datum/job/stowaway)

/datum/gear/gloves/vox
	allowed_roles = list(/datum/job/merchant, /datum/job/merchant_trainee, /datum/job/stowaway)

/datum/gear/uniform/vox_cloth
	allowed_roles = list(/datum/job/merchant, /datum/job/merchant_trainee, /datum/job/stowaway)

/datum/gear/uniform/vox_robe
	allowed_roles = list(/datum/job/merchant, /datum/job/merchant_trainee, /datum/job/stowaway)