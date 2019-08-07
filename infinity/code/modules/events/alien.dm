/datum/event/aliens
	announceWhen = 250
	var/spawncount = 1

/datum/event/aliens/announce()
	GLOB.using_map.level_x_biohazard_announcement(9)

/datum/event/aliens/start()
	var/list/spawn_locations = list()

	for(var/obj/effect/landmark/L in landmarks_list)
		if(L.name == "xeno_spawn" && (L.z in affecting_z))
			spawn_locations.Add(L.loc)

	if(!spawn_locations.len)
		for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in SSmachines.machinery)
			if(!temp_vent.welded && temp_vent.network && temp_vent.loc.z in affecting_z)
				if(temp_vent.network.normal_members.len > 50)
					spawn_locations.Add(temp_vent.loc)

	spawn_locations = shuffle(spawn_locations)

	while((spawncount >= 1) && spawn_locations.len)
		var/obj/spot = pick(spawn_locations)
		var/mob/living/carbon/alien/larva/nodle = new /mob/living/carbon/alien/larva(spot)
		nodle.auto_progress = 1
		for(var/mob/observer/ghost/O in GLOB.ghost_mob_list)
			to_chat(O, FONT_LARGE(SPAN_NOTICE(
			"По&#255;вилась личинка пришельцев! Нажмите на неё, чтобы зан&#255;ть тело. ([ghost_follow_link(nodle, O)])")))
		spawn_locations -= spot
		spawncount--
