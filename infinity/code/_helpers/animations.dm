/proc/remove_images_from_clients(image/I, list/show_to)
	for(var/client/C in show_to)
		C.images -= I
		qdel(I)

/proc/animate_speech_bubble(image/I, list/show_to, duration)
	var/matrix/M = matrix()
	M.Scale(0,0)
	I.transform = M
	I.alpha = 0
	for(var/client/C in show_to)
		C.images += I
	animate(I, transform = 0, alpha = 255, time = 0.2 SECONDS, easing = EASE_IN)
	addtimer(CALLBACK(GLOBAL_PROC, /.proc/fade_out, I, show_to), duration - 0.5 SECONDS)

/proc/fade_out(image/I, list/show_to)
	animate(I, alpha = 0, time = 0.5 SECONDS, easing = EASE_IN)
	addtimer(CALLBACK(GLOBAL_PROC, /.proc/remove_images_from_clients, I, show_to), 0.5 SECONDS)

/proc/animated_teleportation(atom/movable/target, atom/anchor)
	if(ismob(target))
		to_chat(target, SPAN_WARNING("You feel like something pulling you in bluespace."))
	var/obj/effect/temporary/A = new(get_turf(target), 24.5, 'infinity/icons/effects/bs_silk.dmi', "silc_teleport_back")
	target.set_dir(2)
	target.forceMove(A)
	addtimer(CALLBACK(GLOBAL_PROC, .proc/animated_teleportation_ending, target, anchor), 23)

/proc/animated_teleportation_ending(atom/movable/target, atom/anchor)
	target.set_dir(2)
	target.forceMove(new /obj/effect/temporary(get_turf(anchor), 26.5, 'infinity/icons/effects/bs_silk.dmi', "silc_get_hub"))
	addtimer(CALLBACK(GLOBAL_PROC, .proc/finalize_animated_teleportation, target, anchor), 24)

/proc/finalize_animated_teleportation(atom/movable/target, atom/anchor)
	target.dropInto(get_turf(anchor))
