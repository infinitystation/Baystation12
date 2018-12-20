//Makes sure we don't get any merchant antags as a balance concern. Can also be used for future Sierra specific antag restrictions.
/datum/antagonist/changeling
	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/merchant, /datum/job/merchant_trainee, /datum/job/captain, /datum/job/hop)

/datum/antagonist/godcultist
	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/merchant, /datum/job/merchant_trainee, /datum/job/captain, /datum/job/hop, /datum/job/hos, /datum/job/iaa)

/datum/antagonist/cultist
	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/psychiatrist, /datum/job/merchant, /datum/job/merchant_trainee, /datum/job/captain, /datum/job/hop, /datum/job/hos, /datum/job/iaa)

/datum/antagonist/loyalists
	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/merchant, /datum/job/merchant_trainee)

/datum/antagonist/revolutionary
	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/merchant, /datum/job/merchant_trainee, /datum/job/iaa)

/datum/antagonist/traitor
	blacklisted_jobs = list(/datum/job/merchant, /datum/job/merchant_trainee, /datum/job/captain, /datum/job/iaa)

/datum/antagonist/ert/equip(var/mob/living/carbon/human/player)
	if(!..())
		return 0
	player.char_branch = mil_branches.get_branch("Employee")
	player.char_rank = mil_branches.get_rank("Employee", "NanoTrasen Employee")

	var/decl/hierarchy/outfit/ert_outfit = outfit_by_type((player.mind == leader) ? /decl/hierarchy/outfit/job/sierra/ert/leader : /decl/hierarchy/outfit/job/sierra/ert)
	ert_outfit.equip(player)

	return 1
