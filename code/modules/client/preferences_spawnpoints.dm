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
			victim.sleeping = 0 //INF
			victim.Sleeping(rand(2,7))
			victim.bodytemperature = victim.species.cold_level_1 //very cold, but a point before damage
			if(!victim.isSynthetic()) //fluff. I didn't used else at next lines because of code readness
				to_chat(victim, SPAN_NOTICE("Вы чувствуете озноб и капли воды на себе. Криогенная жидкость только \
				прекратила охлаждать атмосферу внутри капсулы... Сквозь веки бьёт яркий свет, пытаясь заставить проснуться. \
				Похоже, смена начинается."))
			else
				to_chat(victim, SPAN_NOTICE("Получен сигнал к пробуждению. Батарея заряжена. Все системы в норме."))
			if(!victim.isSynthetic())
				var/msg
/* bad ideas
				if(prob(5))
					victim.make_dizzy(200) //sea sick, it would make you mad very fast
*/
				if(prob(20)) //starvation
					msg += SPAN_WARNING("Кажется, вы забыли поесть перед тем, как уйти в сон. Горло пересохло, а \
					живот скрутило в спазме. ")
					victim.nutrition = rand(0,200)
					victim.hydration = rand(0,200)
					if(victim.species.name == SPECIES_UNATHI)
						victim.nutrition = 100
				if(prob(15)) //stutterting and jittering (because of cold?)
					msg += SPAN_WARNING("Трясет от холода. ")
					victim.make_jittery(120)
					victim.stuttering = 20
				if(prob(10)) //hallucinations
					msg += SPAN_WARNING("В ушках звон, в голове белый шум... ")
					victim.hallucination(100, 120)
				if(prob(5)) //side medical effect. Stealth
					victim.add_side_effect(pick(GLOB.all_medical_side_effects))
				if(prob(5)) //cryo malfunction
					msg += SPAN_DANGER("Вы чувствуете ужасающий холод во всём теле! Крио всё ещё охлаждает! ")
					victim.bodytemperature = victim.species.cold_level_3
				if(prob(5)) //vomit
					msg += SPAN_WARNING("Тошнит... ")
					victim.vomit()
				if(prob(5)) //sleepy crewman syndrome
					msg += SPAN_WARNING("Вы долго не могли уснуть, не смотря на все усилия этой машины. \
					Так не хочется вставать... Ноги ватные, руки тяжелые... ")
					victim.drowsyness += 39 //59 seconds with high chance to fall asleep
				if(!msg)
					msg += SPAN_NOTICE("Кажется, в этот раз без осложнений... Правда, выспаться в саркофаге всё равно не удалось.")
				else
					msg += SPAN_WARNING("Не удалось даже нормально выспаться в этом гробу...")
				to_chat(victim, msg)
				victim.drowsyness += 20
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