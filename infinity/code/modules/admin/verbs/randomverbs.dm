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

/client/proc/cmd_set_station_date()
	set category = "Server"
	set name = "Set Station Date"

	if(!check_rights(R_ADMIN | R_SERVER | R_PERMISSIONS))
		return

	var/admin_input = input(usr, "Enter new station date. \[YEAR]-\[MONTH]-\[DAY] (Year should be from 4 numbers, or like 0906, Month 2, Day too 2)", "Station Date")
	if(length(admin_input))
		var/regex/sanitize_regex = regex("\[0-9]{4}-\[0-9]{2}-\[0-9]{2}")
		if(regex_find(sanitize_regex, admin_input))
			station_date = admin_input
