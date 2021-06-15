var/list/sounds_cache = list()

/client/proc/play_sound(S as sound)
	set category = "Fun"
	set name = "Play Global Sound"
	if(!check_rights(R_SOUNDS))	return
	//[INF]
	if(!config.admin_midis_allowed)
		alert("Admin midis currently disabled, ask devs for help.","Sorry, your music isn't allowed now.","")
		return
	//[/INF]
	var/vol = input("Select a volume for the sound", "Volume") as null|anything in list(100, 75, 50, 25, 5)

	var/sound/uploaded_sound = sound(S, repeat = 0, wait = 1, channel = GLOB.admin_sound_channel, volume = vol)
	uploaded_sound.priority = 250

	sounds_cache += S
	var/volume = 100
	var/override = FALSE

	while (TRUE)
		volume = input(src, "Sound volume (0 - 100)", "Volume", volume) as null|num
		if (isnull(volume))
			return

		volume =  round(Clamp(volume, 0, 100))
		to_chat(src, "Sound volume set to [volume]%")
		uploaded_sound.volume =volume
		var/choice = alert("Song: [S]", "Play Sound" , "Play", "Preview", "Cancel")

		if (choice == "Cancel")
			return

		if (choice == "Preview")
			sound_to(src, uploaded_sound)

		if (choice == "Play")
			break

	if(alert("Song: [S].\nVolume: [vol]%.", "Confirmation request" ,"Play", "Cancel") == "Cancel")
		return

	// [inf]
	if(check_rights(R_PERMISSIONS))
		if(alert("Override sound prefs", "Prefs override", "HELL YES", "HELL NO") == "HELL YES")
			log_and_message_admins("override to play [S]")
			override = TRUE
	// [/inf]

	log_and_message_admins("played sound [S]")
	for(var/mob/M in GLOB.player_list)
		if((M.get_preference_value(/datum/client_preference/play_admin_midis) == GLOB.PREF_YES) || override)
			sound_to(M, uploaded_sound)

	SSstatistics.add_field_details("admin_verb","PGS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/play_local_sound(S as sound)
	set category = "Fun"
	set name = "Play Local Sound"
	if(!check_rights(R_SOUNDS))	return
	//[INF]
	if(!config.admin_midis_allowed)
		alert("Admin midis currently disabled, ask devs for help.","Sorry, your music isn't allowed now.","")
		return
	//[/INF]
	var/vol = input("Select a volume for the sound", "Volume") as null|anything in list(100, 75, 50, 25, 5)

	log_and_message_admins("played a local sound [S]")
	playsound(get_turf(src.mob), S, vol, 0, 0)
	SSstatistics.add_field_details("admin_verb","PLS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/play_server_sound()
	set category = "Fun"
	set name = "Play Server Sound"
	if(!check_rights(R_SOUNDS))	return
	//[INF]
	if(!config.admin_midis_allowed)
		alert("Admin midis currently disabled, ask devs for help.","Sorry, your music isn't allowed now.","")
		return
	//[/INF]
	var/list/sounds = list("sound/items/bikehorn.ogg","sound/effects/siren.ogg")
	sounds += sounds_cache

	var/melody = input("Select a sound from the server to play", "Server sound list") as null|anything in sounds

	if(!melody)
		return

	play_sound(melody)
	SSstatistics.add_field_details("admin_verb","PSS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
