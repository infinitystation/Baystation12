SUBSYSTEM_DEF(inactivity)
	name = "Inactivity"
	wait = 1 MINUTE
	priority = SS_PRIORITY_INACTIVITY
	flags = SS_NO_INIT
	var/tmp/list/client_list
	var/number_kicked = 0

/datum/controller/subsystem/inactivity/fire(resumed = FALSE)
//	if (!config.kick_inactive) // we are using this for kicking staff in AFK
//		suspend()
//		return
	if (!resumed)
		client_list = GLOB.clients.Copy()

	while(client_list.len)
		var/client/C = client_list[client_list.len]
		client_list.len--
//		if(!C.holder && C.is_afk(config.kick_inactive MINUTES) && !isobserver(C.mob))
		if(C.holder && check_rights(R_ADMIN, 0, C) && C.is_afk(config.kick_inactive MINUTES) && config.kick_inactive)
			log_access("AFK: [key_name(C)]")
			to_chat(C, SPAN_WARNING("Âû, àäìèíèñòðàòîð, íå ïðîÿâëÿëè àêòèâíîñòü â òå÷åíèè ([config.kick_inactive]) ìèíóò è áûëè îòñîåäåíåíû. Ïðîæìèòå de-admin â ñëåäóþùèé ðàç ïåðåä äëèòåëüíûì îòõîäîì."))
			qdel(C)
			number_kicked++
		if (MC_TICK_CHECK)
			return

/datum/controller/subsystem/inactivity/stat_entry()
	..("Kicked AFK staff: [number_kicked]")
