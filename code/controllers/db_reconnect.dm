var/datum/controller/db_reconnect/db_reconnect

/datum/controller/db_reconnect
	var/timerbuffer = 0 //buffer for time check

/datum/controller/db_reconnect/New()
	timerbuffer = 30 MINUTES
	START_PROCESSING(SSprocessing, src)

/datum/controller/db_reconnect/Destroy()
	STOP_PROCESSING(SSprocessing, src)

/datum/controller/db_reconnect/Process()
	if(timerbuffer <= 0)
		dbcon.Disconnect()
		failed_db_connections = 0

		if(!establish_db_connection())
			log_debug("Warning! Auto Database reconnection failed: " + dbcon.ErrorMsg())
		else
			log_debug("Auto Database reconnection has been successful")
			timerbuffer += 20 MINUTES
	else
		timerbuffer -= 1 SECOND
