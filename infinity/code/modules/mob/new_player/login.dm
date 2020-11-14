/mob/new_player/Login()
	. = ..()
	if(client?.byond_version < RECOMMENDED_VERSION)
		alert("Unsupported byond version: please update byond or go to beta, otherwise some features won't work.")
