/obj/item/ammo_casing/Crossed(atom/AM)
	..()

	if(isliving(AM))
		var/mob/living/L = AM

		if(L.buckled)
			return

		if(!MOVING_DELIBERATELY(L) && prob(10))
			on_casing_cross(L)

/obj/item/ammo_casing/proc/on_casing_cross(atom/AM)
	if(!AM)
		return

	playsound(src, pick(fall_sounds), 50, 1)
	var/turf/turf_current = get_turf(src)
	var/turf/turf_destiinaton = get_step(turf_current, AM.dir)
	if(turf_destiinaton.Adjacent(turf_current))
		throw_at(turf_destiinaton, 2, 2, spin = FALSE)
		animate(src, pixel_x = rand(-16, 16), pixel_y = rand(-16, 16), transform = turn(matrix(), rand(120, 300)), time = rand(3, 8))
