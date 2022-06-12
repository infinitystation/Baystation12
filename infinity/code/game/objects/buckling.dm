/obj/forceMove()
	. = ..()
	if(buckled_mob)
		GLOB.moved_event.unregister(buckled_mob, src, /obj/proc/check_for_unbuckle)
		buckled_mob.prepbucklemover = src
		addtimer(CALLBACK(buckled_mob, /mob/proc/ResetPrepareBuckleMove), 0, TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/Move()
	. = ..()
	if(buckled_mob)
		buckled_mob.set_glide_size(src.glide_size)
		GLOB.moved_event.unregister(buckled_mob, src, /obj/proc/check_for_unbuckle)
		buckled_mob.prepbucklemover = src
		addtimer(CALLBACK(buckled_mob, /mob/proc/ResetPrepareBuckleMove), 0, TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/proc/check_for_unbuckle(var/mob/movable, var/oldloc, var/newloc)
	if(!buckled_mob || (buckled_mob != movable))
		return
	// F*** YOU AREAS
	if(isarea(oldloc) || isarea(newloc))
		return
	// Relax bro, nobody touched your mob, it's just shticode magic
	if(get_turf(src)==get_turf(movable))
		return
	unbuckle_mob()

/mob/proc/ResetPrepareBuckleMove()
	if(prepbucklemover)
		GLOB.moved_event.register(src, prepbucklemover, /obj/proc/check_for_unbuckle)
		prepbucklemover = null

/mob
	var/prepbucklemover

/mob/forceMove()
	. = ..()
	ResetPrepareBuckleMove()

/mob/Move()
	. = ..()
	ResetPrepareBuckleMove()
