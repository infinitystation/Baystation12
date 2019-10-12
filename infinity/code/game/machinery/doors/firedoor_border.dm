//Single direction firedoors.
/obj/machinery/door/firedoor/border_only
	icon = 'infinity/icons/obj/doors/hazard/border/door.dmi'
	welded_file = 'infinity/icons/obj/doors/hazard/border/welded.dmi'
	icon_state = "open"
	glass = TRUE // There is a glass window so you can see through the door.
				 // This is needed due to BYOND limitations in controlling visibility
	heat_proof = TRUE
	air_properties_vary_with_direction = TRUE
	// atom_flags = ATOM_FLAG_CHECKS_BORDER

/obj/machinery/door/firedoor/border_only/on_update_icon()
	var/icon/weld_overlay

	overlays.Cut()
	set_light(0)

	if(density)
		icon_state = "closed"
	else
		icon_state = "open"

	if(blocked)
		weld_overlay = welded_file

	overlays += weld_overlay

/obj/machinery/door/firedoor/border_only/CanPass(atom/movable/mover, turf/target, height = FALSE, air_group = FALSE)
	if(mover?.checkpass(PASS_FLAG_GLASS))
		return TRUE
	if(get_dir(loc, target) == dir) //Make sure looking at appropriate border
		if(air_group) return FALSE
		return !density
	else
		return TRUE

/obj/machinery/door/firedoor/border_only/CheckExit(atom/movable/mover as mob|obj, turf/target as turf)
	if(mover?.checkpass(PASS_FLAG_GLASS))
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
