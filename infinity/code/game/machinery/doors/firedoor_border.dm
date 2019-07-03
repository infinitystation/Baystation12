//Single direction firedoors.
/obj/machinery/door/firedoor/border_only
	icon = 'icons/obj/doors/edge_Doorfire.dmi'
	glass = TRUE // There is a glass window so you can see through the door.
				 // This is needed due to BYOND limitations in controlling visibility
	heat_proof = TRUE
	air_properties_vary_with_direction = TRUE

/obj/machinery/door/firedoor/border_only/CanPass(atom/movable/mover, turf/target, height = FALSE, air_group = FALSE)
	if(istype(mover) && mover.checkpass(PASS_FLAG_GLASS))
		return TRUE
	if(get_dir(loc, target) == dir) //Make sure looking at appropriate border
		if(air_group) return FALSE
		return !density
	else
		return TRUE

/obj/machinery/door/firedoor/border_only/CheckExit(atom/movable/mover as mob|obj, turf/target as turf)
	if(istype(mover) && mover.checkpass(PASS_FLAG_GLASS))
		return TRUE
	if(get_dir(loc, target) == dir)
		return !density
	else
		return TRUE

/obj/machinery/door/firedoor/border_only/update_nearby_tiles(need_rebuild)
	var/turf/simulated/source = get_turf(src)
	var/turf/simulated/destination = get_step(source,dir)

	update_heat_protection(loc)

	if(istype(source)) SSair.mark_for_update(source)
	if(istype(destination)) SSair.mark_for_update(destination)
	return TRUE
