/datum/event/aliens
	announceWhen = 495
	var/spawncount = 1

/datum/event/aliens/announce()
	GLOB.using_map.level_x_biohazard_announcement(9)

/datum/event/aliens/start()
	var/list/candidates = list()
	var/list/spawn_locations = list()

//searching of candidates

	for(var/mob/observer/ghost/G in GLOB.player_list)
		if(MODE_XENOMORPH in G.client.prefs.be_special_role)
			if(!(G.mind && G.mind.current && G.mind.current.stat != DEAD))
				sleep(0)
				var/confirm = alert(G, "Do you want to join as a Xenophage larva?", "Become Larva", "No", "Yes")
				if(confirm == "Yes")
					candidates += G.key
	sleep(150) //for thinking

//searching for spawning locations

	for(var/obj/effect/landmark/L in landmarks_list)
		if(L.name == "xeno_spawn" && (L.z in affecting_z))
			spawn_locations.Add(L.loc)

	if(!spawn_locations.len)
		for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in SSmachines.machinery)
			if(!temp_vent.welded && temp_vent.network && temp_vent.loc.z in affecting_z)
				if(temp_vent.network.normal_members.len > 50)
					spawn_locations.Add(temp_vent.loc)

	spawn_locations = shuffle(spawn_locations)

// spawning

	if(prob(40)) spawncount++ //sometimes, have two larvae spawn instead of one
	while((spawncount >= 1) && spawn_locations.len && candidates.len)
		var/obj/spot = pick(spawn_locations)
		var/xeno = pick(candidates)

		var/mob/living/carbon/alien/larva/new_xeno = new(spot)
		new_xeno.key = xeno
		new_xeno.auto_progress = 1
		GLOB.xenomorphs.add_antagonist(new_xeno.mind, 1)

//		for(var/mob/observer/ghost/O in GLOB.ghost_mob_list)
//			to_chat(O, FONT_LARGE(SPAN_NOTICE(
//			"По&#255;вилась личинка пришельцев! [new_xeno.key ? "" : "Нажмите на неё, чтобы зан&#255;ть тело."] ([ghost_follow_link(new_xeno, O)])")))
		spawn_locations -= spot
		spawncount--
		xeno -= candidates