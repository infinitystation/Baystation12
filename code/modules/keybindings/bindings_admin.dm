/datum/admins/key_down(_key, client/user)
	switch(_key)
		if("F5")
//			if(user.keys_held["Shift"])
//				user.get_mentor_say()
//			else
			user.get_admin_say()
			return
		if("F6")
			user.admin_ghost()
			return
		if("F7")
			player_panel()
			return
		if("F8")
			user.cmd_admin_pm_panel()
			return
		if("F9")
			user.invisimin()
			return
		if("F10")
			user.get_dead_say()
			return
	..()

/client/proc/get_admin_say()
	var/msg = input(src, null, "asay \"text\"") as text|null
	cmd_admin_say(msg)

/client/proc/get_dead_say()
	var/msg = input(src, null, "dsay \"text\"") as text
	dsay(msg)
