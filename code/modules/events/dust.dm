/datum/event/dust
	startWhen	= 10
	endWhen		= 30

/datum/event/dust/announce()
	command_announcement.Announce("—танция входит в зону космической пыли.", "“ревога:  осмическая пыль")

/datum/event/dust/start()
	dust_swarm(get_severity())

/datum/event/dust/end()
	command_announcement.Announce("—танция вышла из зоны космической пыли.", "”ведомление:  осмическая пыль")

/datum/event/dust/proc/get_severity()
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			return "weak"
		if(EVENT_LEVEL_MODERATE)
			return prob(80) ? "norm" : "strong"
		if(EVENT_LEVEL_MAJOR)
			return "super"
	return "weak"
