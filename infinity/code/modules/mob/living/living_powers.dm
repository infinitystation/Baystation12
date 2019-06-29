/mob/living/proc/night_vision()
	set name = "Night Vision"
	set desc = "Turning on your natural ability."
	set category = "Abilities"


	if(src.see_invisible  == 25)
		see_invisible = 15
	else
		see_invisible = 25

// Не знаю куда это можно перенести, пусть пока будет тут
/mob/living/Move()
	. = ..()
	on_table_offset()

/mob/living/forceMove()
	. = ..()
	on_table_offset()

/mob/living/proc/on_table_offset()
	var/obj/structure/table/T = (locate() in get_turf(src))
	var/check = initial(default_pixel_y) + 12
	if(T && !T.flipped)
		if(!(pixel_y == check))
			animate(src, pixel_y = initial(default_pixel_y) + 12, time = 2, easing = SINE_EASING)
	else
		if(check && pixel_y != initial(default_pixel_y))
			animate(src, pixel_y = initial(default_pixel_y), time = 2, easing = SINE_EASING)
