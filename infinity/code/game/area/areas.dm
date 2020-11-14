/*TODO
/area/proc/play_ambience(var/mob/living/L)
	// Ambience goes down here -- make sure to list each area seperately for ease of adding things in later, thanks! Note: areas adjacent to each other should have the same sounds to prevent cutoff when possible.- LastyScratch
	if(!(L && L.client && L.get_preference_value(/datum/client_preference/play_ambiance) == GLOB.PREF_YES))	return
	var/timer_id = addtimer(CALLBACK(src, .proc/reset_client_ambience_playing, L), 20 SECONDS, TIMER_STOPPABLE)
	if(!L.client.ambience_playing)
		var/hum = 0
		if(L.get_sound_volume_multiplier() >= 0.2 && !always_unpowered && power_environ)
			for(var/obj/machinery/atmospherics/unary/vent_pump/vent in src)
				if(vent.can_pump())
					hum = 1
					break
		if(hum)
			play_sound_to(
				L,
				list('sound/ambience/shipambience.ogg'),
				list(
					"repeat" = 2,
					"wait" = 0,
					"volume" = 20,
					"channel" = GLOB.ambience_sound_channel
					)
				)
			deltimer(timer_id)

		if(L.lastarea != src)
			if(LAZYLEN(forced_ambience))
				forced_ambiance_list |= L
				play_sound_to(
					L,
					forced_ambience,
					list(
						"repeat" = 1,
						"wait" = 0,
						"volume" = 25,
						"channel" = GLOB.lobby_sound_channel
						)
					)
				deltimer(timer_id)
			else
				sound_to(L, sound(null, channel = GLOB.forced_ambience_sound_channel))
				forced_ambiance_list -= L


		if(ambience.len && prob(AMBIENCE_CHANCE))
			play_sound_to(
				L,
				ambience,
				list(
					"repeat" = 0,
					"wait" = 0,
					"volume" = 15,
					"channel" = GLOB.ambience_sound_channel
					)
				)
			L.client.played = world.time
			deltimer(timer_id)
		if(timer_id) L.client.ambience_playing = timer_id


/area/proc/reset_client_ambience_playing(mob/living/M)
	M.client.ambience_playing = 0
	. = M.client.ambience_playing

/area/proc/play_sound_to(mob/living/L, list/sounds2pick, list/params = list())
	var/sound/amb
	var/turf/T = get_turf(L)
	var/channel = params["channel"]
	if(!channel) channel = GLOB.ambience_sound_channel

	if(sounds2pick.len) amb = pick(sounds2pick)
	params.Insert(1, amb)
	if(params) params = list2params(params)

	if(!(amb && T && istype(T))) return
	L.playsound_local(T, sound(params))

	L.client.played = world.time

	var/list/query = L.client.SoundQuery()
	for(var/sound/A in query) if(A.channel == channel) L.client.ambience_playing = addtimer(CALLBACK(src, .proc/reset_client_ambience_playing, L), A.len SECONDS)

	return amb*/

/area/proc/play_ambience(var/mob/living/L)
	// Ambience goes down here -- make sure to list each area seperately for ease of adding things in later, thanks! Note: areas adjacent to each other should have the same sounds to prevent cutoff when possible.- LastyScratch
	if(!(L && L.client && L.get_preference_value(/datum/client_preference/play_ambiance) == GLOB.PREF_YES))	return

	var/turf/T = get_turf(L)
	var/hum = 0
	if(L.get_sound_volume_multiplier() >= 0.2 && !always_unpowered && power_environ)
		for(var/obj/machinery/atmospherics/unary/vent_pump/vent in src)
			if(vent.can_pump())
				hum = 1
				break
/*	if(hum)
		if(!L.client.ambience_playing)
			L.client.ambience_playing = 1
			L.playsound_local(T,sound('sound/ambience/shipambience.ogg', repeat = 1, wait = 0, volume = 20, channel = GLOB.ambience_sound_channel))
	else
		if(L.client.ambience_playing)
			L.client.ambience_playing = 0
			sound_to(L, sound(null, channel = GLOB.ambience_sound_channel))*/
	if(hum) ambience |= 'sound/ambience/shipambience.ogg'
	else ambience -= 'sound/ambience/shipambience.ogg'

	if(L.lastarea != src)
		if(LAZYLEN(forced_ambience))
			forced_ambiance_list |= L
			L.playsound_local(T,sound(pick(forced_ambience), repeat = 1, wait = 0, volume = 25, channel = GLOB.lobby_sound_channel))
		else	//stop any old area's forced ambience, and try to play our non-forced ones
			sound_to(L, sound(null, channel = GLOB.lobby_sound_channel))
			forced_ambiance_list -= L
	if(ambience.len && prob(5) && (world.time >= L.client.played + 3 MINUTES))
		L.sound_to(T, sound(pick(ambience), repeat = 0, wait = 0, volume = 15, channel = GLOB.lobby_sound_channel))
		L.client.played = world.time
