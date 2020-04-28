/CRASH(msg)
	. = ..()
	SSwebhooks.send(WEBHOOK_SEND_RUNTIME, list("file" = file, "msg" = msg, "line" = line))
