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
	priority_announcement.Announce("Обнаружено повышение энергии звезды [system_name()] - имеется опасность солнечного шторма. Настоятельно рекомендуется прекратить всю деятельность на обшивке и вернуться внутрь.", "Сенсоры [location_name()]", zlevels = affecting_z)
	adjust_solar_output(1.5)

/datum/event/solar_storm/proc/adjust_solar_output(var/mult = 1)
	if(isnull(base_solar_gen_rate)) base_solar_gen_rate = solar_gen_rate
	solar_gen_rate = mult * base_solar_gen_rate


/datum/event/solar_storm/start()
	priority_announcement.Announce("Угроза солнечного шторма подтверждена - космическое пространство [location_name()] находится в зоне действия. Настоятельно рекомендуется воздержаться от любой деятельности на обшивке до окончания шторма.", "Сенсоры [location_name()]", zlevels = affecting_z)
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
	priority_announcement.Announce("The solar storm has passed the [location_name()]. It is now safe to resume EVA activities. ", "Сенсоры [location_name()]", zlevels = affecting_z)
	adjust_solar_output()


//For a false alarm scenario.
/datum/event/solar_storm/syndicate/adjust_solar_output()
	return

/datum/event/solar_storm/syndicate/radiate()
	return
