/datum/shuttle/autodock
	var/list/destinations

/datum/shuttle/autodock/multi
	category = /datum/shuttle/autodock/multi

/datum/shuttle/autodock/New(_name)
	..(_name)

	//build destination list
	var/list/found_waypoints = list()
	for(var/waypoint_tag in destinations)
		var/obj/effect/shuttle_landmark/WP = locate(waypoint_tag)
		if(WP)
			found_waypoints["[WP.name]"] = WP
		else
			log_error("Shuttle [name] could not find waypoint with tag [waypoint_tag]!")
	destinations = found_waypoints

/datum/shuttle/autodock/proc/set_destination(var/destination_key, mob/user)
	if(moving_status != SHUTTLE_IDLE)
		return
	next_location = destinations[destination_key]


//Antag play announcements when they leave/return to their home area
/datum/shuttle/autodock/multi/antag
	warmup_time = 10 SECONDS //replaced the old move cooldown

	category = /datum/shuttle/autodock/multi/antag

/datum/shuttle/autodock
	var/obj/effect/shuttle_landmark/home_waypoint

	var/cloaked = 1
	var/announcer_name
	var/arrival_message
	var/departure_message
	var/message_frequency = "Common" //Default is Common
	var/return_warning = 0


/datum/shuttle/autodock/New()
	..()
	if(home_waypoint)
		home_waypoint = locate(home_waypoint)
	else
		home_waypoint = current_location

/datum/shuttle/autodock/shuttle_moved()
	if(current_location == home_waypoint)
		announce_arrival()
	else if(next_location == home_waypoint)
		announce_departure()
	..()

/datum/shuttle/autodock/proc/announce_departure()
	if(cloaked || isnull(departure_message))
		return
	GLOB.global_announcer.autosay(departure_message, announcer_name || "[station_name()]", message_frequency)

/datum/shuttle/autodock/proc/announce_arrival()
	if(cloaked || isnull(arrival_message))
		return
	GLOB.global_announcer.autosay(arrival_message, announcer_name || "[station_name()]", message_frequency)

/datum/shuttle/autodock/multi/antag/set_destination(var/destination_key, mob/user)
	if(!return_warning && destination_key == home_waypoint.name)
		to_chat(user, "<span class='danger'>Returning to your home base will end your mission. If you are sure, press the button again.</span>")
		return_warning = 1
		return
	..()
