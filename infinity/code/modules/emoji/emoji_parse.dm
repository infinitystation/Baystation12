/*TODO, have problems with displaying of emojis' images in chat
GLOBAL_LIST_EMPTY(emojis)
/hook/startup/proc/load_emojis()
	var/list/files = flist("config/emojis/")
	var/list/af
	if(config.additional_emojis_path)
		af = flist(config.additional_emojis_path)
		if(islist(af) && length(af))
			files.Add(af)
	if(islist(files) && length(files))
		for(var/f in files)
			var/list/splitted = splittext("[f]", ".")
			var/name = splitted[1]
			var/path = ""
			if(f in files)
				path = "config/emojis/"
			else if(f in af)
				path = config.additional_emojis_path
			GLOB.emojis[name] = path + f
*/
GLOBAL_VAR_INIT(emojis, 'infinity/icons/emoji.dmi')

/proc/emoji_parse_by_user(msg, client/C)
	. = msg
	var/list/client_packet = SSexdata.GetDataByKey(DATASTORE_DONATORS, C.key)
	if(islist(client_packet) || !config.donaters_only_emoji)
		. = emoji_parse(.)

/proc/emoji_parse(text)
	. = text
	if(!config.emojis)
		return
	var/parsed = ""
	var/pos = 1
	var/search = 0
	var/emoji = ""
	while(1)
		search = findtext(text, ":", pos)
		parsed += copytext(text, pos, search)
		if(search)
			pos = search
			search = findtext(text, ":", pos+1)
			if(search)
				emoji = lowertext(copytext(text, pos+1, search))
				if(emoji in icon_states(GLOB.emojis))
					parsed += " <img class=icon src=\ref[GLOB.emojis] iconstate='[emoji]'>"
					pos = search + 1
				else
					parsed += copytext(text, pos, search)
					pos = search
				emoji = ""
				continue
			else
				parsed += copytext(text, pos, search)
		break
	return parsed
