GLOBAL_VAR_INIT(emojis, 'infinity/code/modules/emoji/emoji.dmi')

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
