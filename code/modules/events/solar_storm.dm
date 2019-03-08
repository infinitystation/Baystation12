/datum/event/solar_storm
	startWhen				= 45
	announceWhen			= 1
	var/const/rad_interval 	= 5  	//Same interval period as radiation storms.
	var/const/temp_incr     = 100
	var/const/fire_loss     = 40
	var/base_solar_gen_rate

/datum/event/solar_storm/setup()
	endWhen = startWhen + rand(30,90) + rand(30,90) //2-6 minute duration

/datum/event/solar_storm/announce()
	priority_announcement.Announce("ќбнаружено усиление солнечного ветра звезды [system_name()]. Ќасто€тельно рекомендуетс€ прекратить всю де€тельность на обшивке и вернутьс€ внутрь.", "—енсоры [location_name()]", zlevels = affecting_z)
	adjust_solar_output(1.5)

/datum/event/solar_storm/proc/adjust_solar_output(var/mult = 1)
	if(isnull(base_solar_gen_rate)) base_solar_gen_rate = solar_gen_rate
	solar_gen_rate = mult * base_solar_gen_rate

/datum/event/solar_storm/start()
	priority_announcement.Announce("”гроза солнечного ветра подтверждена - космическое пространство [location_name()] находитс€ в зоне поражени€. Ќасто€тельно рекомендуетс€ воздержатьс€ от любой де€тельности на обшивке до спада активности.", "—енсоры [location_name()]", zlevels = affecting_z)
	adjust_solar_output(5)

/datum/event/solar_storm/tick()
	if(activeFor % rad_interval == 0)
		radiate()

/datum/event/solar_storm/proc/radiate()
	// Note: Too complicated to be worth trying to use the radiation system for this.  Its only in space anyway, so we make an exception in this case.
	for(var/mob/living/L in GLOB.living_mob_list_)
		var/turf/T = get_turf(L)
		if(!T || !(T.z in GLOB.using_map.player_levels))
			continue

		if(!istype(T.loc,/area/space) && !istype(T,/turf/space))	//Make sure you're in a space area or on a space turf
			continue

		//Apply some heat or burn damage from the sun.
		if(istype(L, /mob/living/carbon/human))
			L.bodytemperature += temp_incr
		else
			L.adjustFireLoss(fire_loss)


/datum/event/solar_storm/end()
	priority_announcement.Announce("—ила солнечный ветер звезды [system_name()] вернулась к безопасному значению. –абота на обшивке может быть возобновлена.", "—енсоры [location_name()]", zlevels = affecting_z)
	adjust_solar_output()

//For a false alarm scenario.
/datum/event/solar_storm/syndicate/adjust_solar_output()
	return

/datum/event/solar_storm/syndicate/radiate()
	return
