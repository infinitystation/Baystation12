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
	if(restrict_job && !(job in restrict_job))
		return 0

	if(disallow_job && (job in disallow_job))
		return 0

	return 1

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

/datum/spawnpoint/cryo/after_join(mob/living/carbon/human/victim)
	if(!istype(victim))
		return
	var/area/A = get_area(victim)
	var/list/spots = list()

	for(var/obj/machinery/cryopod/C in A)
		if(!C.occupant)
			spots += C

	for(var/obj/machinery/cryopod/C in shuffle(spots))
		if(!C.occupant)
			C.set_occupant(victim, 1)
			to_chat(victim,SPAN_NOTICE("Вы постепенно пробуждаетесь от крио-сна на [GLOB.using_map.full_name]."))
//[INF]
			victim.sleeping = 0 //INF
			victim.Sleeping(rand(2,7))
			if(!victim.isSynthetic())
				to_chat(victim,SPAN_WARNING("Тошнота, жажда, голод, сонливость - вот, что встречает Ваше ослабшее тело. \
				Не удалось даже нормально выспаться в этом гробу..."))
				victim.nutrition = rand(0,200)
				victim.hydration = rand(0,200)
				victim.SetStasis(10)
//[/INF]
			return

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
	always_visible = TRUE