/datum/admins/proc/toggleobservers()
	set category = "Server"
	set desc="Players can't join as a ghost."
	set name="Toggle observers"
	if(!check_rights(R_SERVER))
		return

	config.observers_allowed = !config.observers_allowed

	if(GAME_STATE > RUNLEVEL_LOBBY)
		for(var/mob/new_player/player in GLOB.player_list)
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
	var/newtime = input("Set a new time. Its must be in MINUTES (not in seconds/byond tick). Set 0 to remove delay.", "Set Delay", oldtime) as num|null
	if(!newtime || newtime == oldtime) return

	var/message = newtime <= 0 ? "отключил(а) задержку для наблюдателей" : "изменил(а) задержку для наблюдателей с [oldtime] на [newtime] минут(ы)"
	log_and_message_admins("Администратор [key_name_admin(usr)] [message].")

	config.observe_delay = newtime
	SSstatistics.add_field_details("admin_verb","CROD") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/datum/admins/proc/intercom()
	set category = "Fun"
	set name = "Intercom Msg"
	set desc = "Send an intercom message, like an arrivals announcement."
	if(!check_rights(0))	return

	var/channel = input("Channel for message:","Channel", null) as null|anything in radiochannels

	if(channel) //They picked a channel
		var/sender = input("Name of sender (max 75):", "Announcement", "Announcement Computer") as null|text

		if(sender) //They put a sender
			sender = sanitize(sender, 75, extra = 0)
			var/message = input("Message content (max 500):", "Contents", "This is a test of the announcement system.") as null|message

			if(message) //They put a message
				message = sanitize(message, 500, extra = 0)
				GLOB.global_announcer.autosay("[message]", "[sender]", "[channel == "Common" ? null : channel]") //Common is a weird case, as it's not a "channel", it's just talking into a radio without a channel set.
				log_admin("Intercom: [key_name(usr)] : [sender]:[message]")

	SSstatistics.add_field("admin_verb","IN") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/datum/admins/proc/intercom_convo()
	set category = "Fun"
	set name = "Intercom Convo"
	set desc = "Send an intercom conversation, like several uses of the Intercom Msg verb."
	set waitfor = FALSE //Why bother? We have some sleeps. You can leave tho!
	if(!check_rights(0))	return

	var/channel = input("Channel for message:","Channel", null) as null|anything in radiochannels

	if(!channel) //They picked a channel
		return

	to_chat(usr,"<span class='notice'><B>Intercom Convo Directions</B><br>Start the conversation with the sender, a pipe (|), and then the message on one line. Then hit enter to \
		add another line, and type a (whole) number of seconds to pause between that message, and the next message, then repeat the message syntax up to 20 times. For example:<br>\
		--- --- ---<br>\
		Some Guy|Hello guys, what's up?<br>\
		5<br>\
		Other Guy|Hey, good to see you.<br>\
		5<br>\
		Some Guy|Yeah, you too.<br>\
		--- --- ---<br>\
		The above will result in those messages playing, with a 5 second gap between each. Maximum of 20 messages allowed.</span>")

	var/list/decomposed
	var/message = input(usr,"See your chat box for instructions. Keep a copy elsewhere in case it is rejected when you click OK.", "Input Conversation", "") as null|message

	if(!message)
		return

	//Split on pipe or \n
	decomposed = splittext(message,regex("\\||$","m"))
	decomposed += "0" //Tack on a final 0 sleep to make 3-per-message evenly

	//Time to find how they screwed up.
	//Wasn't the right length
	if((decomposed.len) % 3) //+1 to accomidate the lack of a wait time for the last message
		to_chat(usr,"<span class='warning'>You passed [decomposed.len] segments (senders+messages+pauses). You must pass a multiple of 3, minus 1 (no pause after the last message). That means a sender and message on every other line (starting on the first), separated by a pipe character (|), and a number every other line that is a pause in seconds.</span>")
		return

	//Too long a conversation
	if((decomposed.len / 3) > 20)
		to_chat(usr,"<span class='warning'>This conversation is too long! 20 messages maximum, please.</span>")
		return

	//Missed some sleeps, or sanitized to nothing.
	for(var/i = 1; i < decomposed.len; i++)

		//Sanitize sender
		var/clean_sender = sanitize(decomposed[i])
		if(!clean_sender)
			to_chat(usr,"<span class='warning'>One part of your conversation was not able to be sanitized. It was the sender of the [(i+2)/3]\th message.</span>")
			return
		decomposed[i] = clean_sender

		//Sanitize message
		var/clean_message = sanitize(decomposed[++i])
		if(!clean_message)
			to_chat(usr,"<span class='warning'>One part of your conversation was not able to be sanitized. It was the body of the [(i+2)/3]\th message.</span>")
			return
		decomposed[i] = clean_message

		//Sanitize wait time
		var/clean_time = text2num(decomposed[++i])
		if(!isnum(clean_time))
			to_chat(usr,"<span class='warning'>One part of your conversation was not able to be sanitized. It was the wait time after the [(i+2)/3]\th message.</span>")
			return
		if(clean_time > 60)
			to_chat(usr,"<span class='warning'>Max 60 second wait time between messages for sanity's sake please.</span>")
			return
		decomposed[i] = clean_time

	log_admin("Intercom convo started by: [key_name(usr)] : [sanitize(message)]")
	SSstatistics.add_field("admin_verb","IN") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	//Sanitized AND we still have a chance to send it? Wow!
	if(LAZYLEN(decomposed))
		for(var/i = 1; i < decomposed.len; i++)
			var/this_sender = decomposed[i]
			var/this_message = decomposed[++i]
			var/this_wait = decomposed[++i]
			GLOB.global_announcer.autosay("[this_message]", "[this_sender]", "[channel == "Common" ? null : channel]") //Common is a weird case, as it's not a "channel", it's just talking into a radio without a channel set.
			sleep(this_wait SECONDS)

