/obj/machinery/nuclearbomb
	var/spam_check = 0
	var/escaped = 0
	var/time_before_launch = 60

/obj/machinery/nuclearbomb/proc/prepare_evacuation()
	GLOB.using_map.make_maint_all_access()
	var/zlevels = GetConnectedZlevels(z)
	for(var/obj/machinery/embedded_controller/radio/simple_docking_controller/escape_pod/E in world)
		if(!(E.z in zlevels))
			continue
		E.pod.arming_controller.arm()

/obj/machinery/nuclearbomb/proc/start_evacuation()
	var/zlevels = GetConnectedZlevels(z)
	for(var/obj/machinery/embedded_controller/radio/simple_docking_controller/escape_pod/E in world)
		if(!(E.z in zlevels))
			continue
		E.pod.launch()

/obj/machinery/nuclearbomb/proc/stop_evacuation()
	GLOB.using_map.revoke_maint_all_access()
	if(!escaped)
		var/zlevels = GetConnectedZlevels(z)
		for(var/obj/machinery/embedded_controller/radio/simple_docking_controller/escape_pod/E in world)
			if(!(E.z in zlevels))
				continue
			E.pod.arming_controller.unarm()
