/datum/antagonist/traitor/create_objectives(var/datum/mind/traitor)
	if(!..())
		return

	var/datum/objective/O
	if(istype(traitor.current, /mob/living/silicon))
		O = new /datum/objective/assassinate()
		O.find_target()
		O.owner = traitor
		traitor.objectives += O

		O = new /datum/objective/survive()
		O.owner = traitor
		traitor.objectives += O
	else
		switch(rand(1,100))
			if(1 to 40)
				O = new /datum/objective/assassinate()
			if(41 to 60)
				O = new /datum/objective/brig()
			if(61 to 80)
				O = new /datum/objective/harm()
			else
				O = new /datum/objective/steal()

		O.owner = traitor
		if(!O.find_target(override = 1))
			O = new /datum/objective/steal()
			O.owner = traitor
			O.find_target()
		traitor.objectives += O

		switch(rand(1,10))
			if(1)
				if (!(locate(/datum/objective/escape) in traitor.objectives))
					var/datum/objective/escape/escape_objective = new
					escape_objective.owner = traitor
					traitor.objectives += escape_objective

			else
				if (!(locate(/datum/objective/survive) in traitor.objectives))
					var/datum/objective/survive/survive_objective = new
					survive_objective.owner = traitor
					traitor.objectives += survive_objective
	return
