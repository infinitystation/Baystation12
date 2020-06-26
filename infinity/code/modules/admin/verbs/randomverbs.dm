/client/proc/cmd_admin_world_narrate() // Allows administrators to fluff events a little easier -- TLE
	set category = "Special Verbs"
	set name = "Global Narrate"
	set desc = "Narrate to everyone."

	if(!check_rights(R_ADMIN))
		return

	var/gnarrate_type = input("Which type of global IC narrate?", "Global Narrate", "World without lobby") in list("World", "Station", "World without lobby", "Your Z level (EXPEREMENTAL)", "Connected to you z levels")
	var/result = cmd_admin_narrate_helper(src)
	if (!result)
		return

	//to_world(result[1])
	switch(gnarrate_type)
		if("World")
			to_world(result[1])

		if("Station")
			for(var/mob/M in SSmobs.mob_list)
				if(isStationLevel(M.z) && !isnewplayer(M))
					to_chat(M, result[1])

		if("World without lobby")
			for(var/mob/M in SSmobs.mob_list)
				if(!istype(M, /mob/new_player))
					to_chat(M, result[1])

		if("Your Z level (EXPEREMENTAL)")
			for(var/mob/M in SSmobs.mob_list)
				if(M.z == mob.z)
					to_chat(M, result[1])

		if("Connected to you z levels")
			for(var/mob/M in SSmobs.mob_list)
				if(M.z in GetConnectedZlevels(mob.z))
					to_chat(M, result[1])

	log_and_message_admins(" - GlobalNarrate [result[2]]/[result[3]] in \[[gnarrate_type]\]: [result[4]]")
	SSstatistics.add_field_details("admin_verb","GLN") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

//For SDQL2
/atom/proc/ChangeName(NewName_text)
	name = NewName_text

/atom/proc/ChangeDesc(NewDesc_text)
	desc = NewDesc_text

/atom/proc/ChangeIcon(NewIcon_file)
	icon = NewIcon_file

/atom/proc/ChangeIconState(NewIcon_state)
	icon_state = NewIcon_state

/atom/proc/ChangeIcon_and_icon_state(NewIcon_file, NewIcon_state)
	icon = NewIcon_file
	icon_state = NewIcon_state
