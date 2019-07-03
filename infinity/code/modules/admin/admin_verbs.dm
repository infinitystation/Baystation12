/datum/admins/proc/toggleobservers()
	set category = "Server"
	set desc="Players can't join as a ghost."
	set name="Toggle observers"
	if(!check_rights(R_SERVER))
		return
	config.observers_allowed = !config.observers_allowed

	if(GAME_STATE > RUNLEVEL_LOBBY)
		for(var/mob/new_player/player in GLOB.player_list)
			if(player.client && !player.client.banprisoned)
				player.new_player_panel()

	to_world("<B>Игроки [config.observers_allowed ? "отныне могут" : "больше не могут"] заходить за призраков из лобби.</b>")
	log_and_message_admins("toggled observers game entering [config.observers_allowed ? "" : "dis"]allowed.")
	SSstatistics.add_field_details("admin_verb","TOB") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_toggle_admin_help()
	set name = "Toggle Admin Help"
	set category = "Server"
	if(!check_rights(R_SERVER))
		return

	config.ahelp_allowed = !config.ahelp_allowed
	log_admin("[key_name(src)] has turned admin help [config.ahelp_allowed ? "on" : "off"].")
	message_admins("[key_name_admin(src)] has turned admin help [config.ahelp_allowed ? "on" : "off"].", 0)
	SSstatistics.add_field_details("admin_verb","TAH") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/observe_delay()
	set name = "Change Roundstart Observe Delay"
	set category = "Server"
	if(!check_rights(R_SERVER))
		return

	var/oldtime = config.observe_delay
	var/newtime = input("Set a new time. Its must be in MINUTES (not in seconds/byond tick). Set 0 to remove delay.", "Set Delay") as num|null

	if(newtime <= 0)
		log_and_message_admins("Admin [key_name_admin(usr)] has disabled observe delay.")
	else
		log_and_message_admins("Admin [key_name_admin(usr)] has changed observe delay from [oldtime] to [newtime] minutes.")

	config.observe_delay = newtime
	SSstatistics.add_field_details("admin_verb","CROD") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
