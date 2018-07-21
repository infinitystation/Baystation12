#define WALL_AO_ALPHA 135
#define AO_ALL_NEIGHBORS 1910

GLOBAL_LIST_EMPTY(ao_cache)

/turf
	var/permit_ao
	var/tmp/list/ao_overlays // Current ambient occlusion overlays. Tracked so we can reverse them without dropping all overlays.
	var/tmp/ao_neighbors = 0

/turf/proc/regenerate_ao()
	for(var/turf/T in trange(1, src))
		if(istype(T, /turf) && T.permit_ao)
			T.update_ao()

/turf/update_icon(var/update_neighbors, var/list/previously_added = list())
	. = ..()
	if(permit_ao)
		update_ao()

/turf/proc/calculate_ao_neighbours()
	ao_neighbors = 0
	var/turf/T
	CALCULATE_NEIGHBORS(src, ao_neighbors, T, !T || !T.opacity || !T.density)

/turf/proc/update_ao()
	if(ao_overlays)
		overlays -= ao_overlays
		ao_overlays.Cut()

	calculate_ao_neighbours()

	if(ao_neighbors == AO_ALL_NEIGHBORS)	// If all our neighbors are not solid, why bother with the rest of the checks?
		return

	if(!density && !opacity)
		for(var/i = 1 to 4)
			var/cdir = GLOB.ao_cornerdirs[i]
			var/corner = 0

			if(ao_neighbors & (1 << cdir))
				corner |= 2
			if(ao_neighbors & (1 << turn(cdir, 45)))
				corner |= 1
			if(ao_neighbors & (1 << turn(cdir, -45)))
				corner |= 4

			if (corner != 7)	// 7 is the 'no shadows' state, no reason to add overlays for it.
				var/cache_key = "[corner]-[i]"
				var/image/I = GLOB.ao_cache[cache_key]
				if(!I)
					I = image('icons/turf/flooring/shadows.dmi', "[corner]", dir = 1 << (i-1))
					I.plane = ABOVE_TURF_PLANE
					I.layer = RUNE_LAYER + 0.1
					I.alpha = WALL_AO_ALPHA
					I.appearance_flags = RESET_ALPHA|RESET_COLOR|TILE_BOUND
					GLOB.ao_cache[cache_key] = I

				if(!pixel_x && !pixel_y)
					LAZYADD(ao_overlays, I)
				else
					// Turf is pixel-shifted, so we need to counteract the shift on the AO overlays.
					var/image/shifted = new()
					shifted.appearance = I
					shifted.pixel_x = -(pixel_x)
					shifted.pixel_y = -(pixel_y)

					LAZYADD(ao_overlays, shifted)

	UNSETEMPTY(ao_overlays)
	if(ao_overlays)
		overlays += ao_overlays

#undef WALL_AO_ALPHA

/mob/verb/listao()
	set name = "AO list"
	set category = "AO"
	var/ao_count = 0
	for(var/turf/T)
		if(T.ao_overlays)
			ao_count += T.ao_overlays.len
	to_chat(usr, "[ao_count]")
