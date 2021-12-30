/client/proc/handle_staff_login()
	if(admin_datums[ckey] && SSticker)
		var/datum/admins/holder = admin_datums[ckey]
		message_staff("\[[holder.rank]\] [key_name(src)] logged in.")

/client/proc/handle_staff_logout()
	if(admin_datums[ckey] && GAME_STATE >= RUNLEVEL_LOBBY)
		var/datum/admins/holder = admin_datums[ckey]
		message_staff("\[[holder.rank]\] [key_name(src)] logged out.")
		if(!GLOB.admins.len) //Apparently the admin logging out is no longer an admin at this point, so we have to check this towards 0 and not towards 1. Awell.
			send2adminirc("[key_name(src)] logged out - no more staff online.")
			if(config.delist_when_no_admins && config.hub_visible)
				world.update_hub_visibility()
				send2adminirc("Toggled hub visibility. The server is now invisible ([config.hub_visible]).")
