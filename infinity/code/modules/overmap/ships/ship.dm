//Distress call

/obj/effect/overmap/visitable/ship
	var/distress = 0

/obj/effect/overmap/visitable/ship/Process()
	. = ..()
	if(distress)
		animate(src, transform = matrix() * 1.4, color = "#ff2222", time = 5)
		animate(transform = matrix(), color = initial(color), time = 5)
