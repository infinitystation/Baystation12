/mob/proc/check_have_client()
	return (client || (key && copytext(key, 1, 2) != "@"))
