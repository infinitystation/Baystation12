/datum/map/bolt_saferooms()
	for(var/atype in typesof(/area/crew_quarters/safe_room))
		var/area/A = locate(atype)
		if(istype(A))
			for(var/obj/machinery/door/airlock/vault/bolted/V in A.contents)
				if(!V.locked)
					V.lock()

/datum/map/unbolt_saferooms()
	for(var/atype in typesof(/area/crew_quarters/safe_room))
		var/area/A = locate(atype)
		if(istype(A))
			for(var/obj/machinery/door/airlock/vault/bolted/V in A.contents)
				if(V.locked)
					V.unlock()

/datum/map/make_maint_all_access(var/radstorm = 0)
	maint_all_access = 1
	if(radstorm)
		priority_announcement.Announce("Требования к доступу у шлюзов в технические тоннели временнно отключены, а бункеры были разблокированы.", "Внимание!")
		GLOB.using_map.unbolt_saferooms()
	else
		priority_announcement.Announce("Требования к доступу у шлюзов в технические тоннели временнно отключены.", "Внимание!")

/datum/map/revoke_maint_all_access(var/radstorm = 0)
	maint_all_access = 0
	if(radstorm)
		priority_announcement.Announce("Требования к доступу у шлюзов в технические тоннели восстановлены, а бункеры были заблокированы.", "Внимание!")
		GLOB.using_map.bolt_saferooms()
	else
		priority_announcement.Announce("Требования к доступу у шлюзов в технические тоннели восстановлены.", "Внимание!")