/datum/event/meteor_wave
	startWhen		= 5
	endWhen 		= 7
	var/next_meteor = 6
	var/waves = 1
	var/start_side

/datum/event/meteor_wave/setup()
	waves = severity * rand(1,3)
	start_side = pick(cardinal)
	endWhen = worst_case_end()

/datum/event/meteor_wave/announce()
	switch(severity)
		if(EVENT_LEVEL_MAJOR)
			command_announcement.Announce("По курсу станции был замечен метеоритный пояс.", "Тревога: Метеоритный поЯс", new_sound = 'sound/AI/meteors.ogg')
		else
			command_announcement.Announce("Внимание, станция вошла в область метеоров.", "Тревога: Метеоритный дождь")

/datum/event/meteor_wave/tick()
	if(waves && activeFor >= next_meteor)
		var/pick_side = prob(80) ? start_side : (prob(50) ? turn(start_side, 90) : turn(start_side, -90))

		spawn() spawn_meteors(severity * rand(1,2), get_meteors(), pick_side)
		next_meteor += rand(15, 30) / severity
		waves--
		endWhen = worst_case_end()

/datum/event/meteor_wave/proc/worst_case_end()
	return activeFor + ((30 / severity) * waves) + 10

/datum/event/meteor_wave/end()
	switch(severity)
		if(EVENT_LEVEL_MAJOR)
			command_announcement.Announce("Станция миновала метеоритный шторм.", "Тревога: Метеоритный шторм")
		else
			command_announcement.Announce("Станция миновала метеоритный дождь.", "Тревога: Метеоритный дождь")

/datum/event/meteor_wave/proc/get_meteors()
	switch(severity)
		if(EVENT_LEVEL_MAJOR)
			return meteors_catastrophic
		if(EVENT_LEVEL_MODERATE)
			return meteors_threatening
		else
			return meteors_normal
