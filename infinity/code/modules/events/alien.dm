/datum/event/aliens
	announceWhen = 495
	var/spawncount = 3 //Was 1, too hard and there was a chance of bug with no larvas

/datum/event/aliens/announce()
	GLOB.using_map.level_x_biohazard_announcement(9)

/datum/event/aliens/start()
	var/list/candidates = list()
	var/list/spawn_locations = list()

//searching of candidates

	var/i = 0
	while(candidates.len <= 0 && i < 5)
		for(var/mob/observer/ghost/G in GLOB.player_list)
//			if(MODE_XENOMORPH in G.client.prefs.be_special_role)
			if(((G.client.inactivity/10)/60) <= 1 + i) // the most active players are more likely to become an alien
				if(G.mind)
					if(alert(G, "Do you want to join as a Xenophage larva?", "Become Larva", "No", "Yes")== "Yes")
						candidates += G.key
		i++

	if(!candidates.len)
		kill()
		return

//searching for spawning locations

	for(var/obj/effect/landmark/L in landmarks_list)
		if(L.name == "xeno_spawn" && (L.z in affecting_z))
			spawn_locations.Add(L.loc)

	if(!spawn_locations.len)
		for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in SSmachines.machinery)
			if(!temp_vent.welded && temp_vent.network && (temp_vent.loc.z in affecting_z))
				if(temp_vent.network.normal_members.len > 50)
					spawn_locations.Add(temp_vent.loc)

	spawn_locations = shuffle(spawn_locations)

	if(!spawn_locations.len)
		kill()
		return

// spawning

	if(prob(40)) spawncount++ //sometimes, have two larvae spawn instead of one
	while(spawncount >= 1 && spawn_locations.len && candidates.len)
		var/obj/spot = pick(spawn_locations)
		var/xeno = pick(candidates)

		var/mob/living/carbon/alien/larva/new_xeno = new(spot)
		new_xeno.key = xeno
		new_xeno.auto_progress = 1
		GLOB.xenomorphs.add_antagonist(new_xeno.mind, 1)

//		for(var/mob/observer/ghost/O in GLOB.ghost_mob_list)
//			to_chat(O, FONT_LARGE(SPAN_NOTICE(
//			"Появилась личинка пришельцев! [new_xeno.key ? "" : "Нажмите на неё, чтобы занять тело."] ([ghost_follow_link(new_xeno, O)])")))
		spawn_locations -= spot
		spawncount--
		xeno -= candidates
