/obj/machinery/media/jukebox
	var/obj/item/device/cassette/cassette

/obj/machinery/media/jukebox/verb/eject()
	set name = "Eject"
	set category = "Object"
	set src in oview(1)

	if(!CanPhysicallyInteract(usr))
		return

	if(cassette)
		StopPlaying()
		current_track = null
		for(var/datum/track/T in tracks)
			if(T == cassette.track)
				tracks -= T
		visible_message("<span class='notice'>[usr] eject the cassette from \the [src].</span>")
		usr.put_in_hands(cassette)
		cassette = null
		verbs -= /obj/machinery/media/jukebox/verb/eject
