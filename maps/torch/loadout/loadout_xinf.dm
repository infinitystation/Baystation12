//xinf for sorting.
/datum/map/torch
	loadout_blacklist = list(/datum/gear/tactical/armor_pouches/navy,\
	/datum/gear/tactical/armor_pouches/misc, /datum/gear/tactical/large_pouches/navy,\
	/datum/gear/tactical/large_pouches/misc, /datum/gear/tactical/pcarrier/navy, /datum/gear/tactical/pcarrier/misc,\
	)

/datum/gear/accessory/tags //overrides torch's loadout
	path = /obj/item/clothing/accessory/badge/dog_tags
	custom_setup_proc = /obj/item/clothing/accessory/badge/dog_tags/proc/loadout_setup

/datum/gear/head/skrell_helmet //overrides torch's loadout
	whitelisted = list(SPECIES_SKRELL)

/datum/gear/gloves/insulated
	allowed_roles = ENGINEERING_ROLES
/*
/datum/gear/head/scp_cap
	allowed_roles = list(/datum/job/bodyguard)
	allowed_branches = CIVILIAN_BRANCHES
*/
/datum/gear/uniform/corpsi
	allowed_branches = CIVILIAN_BRANCHES

///////////
// ARMOR //
///////////

/datum/gear/tactical/pcarrier
	display_name = "empty plate carriers selection"

/datum/gear/tactical/bloodpatch
	allowed_roles = ARMORED_ROLES

////////////
// ALIENS //
////////////

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

// IPC clothing

// Misc clothing

// Tajaran clothing

// Pre-modified gloves

/datum/gear/gloves/dress/modified
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

// Vox clothing

/datum/gear/mask/gas/vox
	allowed_roles = list(/datum/job/merchant)

/datum/gear/gloves/vox
	allowed_roles = list(/datum/job/merchant)

/datum/gear/uniform/vox_cloth
	allowed_roles = list(/datum/job/merchant)

/datum/gear/uniform/vox_robe
	allowed_roles = list(/datum/job/merchant)
