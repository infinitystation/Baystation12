/obj/effect/overmap/ship/Move(var/newloc,var/dir)
	. = ..()
	break_docks()

/obj/effect/overmap/ship/proc/break_docks(var/force_break = 0)
	for(var/obj/docking_port/dock in connectors)
		if(isnull(dock))
			connectors -= dock
			continue
		if(force_break || (dock.current_connected && get_dist(dock.our_ship,dock.current_connected.our_ship) > 1))
			if(dock.current_connected)
				dock.current_connected.dock_break()
			dock.dock_break()
