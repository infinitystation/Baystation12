/datum/event/gravity
	announceWhen = 5

/datum/event/gravity/setup()
	endWhen = rand(15, 60)

/datum/event/gravity/announce()
	command_announcement.Announce("Отклонения в показателях генератора искусственной гравитации достигли неблагоприятного уровня. Искусственная гравитация сильно ослабнет на время перезапуска генератора.", "Гравитация Ослабла", zlevels = affecting_z)

/datum/event/gravity/start()
	gravity_is_on = 0
	for(var/area/A in world)
		if(A.z in affecting_z)
			A.gravitychange(gravity_is_on)

/datum/event/gravity/end()
	if(!gravity_is_on)
		gravity_is_on = 1

		for(var/area/A in world)
			if((A.z in affecting_z) && initial(A.has_gravity))
				A.gravitychange(gravity_is_on)

		command_announcement.Announce("Генератор гравитации успешно перекалиброван и запущен. Текущая сила притяжения - 9.8.", "Гравитация Восстановлена", zlevels = affecting_z)
