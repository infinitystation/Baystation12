/datum/event/rogue_drone
	endWhen = 1000
	var/list/drones_list = list()

/datum/event/rogue_drone/start()
	//spawn them at the same place as carp
	var/list/possible_spawns = list()
	for(var/obj/effect/landmark/C in landmarks_list)
		if(C.name == "carpspawn")
			possible_spawns.Add(C)

	//25% chance for this to be a false alarm
	var/num
	if(prob(25))
		num = 0
	else
		num = rand(2,6)
	for(var/i=0, i<num, i++)
		var/mob/living/simple_animal/hostile/retaliate/malf_drone/D = new(get_turf(pick(possible_spawns)))
		drones_list.Add(D)
		if(prob(25))
			D.disabled = rand(15, 60)

/datum/event/rogue_drone/announce()
	var/msg
	if(prob(33))
		msg = "Внимание: неавторизованные патрульные дроны обнаружены в космическом пространстве [location_name()]"
	else if(prob(50))
		msg = "Неавторизованные патрульные дроны замечены в космическом пространстве [location_name()]. Всему экипажу быть на чеку."
	else
		msg = "Множество маломощных энергетических источников обнаружено в космическом пространстве [location_name()]."
	priority_announcement.Announce(msg, "Сенсоры [location_name()]", zlevels = affecting_z)

/datum/event/rogue_drone/end()
	var/num_recovered = 0
	for(var/mob/living/simple_animal/hostile/retaliate/malf_drone/D in drones_list)
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, D.loc)
		sparks.start()
		D.z = GLOB.using_map.admin_levels[1]
		D.has_loot = 0

		qdel(D)
		num_recovered++

	if(num_recovered > drones_list.len * 0.75)
		priority_announcement.Announce("Be advised: sensors indicate the unidentified drone swarm has left the immediate proximity of the [location_name()].", "Сенсоры [location_name()]", zlevels = affecting_z)
	else
		priority_announcement.Announce("Be advised: sensors indicate the unidentified drone swarm has left the immediate proximity of the [location_name()].", "Сенсоры [location_name()]", zlevels = affecting_z)
