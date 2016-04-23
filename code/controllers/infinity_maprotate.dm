/* Commented part for another builds
var/datum/votablemap/nextmap

/datum/configuration
	var/list/datum/votablemap/maplist = list()

/datum/controller/gameticker
	var/maprotatechecked = 0

/datum/votablemap
	var/name = ""
	var/friendlyname = ""

/datum/votablemap/New(name)
	src.name = name
	src.friendlyname = name

/datum/configuration/proc/loadmaplist(filename)
	var/list/Lines = file2list(filename)

	var/datum/votablemap/currentmap = null
	for(var/t in Lines)
		if(!t)
			continue

		t = trim(t)
		if(length(t) == 0)
			continue
		else if(copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/command = null
		var/data = null

		if(pos)
			command = lowertext(copytext(t, 1, pos))
			data = copytext(t, pos + 1)
		else
			command = lowertext(t)

		if(!command)
			continue

		if (!currentmap && command != "map")
			continue

		switch (command)
			if ("map")
				currentmap = new (data)
			if ("friendlyname")
				currentmap.friendlyname = data
			if ("endmap")
				config.maplist[currentmap.name] = currentmap
				currentmap = null
			else
				diary << "Unknown command in map vote config: '[command]'"

/client/proc/adminchangemap()
	set category = "Server"
	set name = "Change Map"
	var/list/maprotatechoices = list()
	for (var/map in config.maplist)
		var/datum/votablemap/VM = config.maplist[map]
		var/mapname = VM.friendlyname
		maprotatechoices[mapname] = VM

	var/chosenmap = input("Choose a map to change to", "Change Map")  as null|anything in maprotatechoices
	if (!chosenmap)
		return
	ticker.maprotatechecked = 1
	var/datum/votablemap/VM = maprotatechoices[chosenmap]
	message_admins("[key_name_admin(usr)] is changing the map to [VM.name]([VM.friendlyname])")
	log_admin("[key_name(usr)] is changing the map to [VM.name]([VM.friendlyname])")
	if (changemap_alt(VM) == 0)
		message_admins("[key_name_admin(usr)] has changed the map to [VM.name]([VM.friendlyname])") */// To another builds

/proc/changemap_alt(var/datum/votablemap/VM)
	if(!VM)
		return
	if(!istype(VM))
		return
	if(ticker.update_waiting)
		return
	if(!ticker.maprotatechecked)
		return

	log_game("Changing map to [VM.name]([VM.friendlyname])")
	. = shell("sh ../map_rotate.sh [currentbuild.dmb_file] [VM.name] _maps")
	switch(.)
		if(null)
			message_admins("Failed to change map: Could not run map rotator")
			log_game("Failed to change map: Could not run map rotator")
		if(0)
			log_game("Changed to map [VM.friendlyname]")
			nextmap = VM

		//1x: file errors
		if(1)
			message_admins("Compile failed")
			log_game("Compile failed")