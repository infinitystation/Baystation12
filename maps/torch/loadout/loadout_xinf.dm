//xinf for sorting.
/datum/map/torch
	loadout_blacklist = list(/datum/gear/tactical/armor_pouches/navy,\
	/datum/gear/tactical/armor_pouches/misc, /datum/gear/tactical/large_pouches/navy,\
	/datum/gear/tactical/large_pouches/misc, /datum/gear/tactical/pcarrier/navy, /datum/gear/tactical/pcarrier/misc,\
	)

/datum/gear/accessory/tags //overrides torch's loadout
	path = /obj/item/clothing/accessory/badge/dog_tags

/datum/gear/head/skrell_helmet //overrides torch's loadout
	whitelisted = list(SPECIES_SKRELL)

/datum/gear/uniform/pmc/allowed_roles = list(/datum/job/bodyguard)

/datum/gear/gloves/insulated
	allowed_roles = ENGINEERING_ROLES

/datum/gear/head/scp_cap
	allowed_roles = list(/datum/job/bodyguard)
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/uniform/corpsi
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/uniform/corp_guard
	allowed_roles = list(/datum/job/bodyguard)

///////////
// ARMOR //
///////////

/datum/gear/tactical/pcarrier
	display_name = "empty plate carriers selection"

/datum/gear/tactical/bloodpatch
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/armor_deco //tags
	allowed_roles = list(/datum/job/bodyguard)

////////////
// ALIENS //
////////////

// Unathi clothing

// Skrell clothing


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
