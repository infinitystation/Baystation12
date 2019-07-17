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
	if(species)
		var/static/mutable_appearance/electrocution_skeleton_anim
		if(!electrocution_skeleton_anim)
			electrocution_skeleton_anim = mutable_appearance('infinity/icons/mob/mob.dmi', "electrocuted_base")
			electrocution_skeleton_anim.appearance_flags |= RESET_COLOR|KEEP_APART
		overlays.Add(electrocution_skeleton_anim)
		addtimer(CALLBACK(src, .proc/end_electrocution_animation, electrocution_skeleton_anim), anim_duration)
	else //or just do a generic animation
		flick_overlay_view(image('infinity/icons/mob/mob.dmi',src,"electrocuted_generic", MOB_LAYER + 1), src, anim_duration)

/mob/living/carbon/human/proc/end_electrocution_animation(mutable_appearance/MA)
	overlays.Cut(MA)
