/*
Taking a hint from goon, I thought I'd start our own animation library. These are stock animations you can use for anything.
Just make sure to add animations that you make here so that they may be re-used. Please document how the animation
functions so that other people won't have to wonder what it actually does.
*/

/*
This is something like a gun spin, where the user spins it in the hand.
Instead of being uniform, it starts out a littler slower, goes fast in the middle, then slows down again.
4 ticks * 5 = 2.0 seconds. Doesn't loop on default, and spins right.
*/
/proc/animation_wrist_flick(atom/A, direction = 1, loop_num = 0) //-1 for a left spin.
	animate(A, transform = matrix(120 * direction, MATRIX_ROTATE), time = 1, loop = loop_num, easing = SINE_EASING|EASE_IN)
	animate(transform = matrix(240 * direction, MATRIX_ROTATE), time = 1)
	animate(transform = null, time = 2, easing = SINE_EASING|EASE_OUT)

//Makes it look like the user threw something in the air (north) and then caught it.
/proc/animation_toss_snatch(atom/A)
	A.transform *= 0.75
	animate(A, alpha = 185, pixel_x = rand(-4,4), pixel_y = 18, pixel_z = 0, time = 3)
	animate(pixel_x = 0, pixel_y = 0, pixel_z = 0, time = 3)

//Combines the flick and the toss to have the item spin in the air.
/proc/animation_toss_flick(atom/A, direction = 1)
	A.transform *= 0.75
	animate(A, transform = matrix(120 * direction, MATRIX_ROTATE), alpha = 185, pixel_x = rand(-4,4), pixel_y = 18, time = 3, easing = SINE_EASING|EASE_IN)
	animate(transform = matrix(240 * direction, MATRIX_ROTATE), pixel_x = 0, pixel_y = 0, time = 2)


//Flashes a color, then goes back to regular.
/proc/animation_flash_color(atom/A, flash_color = "#ff0000", speed = 3) //Flashes red on default.
	var/oldcolor = A.color
	animate(A, color = flash_color, time = speed)
	animate(color = oldcolor, time = speed)

//Gives it a spooky overlay and animation. Same as above, mostly, only adds a cool overlay effect.
/proc/animation_horror_flick(atom/A, flash_color = "#000000", speed = 4)
	animate(A, color = flash_color, time = speed)
	animate(color = "#ffffff", time = speed)
	var/image/I = image('icons/mob/mob.dmi',A,"spook")
	flick_overlay_view(I, A, 7)


/proc/animatation_displace_reset(atom/A, x_n = 2, y_n = 2, speed = 3)
	var/x_o = initial(A.pixel_x)
	var/y_o = initial(A.pixel_y)
	animate(A, pixel_x = x_o+rand(-x_n, x_n), pixel_y = y_o+rand(-y_n, y_n), time = speed, easing = ELASTIC_EASING|EASE_IN)
	animate(pixel_x = x_o, pixel_y = y_o, time = speed, easing = CIRCULAR_EASING|EASE_OUT)

//Basic megaman-like animation. No bells or whistles, but looks nice.
/proc/animation_teleport_quick_out(atom/A, speed = 10)
	animate(A, transform = matrix(0, 4, MATRIX_SCALE), alpha = 0, time = speed, easing = BACK_EASING)
	return speed

//We want to make sure to reset color here as it can be changed by other animations.
/proc/animation_teleport_quick_in(atom/A, speed = 10)
	A.transform = matrix(0, 4, MATRIX_SCALE)
	A.alpha = 0 //Start with transparency, just in case.
	animate(A, alpha = 255, transform = null, color = "#ffffff", time = speed, easing = BACK_EASING)

/*A magical teleport animation, for when the person is transported with some magic. Good for Halloween type events.
Can look good elsewhere as well.*/
/proc/animation_teleport_magic_out(atom/A, speed = 6)
	animate(A, transform = matrix(1.5, 0, MATRIX_SCALE), time = speed, easing = BACK_EASING)
	animate(transform = matrix(0, 4, MATRIX_SCALE) * matrix(0, 6, MATRIX_TRANSLATE), color = "#ffff00", time = speed, alpha = 100, easing = BOUNCE_EASING|EASE_IN)
	animate(alpha = 0, time = speed)
	var/image/I = image('icons/effects/effects.dmi',A,"sparkle")
	flick_overlay_view(I, A, 9)
	return speed*3

/proc/animation_teleport_magic_in(atom/A, speed = 6)
	A.transform = matrix(0,3.5, MATRIX_SCALE)
	A.alpha = 0
	animate(A, alpha = 255, color = "#ffff00", time = speed, easing = BACK_EASING)
	animate(transform = matrix(1.5, 0, MATRIX_SCALE), color = "#ffffff", time = speed, easing = CIRCULAR_EASING|EASE_OUT)
	animate(transform = null, time = speed-1)
	var/image/I = image('icons/effects/effects.dmi',A,"sparkle")
	flick_overlay_view(I, A, 10)

//A spooky teleport for evil dolls, horrors, and whatever else. Halloween type stuff.
/proc/animation_teleport_spooky_out(atom/A, speed = 6, sleep_duration = 0)
	animate(A, transform = matrix() * 1.5, color = "#551a8b", time = speed, easing = BACK_EASING)
	animate(transform = matrix() * 0.2, alpha = 100, color = "#000000", time = speed, easing = BACK_EASING)
	animate(alpha = 0, time = speed)
	var/image/I = image('icons/effects/effects.dmi',A,"spooky")
	flick_overlay_view(I, A, 9)
	return speed*3

