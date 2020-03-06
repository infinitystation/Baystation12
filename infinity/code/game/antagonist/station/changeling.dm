/datum/antagonist/changeling/create_global_objectives(override = 1)

	if(!..())
		return

	global_objectives = list()
	global_objectives |= new /datum/objective/changeling_infestation