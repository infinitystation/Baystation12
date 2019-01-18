/datum/event/rogue_maint_drones/start()
	var/drons = severity * 2 - 1
	var/groups = rand(3,8)

	var/list/spots = get_infestation_turfs()
	for(var/i = 0 to groups)
		if(!LAZYLEN(spots))
			break
		var/turf/T = pick(spots)
		for(var/j = 0 to drons)
			new/mob/living/simple_animal/hostile/rogue_drone(T)

/datum/event/rogue_maint_drones/announce()
	var/stealth_chance = 70 - 20*severity
	if(prob(stealth_chance))
		return
	var/naming
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			naming = "Один сбойный дрон"
		if(EVENT_LEVEL_MODERATE)
			naming = "Четверо сбойных дронов"
		if(EVENT_LEVEL_MAJOR)
			naming = "Шесть и более сбойных дронов"
	priority_announcement.Announce("[naming] обнаружена в технических помещениях судна. Требуется устранение дронов силами Службы Безопасности.", "Станция Контроля Дронов", zlevels = affecting_z)

/datum/event/rogue_maint_drones/proc/get_infestation_turfs()
	var/area/location = pick_area(list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_maint_area))
	if(!location)
		log_debug("Drone infestation failed to find a viable area. Aborting.")
		kill()
		return

	var/list/dron_turfs = get_area_turfs(location, list(/proc/not_turf_contains_dense_objects, /proc/IsTurfAtmosSafe))
	if(!dron_turfs.len)
		log_debug("Drone infestation failed to find viable turfs in \the [location].")
		kill()
		return
	return dron_turfs