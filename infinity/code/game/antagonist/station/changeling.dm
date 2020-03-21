/*
/datum/antagonist/changeling/create_global_objectives(override = 1)

	if(!..())
		return

	global_objectives = list()
	global_objectives |= new /datum/objective/changeling_infestation
*/

/datum/antagonist/changeling/create_objectives(var/datum/mind/changeling)
	if(!..())
		return

	if(!(locate(/datum/objective/escape) in changeling.objectives) && \
	   !(locate(/datum/objective/survive) in changeling.objectives))
		switch(rand(1,10))
			if(1)
				var/datum/objective/escape/escape_objective = new
				escape_objective.owner = changeling
				changeling.objectives += escape_objective
			else
				var/datum/objective/survive/survive_objective = new
				survive_objective.owner = changeling
				changeling.objectives += survive_objective

	for(var/i = 1, i <= 3, i++)
		var/datum/objective/O
		O = new /datum/objective/absorb_pointly()
		O.owner = changeling
		if(O.find_target())
			for(var/datum/objective/absorb_pointly/A in changeling.objectives)
				if(A.target == O.target)
					continue
				else
					changeling.objectives += O
					break
/*
	var/datum/objective/O
	switch(rand(1,100))
		if(1 to 20)
			O = new /datum/objective/brig()
		if(21 to 40)
			O = new /datum/objective/harm()
		else
			O = new /datum/objective/steal()

	O.owner = changeling
	if(!O.find_target(override = 1))
		O = new /datum/objective/steal()
		O.owner = changeling
		O.find_target()
	changeling.objectives += O
*/
	return
