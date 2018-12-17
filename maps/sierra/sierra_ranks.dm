/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank =   /datum/mil_rank/civ/civ

/datum/map/sierra
	branch_types = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/contractor,
		/datum/mil_branch/employee
	)

	spawn_branch_types = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/contractor,
		/datum/mil_branch/employee
	)

/*
 *  Branches
 *  ========
 */

/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "civ"
	email_domain = "freemail.net"

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	assistant_job = "Passenger"

/datum/mil_branch/contractor
	name = "Contractor"
	name_short = "contr"
	email_domain = "freemail.net"

	rank_types = list(
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)


/datum/mil_branch/employee
	name = "Employee"
	name_short = "empl"
	email_domain = "freemail.net"

	rank_types = list(
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)


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

/datum/mil_rank/civ/contractor
	name = "NanoTrasen Contractor"

/datum/mil_rank/civ/offduty
	name = "Off-Duty Personnel"

/datum/mil_rank/civ/synthetic
	name = "Synthetic"