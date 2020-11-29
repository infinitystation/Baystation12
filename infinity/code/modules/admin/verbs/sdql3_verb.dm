/client/proc/SDQL3_query(var/q as message)
	set category = "Debug"
	for(var/i in splittext(q, "$ "))
		var/executed = sdql3(i)
		to_chat(src, islist(executed) ? json_encode(executed) : executed)//todo, browser of data like in sdql II
