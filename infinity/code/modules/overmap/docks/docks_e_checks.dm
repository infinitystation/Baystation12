//because there is so much of this checks everywhere :(

/obj/docking_port/enterence/proc/check_for_docking_cooldown(var/mob/user)
	if(docking_cooldown + TDP_DOCKING_DELAY > world.time)
		to_chat(user, SPAN_WARNING("[src]'s systems are recalibrating since last docking procedure. Please, wait."))
		return FALSE
	return TRUE

/obj/docking_port/enterence/proc/check_for_connection(var/mob/user)
	if(current_connected)
		to_chat(user, SPAN_WARNING("You have to disconnect the dock first."))
		return FALSE
	return TRUE

/obj/docking_port/enterence/proc/check_for_access(var/mob/user)
	if(control_panel?.req_access.len)
		if(!check_access(user, control_panel.req_access))
			to_chat(user, SPAN_WARNING("Access Denied"))
			return FALSE
	return TRUE

/obj/docking_port/enterence/proc/check_for_integrity(var/mob/user)
	if(broken)
		to_chat(user, SPAN_WARNING("It's broken."))
		return FALSE
	return TRUE
