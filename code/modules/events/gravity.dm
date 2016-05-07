/datum/event/gravity
	announceWhen = 5

/datum/event/gravity/setup()
	endWhen = rand(15, 60)

/datum/event/gravity/announce()
	command_announcement.Announce("ќбратная св€зь зафиксирована в системе массового распределения. »сскуственная гравитация была отключена, но система пытается реинициализировать еЄ обратно. ƒальнейшие ошибки в системе, могут привести к гравитационному сбою и формирированию чЄрных дыр.", "“ревога: ќтказ гравитации")

/datum/event/gravity/start()
	gravity_is_on = 0
	for(var/area/A in world)
		if(A.z in using_map.station_levels)
			A.gravitychange(gravity_is_on, A)

/datum/event/gravity/end()
	if(!gravity_is_on)
		gravity_is_on = 1

		for(var/area/A in world)
			if(A.z in using_map.station_levels)
				A.gravitychange(gravity_is_on, A)

		command_announcement.Announce("√равитационные генераторы снова функционируют в стабильном состо€нии. ћы приносим свои извинения за причинЄнные неудобства.", "√равитация восстановлена")
