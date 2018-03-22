var/datum/controller/db_reconnect/db_reconnect

/datum/controller/db_reconnect
	var/timerbuffer = 5 MINUTES //buffer for time check

/datum/controller/db_reconnect/New()
	timerbuffer = (5 MINUTES)
	START_PROCESSING(SSprocessing, src)

/datum/controller/db_reconnect/Destroy()
	STOP_PROCESSING(SSprocessing, src)

/datum/controller/db_reconnect/Process()
	if(timerbuffer <= 0)
		dbcon.Disconnect()
		failed_db_connections = 0

		if(!establish_db_connection())
			message_admins("Warning! Auto Database reconnection failed: " + dbcon.ErrorMsg())
		else
			message_admins("Auto Database reconnection has been successful")
			timerbuffer += 5 MINUTES
	else
		timerbuffer -= 1 SECOND
