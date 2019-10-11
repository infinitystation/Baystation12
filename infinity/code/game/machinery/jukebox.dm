/obj/machinery/media/jukebox
	var/obj/item/music_tape/tape

/obj/machinery/media/jukebox/verb/eject()
	set name = "Eject"
	set category = "Object"
	set src in oview(1)

	if(!CanPhysicallyInteract(usr))
		return

	if(tape)
		StopPlaying()
		current_track = null
		for(var/datum/track/T in tracks)
			if(T == tape.track)
				tracks -= T
		visible_message(SPAN_NOTICE("[usr] eject \the [tape] from \the [src]."))
		usr.put_in_hands(tape)
		tape = null
		verbs -= /obj/machinery/media/jukebox/verb/eject
