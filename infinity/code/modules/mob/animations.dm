/atom/movable/proc/receive_damage(atom/A)
	var/pixel_x_diff = rand(-2,2)
	var/pixel_y_diff = rand(-2,2)
	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)

/mob/living/receive_damage(atom/A)
	if(stat == DEAD) return //safety check

	var/pixel_x_diff = rand(-2,2)
	var/pixel_y_diff = rand(-2,2)
	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = default_pixel_x, pixel_y = default_pixel_y, time = 2)

/mob/living/proc/on_table_offset(var/reset = 0)
	var/check = initial(default_pixel_y) + 12
	if(reset)
		var/obj/structure/table/T = (locate() in get_turf(src))
		if(!T && check && pixel_y != initial(default_pixel_y))
			animate(src, pixel_y = initial(default_pixel_y), time = 2, easing = SINE_EASING)
	else
		if(!(pixel_y == check))
			animate(src, pixel_y = initial(default_pixel_y) + 12, time = 2, easing = SINE_EASING)

