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

//Turns a mob black, flashes a skeleton overlay
//Just like a cartoon!
/mob/living/carbon/human/proc/electrocution_animation(anim_duration)
	var/atom/movable/overlay/animation = new(src)
	animation.plane = src.plane
	animation.layer = src.layer + 1
	animation.icon_state = "blank"
	animation.icon = 'infinity/icons/mob/mob.dmi'
	flick("electrocuted_base", animation)
	QDEL_IN(animation, anim_duration)
