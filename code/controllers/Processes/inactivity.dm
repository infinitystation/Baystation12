/datum/controller/process/inactivity/setup()
	name = "inactivity"
	schedule_interval = 600 // Once every minute (approx.)

/datum/controller/process/inactivity/doWork()
	for(last_object in GLOB.clients)
		var/client/C = last_object
		if(config.kick_inactive && !C.holder && C.is_afk(config.kick_inactive MINUTES))
			if(!isobserver(C.mob))
				log_access("AFK: [key_name(C)]")
				to_chat(C, "<SPAN CLASS='warning'>You have been inactive for more than [config.kick_inactive] minute\s and have been disconnected.</SPAN>")
				qdel(C)
		if(C.holder && C.is_afk(15 MINUTES))
			log_access("AFK: [key_name(C)]")
			to_chat(C, "<SPAN CLASS='warning'>Задолбал АФКшить, работай давай</SPAN>")
			qdel(C)
		SCHECK
