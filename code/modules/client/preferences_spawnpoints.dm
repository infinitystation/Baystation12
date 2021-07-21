GLOBAL_VAR(spawntypes)

/proc/spawntypes()
	if(!GLOB.spawntypes)
		GLOB.spawntypes = list()
		for(var/type in typesof(/datum/spawnpoint)-/datum/spawnpoint)
			var/datum/spawnpoint/S = type
			var/display_name = initial(S.display_name)
			if((display_name in GLOB.using_map.allowed_spawns) || initial(S.always_visible))
				GLOB.spawntypes[display_name] = new S
	return GLOB.spawntypes

/datum/spawnpoint
	var/msg		  //Message to display on the arrivals computer.
	var/list/turfs   //List of turfs to spawn on.
	var/display_name //Name used in preference setup.
	var/always_visible = FALSE	// Whether this spawn point is always visible in selection, ignoring map-specific settings.
	var/list/restrict_job = null
	var/list/disallow_job = null

/datum/spawnpoint/proc/check_job_spawning(job)
//[INF]
	if(job && !istext(job)) //Cuz checking job titles
		crash_with("Somebody tried to check job spawning not by job title.")
		return FALSE
//[/INF]
	if(restrict_job && !(job in restrict_job))
		return 0

	if(disallow_job && (job in disallow_job))
		return 0

	return 1
//[INF]
/datum/spawnpoint/proc/can_spawn_here(mob/M, datum/job/job = null)
	. = TRUE
	if(job)
		var/job_spawning_check = any2bool(check_job_spawning(job.title))
		if(!job_spawning_check)
			to_chat(M, SPAN_WARNING("Your chosen spawnpoint ([display_name]) is unavailable for your chosen job ([job.title]).."))
		. = . && job_spawning_check
//[/INF]

//Called after mob is created, moved to a turf and equipped.
/datum/spawnpoint/proc/after_join(mob/victim)
	return

#ifdef UNIT_TEST
/datum/spawnpoint/Del()
	crash_with("Spawn deleted: [log_info_line(src)]")
	..()

/datum/spawnpoint/Destroy()
	crash_with("Spawn destroyed: [log_info_line(src)]")
	. = ..()
#endif

/datum/spawnpoint/arrivals
	display_name = "Arrivals Shuttle"
	msg = "has arrived on the station"

/datum/spawnpoint/arrivals/New()
	..()
	turfs = GLOB.latejoin

/datum/spawnpoint/gateway
	display_name = "Gateway"
	msg = "has completed translation from offsite gateway"

/datum/spawnpoint/gateway/New()
	..()
	turfs = GLOB.latejoin_gateway

/datum/spawnpoint/cryo
	display_name = "Cryogenic Storage"
	msg = "заканчивает пробуждение из крио-сна"
	disallow_job = list("Robot")

/datum/spawnpoint/cryo/New()
	..()
	turfs = GLOB.latejoin_cryo

/datum/spawnpoint/cryo/can_spawn_here(mob/M, datum/job/job = null)
	. = ..()

	if(.)
		var/list/spots = list()
		var/list/areas = list()
		for(var/turf/t in turfs)
			if(isturf(t))
				var/area/Ar = get_area(t)
				if(isarea(Ar) && !(Ar in areas))
					areas.Add(Ar)
		for(var/area/Area in areas)
			if(isarea(Area)) //equal if(A), but at the same time check isarea this shit
				for(var/obj/machinery/cryopod/C in Area)
					if(!C.occupant)
						spots += C
		var/Have_Availible_Place = any2bool(length(spots))
		if(M && !Have_Availible_Place)
			to_chat(M, SPAN_WARNING("No avalible cryopods to spawn at, spawning in another accessible spawnpoint."))
		. = . && Have_Availible_Place

/datum/spawnpoint/cryo/after_join(mob/living/carbon/human/victim)
	if(!istype(victim))
		return
	var/area/A = get_area(victim)
	var/list/spots = list()

	for(var/obj/machinery/cryopod/C in A)
		if(!C.occupant)
			spots += C
//[INF]
	if(!length(spots))
		to_chat(victim, "Вы проснулись чуть раньше остальных.")
		turfs -= get_turf(victim)
		return
//[/INF]

	for(var/obj/machinery/cryopod/C in shuffle(spots))
		if(!C.occupant)
			C.set_occupant(victim, 1)
/*[ORIG]
			victim.Sleeping(rand(1,3))
			to_chat(victim,SPAN_NOTICE("You are slowly waking up from the cryostasis aboard [GLOB.using_map.full_name]. It might take a few seconds."))
			return
[/ORIG]*/
//[INF]
			var/obj/effect/overmap/visitable/sector = map_sectors["[C.z]"]
			var/greetings = ". Это может занять пару секунд."
			if(sector && istype(sector))
				if(!sector.check_ownership(C))
					for(var/obj/effect/overmap/visitable/candidate in sector)
						if(candidate.check_ownership(C))
							sector = candidate
					greetings = " на [istype(sector, /obj/effect/overmap/visitable/ship) ? "судне" : "станции"] '[GLOB.using_map.full_name]'."
			to_chat(victim, SPAN_NOTICE("Вы пробуждаетесь от крио-сна[greetings]"))
			victim.Sleeping(3)
			victim.bodytemperature = victim.species.cold_level_1 //very cold, but a point before damage

			if(!victim.isSynthetic()) //fluff. I didn't used else at next lines because of code readness
				to_chat(victim, SPAN_NOTICE("Вы чувствуете озноб и капли воды на себе. Криогенная жидкость только \
				прекратила охлаждать атмосферу внутри капсулы... Сквозь веки бьёт яркий свет, пытаясь заставить проснуться. \
				Похоже, смена начинается."))
			else
				to_chat(victim, SPAN_NOTICE("Получен сигнал к пробуждению. Батарея заряжена. Все системы в норме."))

			if(!victim.isSynthetic())
				give_effect(victim)
				give_advice(victim)

//[/INF]
			break//inf, was: return

/datum/spawnpoint/cyborg
	display_name = "Cyborg Storage"
	msg = "был перемещен из хранилища и активирован"
	restrict_job = list("Robot")

/datum/spawnpoint/cyborg/New()
	..()
	turfs = GLOB.latejoin_cyborg

/datum/spawnpoint/default
	display_name = DEFAULT_SPAWNPOINT_ID
	msg = "has arrived on the station"
