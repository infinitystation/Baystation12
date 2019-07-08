//xinf for sorting.
/datum/map/torch
	loadout_blacklist = list(/datum/gear/tactical/armor_pouches,/datum/gear/tactical/armor_pouches/navy,\
	/datum/gear/tactical/armor_pouches/misc, /datum/gear/tactical/large_pouches, /datum/gear/tactical/large_pouches/navy,\
	/datum/gear/tactical/large_pouches/misc, /datum/gear/tactical/pcarrier/navy, /datum/gear/tactical/pcarrier/misc,\
	)

/datum/gear/accessory/tags //overrides torch's loadout
	path = /obj/item/clothing/accessory/badge/dog_tags

/datum/gear/head/skrell_helmet //overrides torch's loadout
	whitelisted = list(SPECIES_SKRELL)

/datum/gear/uniform/pmc
	allowed_roles = list(/datum/job/bodyguard)

/datum/gear/gloves/insulated
	allowed_roles = ENGINEERING_ROLES

/datum/gear/head/scp_cap
	display_name = "SCP cap"
	path = /obj/item/clothing/head/soft/scp_cap
	allowed_roles = list(/datum/job/bodyguard)
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/uniform/corpsi
	display_name = "contractor uniform selection"
	path = /obj/item/clothing/under
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/uniform/corpsi/New()
	..()
	var/corpsi = list()
	corpsi["Major Bill's uniform"]		= /obj/item/clothing/under/mbill
	corpsi["Aether uniform"]			= /obj/item/clothing/under/aether
	corpsi["Hephaestus science uniform"]= /obj/item/clothing/under/rank/scientist/heph
	corpsi["Hephaestus uniform"]		= /obj/item/clothing/under/hephaestus
	corpsi["Ward-Takahashi uniform"]	= /obj/item/clothing/under/wardt
	corpsi["Grayson uniform"]			= /obj/item/clothing/under/grayson
	corpsi["Focal Point uniform"]		= /obj/item/clothing/under/focal
	corpsi["Morpheus uniform"]			= /obj/item/clothing/under/morpheus
	corpsi["Skinner uniform"]			= /obj/item/clothing/under/skinner
	corpsi["DAIS uniform"]				= /obj/item/clothing/under/dais
	gear_tweaks += new/datum/gear_tweak/path(corpsi)

/datum/gear/uniform/shorts //overrides torch's loadout
	allowed_roles = FORMAL_ROLES

/datum/gear/uniform/corp_guard
	display_name = "corporate colours, guard"
	allowed_roles = list(/datum/job/bodyguard)

///////////
// ARMOR //
///////////

/datum/gear/tactical/pcarrier
	display_name = "empty plate carriers selection"

/datum/gear/tactical/pcarrier/New()
	var/armor = list()
	armor["black plate carrier"]	= /obj/item/clothing/suit/armor/pcarrier
	armor["blue plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/blue
	armor["navy plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/navy
	armor["green plate carrier"] 	= /obj/item/clothing/suit/armor/pcarrier/green
	armor["tan plate carrier"] 		= /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(armor)

/datum/gear/tactical/bloodpatch
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/armor_pouches
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/large_pouches
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/armor_deco //tags
	allowed_roles = list(/datum/job/bodyguard)

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
	display_name = "modified gloves, dress"
	path = /obj/item/clothing/gloves/color/white/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

// Vox clothing

/datum/gear/mask/gas/vox
	allowed_roles = list(/datum/job/merchant, /datum/job/stowaway)

/datum/gear/gloves/vox
	allowed_roles = list(/datum/job/merchant, /datum/job/stowaway)

/datum/gear/uniform/vox_cloth
	allowed_roles = list(/datum/job/merchant, /datum/job/stowaway)

/datum/gear/uniform/vox_robe
	allowed_roles = list(/datum/job/merchant, /datum/job/stowaway)