/proc/animation_teleport_spooky_in(atom/A, speed = 4)
	A.transform *= 1.2
	A.alpha = 0
	animate(A, alpha = 255, color = "#551a8b", time = speed)
	animate(transform = null, color = "#ffffff", time = speed, easing = QUAD_EASING|EASE_OUT)
	var/image/I = image('icons/effects/effects.dmi',A,"spooky")
	flick_overlay_view(I, A, 10)

//Regular fadeout disappear, for most objects.
/proc/animation_destruction_fade(atom/A, speed = 12)
	A.mouse_opacity = 0 //We don't want them to click this while the animation is still playing.
	A.density = FALSE //So it doesn't block anything.
	var/i = 1 + (0.1 * rand(1,5))
	animate(A, transform = matrix() * i, color = "#808080", time = speed, easing = SINE_EASING)
	animate(alpha = 0, time = speed)
	return speed

//Fadeout when something gets hit. Not completely done yet, as offset doesn't want to cooperate.
/proc/animation_destruction_knock_fade(atom/A, speed = 7, x_n = rand(10,18), y_n = rand(10,18))
	A.mouse_opacity = 0
	A.density = FALSE
	var/x_o = initial(A.pixel_x)
	var/y_o = initial(A.pixel_y)
	animate(A, transform = matrix() * 1.2,  alpha = 100, pixel_x = x_o + pick(x_n,-x_n), pixel_y = y_o + pick(y_n,-y_n), time = speed, easing = QUAD_EASING|EASE_IN)
	animate(transform = matrix(rand(45,90) * pick(1,-1), MATRIX_ROTATE), alpha = 0, time = speed, easing = SINE_EASING|EASE_OUT)
	return speed*2


/atom/proc/animation_spin(speed = 5, loop_amount = -1, clockwise = TRUE, sections = 3)
	if(!sections)
		return
	var/section = 360/sections
	if(!clockwise)
		section = -section
	var/list/matrix_list = list()
	for(var/i in 1 to sections-1)
		var/matrix/M = matrix(transform)
		M.Turn(section*i)
		matrix_list += M
	var/matrix/last = matrix(transform)
	matrix_list += last
	speed /= sections
	animate(src, transform = matrix_list[1], time = speed, loop_amount)
	for(var/i in 2 to sections)
		animate(transform = matrix_list[i], time = speed)


//// G O O N ////

/proc/animate_fade_grayscale_in(atom/A, time = 5)
	if (!istype(A) && !isclient(A))
		return
	A.color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1)
	animate(A, color = list(0.33, 0.33, 0.33, 0, 0.33, 0.33, 0.33, 0, 0.33, 0.33, 0.33, 0, 0, 0, 0, 1), time = time, easing = SINE_EASING)
	return

/proc/animate_fadegrayscale(atom/A, time = 5)
	if (!istype(A) && !isclient(A))
		return
	A.color = list(0.33, 0.33, 0.33, 0, 0.33, 0.33, 0.33, 0, 0.33, 0.33, 0.33, 0, 0, 0, 0, 1)
	animate(A, color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1), time = time, easing = SINE_EASING)
	return

/proc/animate_tile_dropaway(atom/A)
	if(!istype(A)) return
	if(prob(10)) playsound(A, "sound/effects/creaking_metal[pick("1", "2")].ogg", 40, 1)

	var/image/underneath = image('infinity/icons/effects/white.dmi')
	underneath.appearance_flags = RESET_TRANSFORM | RESET_COLOR | RESET_ALPHA
	A.underlays += underneath

	var/matrix/pivot = matrix()
	pivot.Scale(0.2, 1.0)
	pivot.Translate(-16, 0)

	var/matrix/shrink = matrix()
	shrink.Scale(0.0, 0.0)
	animate(A, color = "#808080", transform = pivot, time = 30, easing = BOUNCE_EASING)
	animate(color = "#ffffff", alpha = 0, transform = shrink, time = 10, easing = SINE_EASING)

/proc/attack_twitch(atom/A)
	if(!istype(A)) return

	var/which = A.dir

	var/ipx = A.pixel_x
	var/ipy = A.pixel_y
	var/movepx = 0
	var/movepy = 0
	switch(which)
		if(NORTH)
			movepy = 3
		if(WEST)
			movepx = -3
		if(SOUTH)
			movepy = -3
		if(EAST)
			movepx = 3
		if(NORTHEAST)
			movepx = 3
		if(NORTHWEST)
			movepy = 3
		if(SOUTHEAST)
			movepy = -3
		if(SOUTHWEST)
			movepx = -3
		else
			return

	var/x = movepx + ipx
	var/y = movepy + ipy

	animate(A, pixel_x = x, pixel_y = y, time = 0.6, easing = EASE_OUT)
	var/matrix/M = matrix(A.transform)
	animate(transform = turn(A.transform, (movepx - movepy) * 4), time = 0.6, easing = EASE_OUT)
	animate(pixel_x = ipx, pixel_y = ipy, time = 0.6, easing = EASE_IN)
	animate(transform = M, time = 0.6, easing = EASE_IN)

/proc/sponge_size(atom/A, var/size = 1)
	var/matrix/M2 = matrix()
	M2.Scale(size,size)

	animate(A, transform = M2, time = 30, easing = ELASTIC_EASING)

/proc/animate_storage_rustle(atom/A)
	var/matrix/M1 = A.transform
	var/matrix/M2 = matrix()
	M2.Scale(1.2,0.8)

	animate(A, transform = M2, time = 30, easing = ELASTIC_EASING, flags = ANIMATION_END_NOW)
	animate(A, transform = M1, time = 20, easing = ELASTIC_EASING)
