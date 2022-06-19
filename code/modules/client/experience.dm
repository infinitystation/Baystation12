/datum/player_experience
	var/ckey
	var/exp = list(
		EXP_TYPE_LIVING = 0,
		EXP_TYPE_CREW = 0,
		EXP_TYPE_GHOST = 0,
		EXP_TYPE_COMMAND = 0,
		EXP_TYPE_ENGINEERING = 0,
		EXP_TYPE_MEDICAL = 0,
		EXP_TYPE_SCIENCE = 0,
		EXP_TYPE_SUPPLY = 0,
		EXP_TYPE_SERVICE = 0,
		EXP_TYPE_EXPLORATION = 0,
		EXP_TYPE_SECURITY = 0,
		EXP_TYPE_SILICON = 0,
		EXP_TYPE_CIVILIAN = 0,
		EXP_TYPE_SUBMAP = 0,
		EXP_TYPE_SPECIAL = 0
	)
	var/lastupdate
/datum/player_experience/proc/update(var/key)
	if(!SSdbcore.IsConnected())
		return
	if(!ckey && !key)
		return
	if(!ckey)
		ckey = key

	if(lastupdate + 5 SECONDS > world.time)
		return

	var/datum/db_query/select_player_exp = SSdbcore.NewQuery(
		"SELECT exp FROM [format_table_name("player")] WHERE ckey = :ckey",
		list("ckey" = ckey)
	)

	if(!select_player_exp.Execute())
		return

	lastupdate = world.time

	if(select_player_exp.NextRow())
		var/list/explist = params2list(select_player_exp.item[1])
		for(var/i in explist)
			exp[i] = text2num(explist[i])


	QDEL_NULL(select_player_exp)

/datum/player_experience/proc/get_exp_for(var/branch, var/autoupdate = TRUE)
	if(!SSdbcore.IsConnected())
		return

	if(!branch)
		return

	if(autoupdate)
		src.update()

	return exp ? exp[branch] : 0

/datum/player_experience/proc/dep2arg(var/branch)
	switch(branch)
		if(ENG) return EXP_TYPE_ENGINEERING
		if(SEC) return EXP_TYPE_SECURITY
		if(MED) return EXP_TYPE_MEDICAL
		if(SCI) return EXP_TYPE_SCIENCE
		if(CIV) return EXP_TYPE_CIVILIAN
		if(COM) return EXP_TYPE_COMMAND
		if(MSC) return EXP_TYPE_SILICON
		if(SRV) return EXP_TYPE_SERVICE
		if(SUP) return EXP_TYPE_SUPPLY
		if(SPT) return EXP_TYPE_COMMAND
		if(EXP) return EXP_TYPE_EXPLORATION
		if(ROB) return EXP_TYPE_SILICON

// TRUE if cant play, FALSE if can. Yes...
/datum/player_experience/proc/check_exp_job(var/datum/job/job, var/autoupdate = TRUE)
	if(!SSdbcore.IsConnected())
		return

	if(!job)
		return

	if(autoupdate)
		src.update()

	var/need = job.need_exp_to_play
	if(!need)
		return
	var/jobflag = job.exp_track_branch ? job.exp_track_branch : job.department_flag

	var/have = src.get_exp_for(dep2arg(jobflag))/60
	return (need > have)

/client
	var/datum/player_experience/experience

/client/New()
	. = ..()
	if(src && !src.experience)
		src.experience = new()
		src.experience.update(src.ckey)
