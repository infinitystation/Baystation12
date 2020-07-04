/datum/terminal/proc/get_airlock_by_ID(var/ID)
	for(var/obj/machinery/door/airlock/A in SSmachines.machinery)
		if(!A.aiControlDisabled && A.t_ntnet_id == ID)
			return A
	return null
