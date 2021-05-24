/obj/machinery/door/proc/on_open()
	return 0

/obj/machinery/door/proc/on_close()
	return 0

/obj/machinery/door/airlock/multi_tile/on_open()
	. = ..()
	update_filler_turfs()

/obj/machinery/door/airlock/multi_tile/on_close()
	. = ..()
	update_filler_turfs()

//We have to find these again since these doors are used on shuttles a lot so the turfs changes
/obj/machinery/door/airlock/multi_tile/proc/update_filler_turfs()
	for(var/i = 1, i < width, i++)
		if(dir in list(NORTH, SOUTH))
			var/turf/T = locate(x + i, y, z)
			if(T) T.set_opacity(opacity)
		else if(dir in list(EAST, WEST))
			var/turf/T = locate(x, y + i, z)
			if(T) T.set_opacity(opacity)


/obj/machinery/door/airlock/multi_tile/proc/get_filler_turfs()
	var/list/filler_turfs = list()
	for(var/i = 1, i < width, i++)
		if(dir in list(NORTH, SOUTH))
			var/turf/T = locate(x + i, y, z)
			if(T) filler_turfs += T
		else if(dir in list(EAST, WEST))
			var/turf/T = locate(x, y + i, z)
			if(T) filler_turfs += T
	return filler_turfs
