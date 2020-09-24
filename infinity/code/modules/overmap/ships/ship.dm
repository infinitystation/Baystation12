/obj/effect/overmap/visitable/Move(var/newloc,var/dir)
	. = ..()
	break_docks()

/obj/effect/overmap/visitable/proc/break_docks(var/force_break = 0)
	for(var/obj/docking_port/enterence/dock in connectors)
		if(isnull(dock))
			connectors -= dock
			continue
		if(force_break || (dock.current_connected && get_dist(dock.our_ship,dock.current_connected.our_ship) > 1))
			if(dock.current_connected)
				dock.current_connected.dock_break()
			dock.dock_break()
