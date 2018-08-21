/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank =   /datum/mil_rank/civ/civ

/datum/map/sierra
	branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/civilian,
		/datum/mil_branch/solgov
	)

	spawn_branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/civilian,
		/datum/mil_branch/solgov
	)

	species_to_branch_whitelist = list(
		/datum/species/diona   = list(/datum/mil_branch/civilian),
		/datum/species/nabber  = list(/datum/mil_branch/civilian),
		/datum/species/tajaran = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
		/datum/species/skrell  = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
		/datum/species/unathi  = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
		/datum/species/vox     = list(/datum/mil_branch/civilian),
		/datum/species/resomi  = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps)
	)

	species_to_branch_blacklist = list(
		/datum/species/diona   = list(/datum/mil_branch/expeditionary_corps, /datum/mil_branch/solgov),
		/datum/species/nabber  = list(/datum/mil_branch/expeditionary_corps, /datum/mil_branch/solgov),
		/datum/species/tajaran = list(/datum/mil_branch/solgov),
		/datum/species/skrell  = list(/datum/mil_branch/solgov),
		/datum/species/unathi  = list(/datum/mil_branch/solgov),
		/datum/species/vox     = list(/datum/mil_branch/expeditionary_corps, /datum/mil_branch/solgov),
		/datum/species/resomi  = list(/datum/mil_branch/solgov)
	)
	species_to_rank_whitelist = list(
		/datum/species/machine = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/o1
			),
			/datum/mil_branch/solgov = list(
				/datum/mil_rank/sol/agent
			)
		),
		/datum/species/tajaran = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/o1
			)
		),
		/datum/species/unathi = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5
			)
		),
		/datum/species/skrell = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/o1
			)
		),
		/datum/species/resomi = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/o1
			)
		)
	)

	species_to_rank_blacklist = list(
		/datum/species/machine = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/o3,
			),
			/datum/mil_branch/solgov = list(
				/datum/mil_rank/sol/gov
			)
		),
		/datum/species/tajaran = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/o3,
			)
		),
		/datum/species/unathi = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/o3,
			)
		),
		/datum/species/resomi = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/o3,
			)
		),
		/datum/species/skrell = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/o3,
			)
		)
	)

/*
 *  Branches
 *  ========
 */

/datum/mil_branch/expeditionary_corps
	name = "Expeditionary Corps"
	name_short = "SCGEC"
	email_domain = "sierra.ec.scg"

	rank_types = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5,
		/datum/mil_rank/ec/e7,
		/datum/mil_rank/ec/o1,
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/ec/o5,
		/datum/mil_rank/ec/o6
	)

	spawn_rank_types = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5,
		/datum/mil_rank/ec/o1,
		/datum/mil_rank/ec/o3,
	)

	assistant_job = "Crewman"

	min_skill = list(	SKILL_SCIENCE = SKILL_BASIC,
						SKILL_EVA     = SKILL_BASIC)

/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "civ"
	email_domain = "freemail.nt"

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	assistant_job = "Passenger"

/datum/mil_branch/solgov
	name = "SolGov Employee"
	name_short = "SCG"
	email_domain = "torch.scg"

	rank_types = list(
		/datum/mil_rank/sol/gov,
		/datum/mil_rank/sol/agent
	)

	spawn_rank_types = list(
		/datum/mil_rank/sol/gov,
		/datum/mil_rank/sol/agent
	)

/datum/mil_rank/grade()
	. = ..()
	if(!sort_order)
		return ""
	if(sort_order <= 10)
		return "E[sort_order]"
	return "O[sort_order - 10]"

/*
 *  EC
 *  =====
 */
/datum/mil_rank/ec/e1
	name = "Apprentice Explorer"
	name_short = "AXPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted)
	sort_order = 1

/datum/mil_rank/ec/e3
	name = "Explorer"
	name_short = "XPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted/e3)
	sort_order = 3

/datum/mil_rank/ec/e5
	name = "Senior Explorer"
	name_short = "SXPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted/e5)
	sort_order = 5

/datum/mil_rank/ec/e7
	name = "Chief Explorer"
	name_short = "CXPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted/e7)
	sort_order = 7

/datum/mil_rank/ec/o1
	name = "Ensign"
	name_short = "ENS"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer)
	sort_order = 11

/datum/mil_rank/ec/o3
	name = "Lieutenant"
	name_short = "LT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o3)
	sort_order = 13

/datum/mil_rank/ec/o5
	name = "Commander"
	name_short = "CDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o5)
	sort_order = 15

/datum/mil_rank/ec/o6
	name = "Captain"
	name_short = "CAPT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o6)
	sort_order = 16

/datum/mil_rank/ec/o8
	name = "Admiral"
	name_short = "ADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o8)
	sort_order = 16

/*
 *  Civilians
 *  =========
 */

/datum/mil_rank/civ/civ
	name = "Civilian"
	name_short = null

/datum/mil_rank/civ/nt
	name = "NanoTrasen Employee"

/datum/mil_rank/civ/offduty
	name = "Off-Duty Personnel"

/datum/mil_rank/civ/synthetic
	name = "Synthetic"

/*
 *  SolGov Employees
 *  ====== =========
 */

/datum/mil_rank/sol/gov
	name = "SolGov Representative"
	accessory = list(/obj/item/clothing/accessory/badge/solgov/representative)

/datum/mil_rank/sol/agent
	name = "OCIE Agent"
	name_short = "AGT"
	accessory = list(/obj/item/clothing/accessory/badge/ocieagent)