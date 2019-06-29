/proc/remove_images_from_clients(image/I, list/show_to)
	for(var/client/C in show_to)
		C.images -= I

/proc/animate_speech_bubble(image/I, list/show_to, duration)
	var/matrix/M = matrix()
	M.Scale(0,0)
	I.transform = M
	I.alpha = 0
	for(var/client/C in show_to)
		C.images += I
	animate(I, transform = 0, alpha = 255, time = 0.2 SECONDS, easing = EASE_IN)
	addtimer(CALLBACK(GLOBAL_PROC, /.proc/fade_out, I), duration - 0.5 SECONDS)

/proc/fade_out(image/I, list/show_to)
	animate(I, alpha = 0, time = 0.5 SECONDS, easing = EASE_IN)
	addtimer(CALLBACK(GLOBAL_PROC, /.proc/remove_images_from_clients, I, show_to), 0.5 SECONDS)
