// Alien clothing.

// Unathi clothing
/datum/gear/suit/unathi/mantle

/datum/gear/suit/unathi/robe

/datum/gear/suit/unathi/knifeharness

//Skrell Chains
/datum/gear/ears/skrell/chains

/datum/gear/ears/skrell/colored/chain

//Skrell Bands
/datum/gear/ears/skrell/bands

/datum/gear/ears/skrell/colored/band

//Skrell Cloth
/datum/gear/ears/skrell/cloth/male

/datum/gear/ears/skrell/cloth/male/New()

/datum/gear/ears/skrell/cloth/female

	//////////
	//RESOMI//
	//////////

/datum/gear/uniform/resomi

/datum/gear/uniform/resomi/white

/datum/gear/uniform/resomi/dress

/datum/gear/uniform/resomi/uniform

/datum/gear/uniform/resomi/formal

/datum/gear/uniform/resomi/rainbow

/datum/gear/uniform/resomi/eng
	allowed_roles = ENGINEERING_ROLES

/datum/gear/uniform/resomi/sec
	allowed_roles = SECURITY_ROLES

/datum/gear/uniform/resomi/med
	allowed_roles = MEDICAL_ROLES

/datum/gear/uniform/resomi/science
	allowed_roles = NANOTRASEN_ROLES

/datum/gear/uniform/resomi/roboitcs
	allowed_roles = list(/datum/job/roboticist)

/datum/gear/eyes/resomi

/datum/gear/eyes/resomi/lenses_sec
	allowed_roles = SECURITY_ROLES

/datum/gear/eyes/resomi/lenses_med
	allowed_roles = MEDICAL_ROLES

/datum/gear/accessory/resomi_mantle

/datum/gear/uniform/resomi/expeditionary
	display_name = "uniform, Expeditionary Utility (Resomi)"
	path = /obj/item/clothing/under/solgov/utility/expeditionary/resomi
	allowed_roles = SOLGOV_ROLES
	cost = 0 //Because it's work uniform

/datum/gear/uniform/resomi/expeditionary/pt
	display_name = "uniform, Expeditionary PT (Resomi)"
	path = /obj/item/clothing/under/solgov/pt/expeditionary/resomi

/datum/gear/uniform/resomi/expeditionary/command
	display_name = "uniform, Expeditionary Command Utility (Resomi)"
	path = /obj/item/clothing/under/solgov/utility/expeditionary/officer/resomi

/datum/gear/uniform/resomi/expeditionary/mildress
	display_name = "uniform, Expeditionary Mildress (Resomi)"
	path = /obj/item/clothing/under/solgov/mildress/expeditionary/resomi

/datum/gear/suit/resomi

		///////
		//IPC//
		///////

/datum/gear/mask/ipc_monitor

/datum/gear/suit/lab_xyn_machine
	allowed_branches = CIVILIAN_BRANCHES

// Misc clothing
/datum/gear/uniform/harness
	whitelisted = null

/datum/gear/shoes/toeless

/datum/gear/shoes/wrk_toeless

// Taj clothing
/datum/gear/eyes/medical/tajblind

/datum/gear/eyes/meson/tajblind

/datum/gear/eyes/security/tajblind

/datum/gear/head/zhan_scarf

/datum/gear/shoes/caligae

/datum/gear/accessory/capes

// Pre-modified gloves

/datum/gear/gloves/colored/modified

/datum/gear/gloves/latex/modified

/datum/gear/gloves/nitrile/modified

/datum/gear/gloves/rainbow/modified

/datum/gear/gloves/evening/modified

/datum/gear/gloves/botany/modified

/datum/gear/gloves/dress/modified
	display_name = "modified gloves, dress"
	path = /obj/item/clothing/gloves/color/white/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

/datum/gear/gloves/duty/modified
	display_name = "modified gloves, duty"
	path = /obj/item/clothing/gloves/duty/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI)

/datum/gear/gloves/work/modified

// Vox clothing
/datum/gear/mask/gas/vox
	allowed_roles = list(/datum/job/merchant, /datum/job/stowaway)

/datum/gear/gloves/vox
	allowed_roles = list(/datum/job/merchant, /datum/job/stowaway)

/datum/gear/uniform/vox_cloth
	allowed_roles = list(/datum/job/merchant, /datum/job/stowaway)

/datum/gear/uniform/vox_robe
	allowed_roles = list(/datum/job/merchant, /datum/job/stowaway)

/datum/gear/suit/unathi/savage_hunter
	allowed_branches = CIVILIAN_BRANCHES