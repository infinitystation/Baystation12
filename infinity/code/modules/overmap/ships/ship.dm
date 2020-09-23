//Distress call

/obj/effect/overmap/visitable/ship
	var/distress = 0

/obj/effect/overmap/visitable/ship/Process()
	. = ..()
	if(distress)
		animate(src, transform = matrix()*1.4, time = 5)
		animate(src, transform = matrix(), time = 10)
		animate(src, color = "#ff2222", time = 5)
		animate(src, color = initial(color), time = 5)