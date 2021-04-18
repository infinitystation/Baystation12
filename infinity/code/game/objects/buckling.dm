/obj/forceMove()
	. = ..()
	if(buckled_mob)
		GLOB.moved_event.unregister(buckled_mob, src, /obj/proc/unbuckle_mob)
		buckled_mob.prepbucklemover = src
		addtimer(CALLBACK(buckled_mob, /mob/proc/ResetPrepareBuckleMove), 0, TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/Move()
	. = ..()
	if(buckled_mob)
		GLOB.moved_event.unregister(buckled_mob, src, /obj/proc/unbuckle_mob)
		buckled_mob.prepbucklemover = src
		addtimer(CALLBACK(buckled_mob, /mob/proc/ResetPrepareBuckleMove), 0, TIMER_UNIQUE|TIMER_OVERRIDE)

/mob/proc/ResetPrepareBuckleMove()
	if(prepbucklemover)
		GLOB.moved_event.register(src, prepbucklemover, /obj/proc/unbuckle_mob)
		prepbucklemover = null

/mob
	var/prepbucklemover

/mob/forceMove()
	. = ..()
	ResetPrepareBuckleMove()

/mob/Move()
	. = ..()
	ResetPrepareBuckleMove()
