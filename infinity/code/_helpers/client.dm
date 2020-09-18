/mob/proc/check_have_client()
	return (client || (key && copytext(key, 1, 2) != "@"))

/client/proc/send_to_lobby()
	var/mob/new_player/NP = new()
	NP.ckey = ckey
