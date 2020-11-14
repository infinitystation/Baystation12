/datum/antagonist/changeling/create_global_objectives(override = 1)

	if(!..())
		return

	global_objectives = list()
	global_objectives |= new /datum/objective/changeling

	var/i = 1
	var/max_steal_objectives = pick(3, 3, 4)
	while(i <= max_steal_objectives)
		var/datum/objective/O = new /datum/objective/steal()
		O.find_target()
		global_objectives |= O
		i++

	global_objectives |= new /datum/objective/changeling/evacuate
	global_objectives |= new /datum/objective/changeling/stealth

/datum/antagonist/changeling/create_objectives(var/datum/mind/changeling, override = 1)
	if(!..())
		return
/*
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

	var/datum/objective/O
	O = new /datum/objective/absorb_pointly()
	O.owner = changeling
	if(O.find_target())
		changeling.objectives += O
	else
		to_chat(changeling.current, SPAN_LING("Мы не чувствуем жертв с полезными геномами. Стоит заняться чем-то ещё \
		- например, создать условия, чтобы было проще охотиться."))
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
*/
