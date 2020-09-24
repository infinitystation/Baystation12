/obj/effect/overmap/visitable/ship
	var/distress = 0

/obj/effect/overmap/visitable/ship/Process()
	. = ..()
	if(distress)
		animate(src, transform = matrix()*1.4, color = "#ff2222", time = 5)
		animate(src, transform = matrix(), color = initial(color), time = 10)

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

