SUBSYSTEM_DEF(inactivity)
	name = "Inactivity"
	wait = 1 MINUTE
	priority = SS_PRIORITY_INACTIVITY
	flags = SS_NO_INIT
	var/tmp/list/client_list
	var/number_kicked = 0

/datum/controller/subsystem/inactivity/fire(resumed = FALSE)
	if (!config.kick_inactive)
		suspend()
		return
	if (!resumed)
		client_list = GLOB.clients.Copy()

	while(client_list.len)
		var/client/C = client_list[client_list.len]
		client_list.len--
//		if(!C.holder && C.is_afk(config.kick_inactive MINUTES) && !isobserver(C.mob)) inf@dev: bay
		if((C.holder && check_rights(R_ADMIN, 0, C) || isnewplayer(C)) && C.is_afk(config.kick_inactive MINUTES))
			log_misc("AFK: [key_name(C)]")
//			to_chat(C, "<SPAN CLASS='warning'>You have been inactive for more than [config.kick_inactive] minute\s and have been disconnected.</SPAN>")
			to_chat(C, SPAN_WARNING("Вы не проявляли активность в течение [config.kick_inactive] минут и были отсоеденены."))
			if(C.holder && check_rights(R_ADMIN, 0, C))
				to_chat(C, SPAN_NOTICE(" * Прожмите de-admin в следующий раз перед длительным отходом. * "))
			qdel(C)
			number_kicked++
		if (MC_TICK_CHECK)
			return

/datum/controller/subsystem/inactivity/stat_entry()
	..("Kicked AFK staff: [number_kicked]")