/datum/admins/proc/mp_panel()
	set category = "Fun"
	set name = "MP Panel"
	set desc = "Lists all current music players and control it."

	if(!check_rights(R_ADMIN|R_FUN, 0, usr))
		return

	var/list/dat = list("<div align='center'><h1>Music Player Control Panel</h1><br>")

	dat += "<b>Current musuc players in world ([GLOB.music_players.len]):</b></div><br>"
	dat += "<hr>"

	if(GLOB.music_players.len == 0)
		dat += "<div class='statusDisplay'><center>At the moment there are no devices in this world session.</center></div>"
	else
		for(var/a in GLOB.music_players)
			var/obj/item/music_player/p = a
			dat += "<div class='statusDisplay'>"
			dat += "Music Player #[p.serial_number] : <a href='?_src_=holder;mp_play=\ref[p]'>[p.mode ? "<font color=cc5555>Stop</font>" : "<font color=55cc55>Play</font>"]</a> | "
			dat += "<a href='?_src_=holder;mp_volume=\ref[p]'>Volume</a> | "
			dat += "<a href='?_src_=holder;adminplayerobservefollow=\ref[p]'>Current location</a> | "
			dat += "<a href='?_src_=vars;Vars=\ref[p]'>VV</a> | "
			dat += "<a href='?_src_=holder;mp_explode=\ref[p]'><font color=cc5555>\[X\]</font></a><br>"
			dat += "</div>"

	var/datum/browser/popup = new(usr, "mp_panel",, 465, 325, src)
	popup.set_content(jointext(dat, null))
	popup.open()

	SSstatistics.add_field("admin_verb","MPP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/datum/admins/proc/toggleevent()
	set category = "Server"
	set desc = "Event status in hub."
	set name = "Toggle Event Status"

	config.event_status = !(config.event_status)

	if(config.event_status)
		to_world("<B>Включено отображение статуса проведения ивента.</B>")
		send2maindiscord("На сервере активировано отображение статуса ивента.")
		send2mainirc("<@&631358488660017162> На сервере активировано отображение статуса ивента!")
	else
		to_world("<B>Отображение статуса проведения ивента отключено. Кина не будет :(</B>")
		send2maindiscord("Ивент отменён.")
		send2mainirc("Ивент отменён :(")

	log_and_message_admins("[key_name_admin(usr)] toggled event status.")
	world.update_status()
//	SSstatistics.add_field_details("admin_verb","TES") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/proc/only_xenos(var/client/C)
	if(!C)
		return
	if(!istype(C))
		C = C.get_client()
	if(C.holder && (C.holder.rights == R_XENO))
		return TRUE
