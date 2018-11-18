/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank =   /datum/mil_rank/civ/civ

/datum/map/sierra
	branch_types = list(
		/datum/mil_branch/civilian
	)

	spawn_branch_types = list(
		/datum/mil_branch/civilian
	)

/*
 *  Branches
 *  ========
 */

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

/datum/mil_rank/grade()
	. = ..()
	if(!sort_order)
		return ""
	if(sort_order <= 10)
		return "E[sort_order]"
	return "O[sort_order - 10]"

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