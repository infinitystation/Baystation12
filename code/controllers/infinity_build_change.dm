//21.12.2018 - turned off, cause it's unfinished
var/datum/server_build/nextbuild
var/datum/server_build/currentbuild

/datum/configuration
	var/list/datum/server_build/buildlist = list()

/datum/controller/subsystem/ticker
	var/buildchangechecked = 0				//build changing?
	var/buildchanger_ckey = ""				//who changing build?

/datum/server_build
	var/name				// name of build
	var/friendlyname		// friendly name of build
	var/dmb_file			// dmb file of build
	var/folder				// folder of build
	var/update				// update folder of build

/datum/server_build/New(name)
	src.name = name

/datum/configuration/proc/loadbuildlist(filename)
	var/list/Lines = file2list(filename)

	var/datum/server_build/current_build = null
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

		if(!current_build && command != "build")
			continue

		switch(command)
			if("build")
				current_build = new (data)
			if("dmbfile")
				current_build.dmb_file = data
			if("friendlyname")
				current_build.friendlyname = data
			if("folder")
				current_build.folder = data
			if("update")
				current_build.update = data
			if("endbuild")
				config.buildlist[current_build.name] = current_build
				currentbuild = null
			else
				diary << "Unknown command in builds config: '[command]'"

/hook/startup/proc/loadBuilds()
	loadbuildname()
	return 1

/proc/loadbuildname()
	shell("sh ../dir.sh > ext.txt")
	var/ext
	var/list/Lines = file2list("ext.txt")
	if(Lines.len)
		if(Lines[1])
			ext = Lines[1]
	for(var/build in config.buildlist)
		var/datum/server_build/B = config.buildlist[build]

		if(ext == B.folder)
			currentbuild = B
			break

/client/proc/adminchangebuild()
	set category = "Server"
	set name = "Change Build"

	if(!holder)
		return

	var/list/buildchoices = list()
	for(var/build in config.buildlist)
		var/datum/server_build/B = config.buildlist[build]
		var/buildname = B.friendlyname

		if(B == currentbuild)
			continue

		buildchoices[buildname] = B

	var/chosenbuild = input("Choose a build to change to", "Change Build")  as null|anything in buildchoices

	if(!chosenbuild)
		return

	SSticker.buildchangechecked = 1
	SSticker.buildchanger_ckey = ckey
	var/datum/server_build/B = buildchoices[chosenbuild]
	nextbuild = B

	message_admins("[key_name_admin(usr)] помен&#255;л билд на [nextbuild.name]([nextbuild.friendlyname])")
	log_admin("[key_name(usr)] помен&#255;л билд на [nextbuild.name]([nextbuild.friendlyname])")
	to_chat(world, "<span class='boldannounce'>Билд изменен на [nextbuild.friendlyname] дл&#255; следующего раунда!</span>")

/proc/forcechangebuild(datum/server_build/B)
	if(!istype(B))
		return
	if(!B)
		return

	to_chat(world, "<span class='adminooc'><FONT size=5>ВНИМАНИЕ! БИЛД МЕНЯЕТСЯ НА [B.friendlyname]! СЕРВЕР НЕ БУДЕТ РАБОТАТЬ НЕСКОЛЬКО МИНУТ!</FONT><br>Смена билда в конце раунда инициировано администратором [SSticker.buildchanger_ckey]</span>.")
	sound_to(world, sound('sound/effects/alarm.ogg', repeat = 0, wait = 0, volume = 100, channel = 1))
	sleep(100)

	log_game("Changing build to [B.name]([B.friendlyname])")
	. = shell("sudo sh ../change_build.sh [B.dmb_file] [B.folder] [world.port]")
