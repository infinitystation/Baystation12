var/list/sounds_cache = list()

/client/proc/play_sound(S as sound)
	set category = "Fun"
	set name = "Play Global Sound"
	if(!check_rights(R_SOUNDS))	return

	var/vol = input("Select a volume for the sound", "Volume") as null|anything in list(100, 75, 50, 25, 5)

	var/sound/uploaded_sound = sound(S, repeat = 0, wait = 1, channel = GLOB.admin_sound_channel, volume = vol)
	uploaded_sound.priority = 250

	sounds_cache += S

	if(alert("Song: [S].\nVolume: [vol]%.", "Confirmation request" ,"Play", "Cancel") == "Cancel")
		return

	log_and_message_admins("played sound [S]")
	for(var/mob/M in GLOB.player_list)
		if(M.get_preference_value(/datum/client_preference/play_admin_midis) == GLOB.PREF_YES)
			sound_to(M, uploaded_sound)

	SSstatistics.add_field_details("admin_verb","PGS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/play_local_sound(S as sound)
	set category = "Fun"
	set name = "Play Local Sound"
	if(!check_rights(R_SOUNDS))	return

	var/vol = input("Select a volume for the sound", "Volume") as null|anything in list(100, 75, 50, 25, 5)

	log_and_message_admins("played a local sound [S]")
	playsound(get_turf(src.mob), S, vol, 0, 0)
	SSstatistics.add_field_details("admin_verb","PLS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/play_server_sound()
	set category = "Fun"
	set name = "Play Server Sound"
	if(!check_rights(R_SOUNDS))	return

	var/list/sounds = list("sound/items/bikehorn.ogg","sound/effects/siren.ogg")
	sounds += sounds_cache

	var/melody = input("Select a sound from the server to play", "Server sound list") as null|anything in sounds

	if(!melody)
		return

	play_sound(melody)
	SSstatistics.add_field_details("admin_verb","PSS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!