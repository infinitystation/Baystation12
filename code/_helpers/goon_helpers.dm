//Removes a few problematic characters
/proc/sanitize_simple(t,list/repl_chars = list("\n"="#","\t"="#"))
	for(var/char in repl_chars)
		var/index = findtext(t, char)
		while(index)
			t = copytext(t, 1, index) + repl_chars[char] + copytext(t, index+1)
			index = findtext(t, char, index+1)
	return t

/proc/sanitize_filename(t)
	return sanitize_simple(t, list("\n"="", "\t"="", "/"="", "\\"="", "?"="", "%"="", "*"="", ":"="", "|"="", "\""="", "<"="", ">"=""))

/proc/icon2base64(icon/icon, iconKey = "misc")
	if (!isicon(icon))
		return FALSE
	to_file(GLOB.iconCache[iconKey], icon)
	var/iconData = GLOB.iconCache.ExportText(iconKey)
	var/list/partial = splittext(iconData, "{")
	return replacetext(copytext(partial[2], 3, -5), "\n", "")

/proc/icon2html(thing, target, icon_state, dir, frame = 1, moving = FALSE)
	if (!thing)
		return

	var/key
	var/icon/I = thing
	if (!target)
		return
	if (target == world)
		target = GLOB.clients

	var/list/targets
	if (!islist(target))
		targets = list(target)
	else
		targets = target
		if (!targets.len)
			return
	if (!isicon(I))
		if (isfile(thing)) //special snowflake
			var/name = sanitize_filename("[generate_asset_name(thing)].png")
			register_asset(name, thing)
			for (var/thing2 in targets)
				send_asset(thing2, key, FALSE)
			return "<img class='icon icon-misc' src=\"[url_encode(name)]\">"
		var/atom/A = thing
		if (isnull(dir))
			dir = A.dir
		if (isnull(icon_state))
			icon_state = A.icon_state
		I = A.icon
		if (ishuman(thing)) // Shitty workaround for a BYOND issue.
			var/icon/temp = I
			I = icon()
			I.Insert(temp, dir = SOUTH)
			dir = SOUTH
	else
		if (isnull(dir))
			dir = SOUTH
		if (isnull(icon_state))
			icon_state = ""

	I = icon(I, icon_state, dir, frame, moving)

	key = "[generate_asset_name(I)].png"
	register_asset(key, I)
	for (var/thing2 in targets)
		send_asset(thing2, key, FALSE)

	return "<img class='icon icon-[icon_state]' src=\"[url_encode(key)]\">"

/proc/icon2base64html(thing)
	if (!thing)
		return
	var/static/list/bicon_cache = list()
	if (isicon(thing))
		var/icon/I = thing
		var/icon_base64 = icon2base64(I)

		if (I.Height() > world.icon_size || I.Width() > world.icon_size)
			var/icon_md5 = md5(icon_base64)
			icon_base64 = bicon_cache[icon_md5]
			if (!icon_base64) // Doesn't exist yet, make it.
				bicon_cache[icon_md5] = icon_base64 = icon2base64(I)


		return "<img class='icon icon-misc' src='data:image/png;base64,[icon_base64]'>"

	// Either an atom or somebody fucked up and is gonna get a runtime, which I'm fine with.
	var/atom/A = thing
	var/key = "[istype(A.icon, /icon) ? "\ref[A.icon]" : A.icon]:[A.icon_state]"


	if (!bicon_cache[key]) // Doesn't exist, make it.
		var/icon/I = icon(A.icon, A.icon_state, SOUTH, 1)
		if (ishuman(thing)) // Shitty workaround for a BYOND issue.
			var/icon/temp = I
			I = icon()
			I.Insert(temp, dir = SOUTH)

		bicon_cache[key] = icon2base64(I, key)

	return "<img class='icon icon-[A.icon_state]' src='data:image/png;base64,[bicon_cache[key]]'>"

//Costlier version of icon2html() that uses getFlatIcon() to account for overlays, underlays, etc. Use with extreme moderation, ESPECIALLY on mobs.
/proc/costly_icon2html(thing, target)
	if (!thing)
		return

	if (isicon(thing))
		return icon2html(thing, target)

	var/icon/I = getFlatIcon(thing)
	return icon2html(I, target)

/proc/extA2U(t)
	if(DM_VERSION < 511)
		//¨, ¸
		t = replacetextEx(t, "\\xa8", "\\u0401")
		t = replacetextEx(t, "\\xb8", "\\u0451")
		//À-Ï
		t = replacetextEx(t, "\\xc0", "\\u0410")
		t = replacetextEx(t, "\\xc1", "\\u0411")
		t = replacetextEx(t, "\\xc2", "\\u0412")
		t = replacetextEx(t, "\\xc3", "\\u0413")
		t = replacetextEx(t, "\\xc4", "\\u0414")
		t = replacetextEx(t, "\\xc5", "\\u0415")
		t = replacetextEx(t, "\\xc6", "\\u0416")
		t = replacetextEx(t, "\\xc7", "\\u0417")
		t = replacetextEx(t, "\\xc8", "\\u0418")
		t = replacetextEx(t, "\\xc9", "\\u0419")
		t = replacetextEx(t, "\\xca", "\\u041a")
		t = replacetextEx(t, "\\xcb", "\\u041b")
		t = replacetextEx(t, "\\xcc", "\\u041c")
		t = replacetextEx(t, "\\xcd", "\\u041d")
		t = replacetextEx(t, "\\xce", "\\u041e")
		t = replacetextEx(t, "\\xcf", "\\u041f")
		//Ð-ß
		t = replacetextEx(t, "\\xd0", "\\u0420")
		t = replacetextEx(t, "\\xd1", "\\u0421")
		t = replacetextEx(t, "\\xd2", "\\u0422")
		t = replacetextEx(t, "\\xd3", "\\u0423")
		t = replacetextEx(t, "\\xd4", "\\u0424")
		t = replacetextEx(t, "\\xd5", "\\u0425")
		t = replacetextEx(t, "\\xd6", "\\u0426")
		t = replacetextEx(t, "\\xd7", "\\u0427")
		t = replacetextEx(t, "\\xd8", "\\u0428")
		t = replacetextEx(t, "\\xd9", "\\u0429")
		t = replacetextEx(t, "\\xda", "\\u042a")
		t = replacetextEx(t, "\\xdb", "\\u042b")
		t = replacetextEx(t, "\\xdc", "\\u042c")
		t = replacetextEx(t, "\\xdd", "\\u042d")
		t = replacetextEx(t, "\\xde", "\\u042e")
		t = replacetextEx(t, "\\xdf", "\\u042f")
		//à-ï
		t = replacetextEx(t, "\\xe0", "\\u0430")
		t = replacetextEx(t, "\\xe1", "\\u0431")
		t = replacetextEx(t, "\\xe2", "\\u0432")
		t = replacetextEx(t, "\\xe3", "\\u0433")
		t = replacetextEx(t, "\\xe4", "\\u0434")
		t = replacetextEx(t, "\\xe5", "\\u0435")
		t = replacetextEx(t, "\\xe6", "\\u0436")
		t = replacetextEx(t, "\\xe7", "\\u0437")
		t = replacetextEx(t, "\\xe8", "\\u0438")
		t = replacetextEx(t, "\\xe9", "\\u0439")
		t = replacetextEx(t, "\\xea", "\\u043a")
		t = replacetextEx(t, "\\xeb", "\\u043b")
		t = replacetextEx(t, "\\xec", "\\u043c")
		t = replacetextEx(t, "\\xed", "\\u043d")
		t = replacetextEx(t, "\\xee", "\\u043e")
		t = replacetextEx(t, "\\xef", "\\u043f")
		//ð-ÿ
		t = replacetextEx(t, "\\xf0", "\\u0440")
		t = replacetextEx(t, "\\xf1", "\\u0441")
		t = replacetextEx(t, "\\xf2", "\\u0442")
		t = replacetextEx(t, "\\xf3", "\\u0443")
		t = replacetextEx(t, "\\xf4", "\\u0444")
		t = replacetextEx(t, "\\xf5", "\\u0445")
		t = replacetextEx(t, "\\xf6", "\\u0446")
		t = replacetextEx(t, "\\xf7", "\\u0447")
		t = replacetextEx(t, "\\xf8", "\\u0448")
		t = replacetextEx(t, "\\xf9", "\\u0449")
		t = replacetextEx(t, "\\xfa", "\\u044a")
		t = replacetextEx(t, "\\xfb", "\\u044b")
		t = replacetextEx(t, "\\xfc", "\\u044c")
		t = replacetextEx(t, "\\xfd", "\\u044d")
		t = replacetextEx(t, "\\xfe", "\\u044e")
	else
		//¨, ¸
		t = replacetextEx(t, "\\u00a8", "\\u0401")
		t = replacetextEx(t, "\\u00b8", "\\u0451")
		//À-Ï
		t = replacetextEx(t, "\\u00c0", "\\u0410")
		t = replacetextEx(t, "\\u00c1", "\\u0411")
		t = replacetextEx(t, "\\u00c2", "\\u0412")
		t = replacetextEx(t, "\\u00c3", "\\u0413")
		t = replacetextEx(t, "\\u00c4", "\\u0414")
		t = replacetextEx(t, "\\u00c5", "\\u0415")
		t = replacetextEx(t, "\\u00c6", "\\u0416")
		t = replacetextEx(t, "\\u00c7", "\\u0417")
		t = replacetextEx(t, "\\u00c8", "\\u0418")
		t = replacetextEx(t, "\\u00c9", "\\u0419")
		t = replacetextEx(t, "\\u00ca", "\\u041a")
		t = replacetextEx(t, "\\u00cb", "\\u041b")
		t = replacetextEx(t, "\\u00cc", "\\u041c")
		t = replacetextEx(t, "\\u00cd", "\\u041d")
		t = replacetextEx(t, "\\u00ce", "\\u041e")
		t = replacetextEx(t, "\\u00cf", "\\u041f")
		//Ð-ß
		t = replacetextEx(t, "\\u00d0", "\\u0420")
		t = replacetextEx(t, "\\u00d1", "\\u0421")
		t = replacetextEx(t, "\\u00d2", "\\u0422")
		t = replacetextEx(t, "\\u00d3", "\\u0423")
		t = replacetextEx(t, "\\u00d4", "\\u0424")
		t = replacetextEx(t, "\\u00d5", "\\u0425")
		t = replacetextEx(t, "\\u00d6", "\\u0426")
		t = replacetextEx(t, "\\u00d7", "\\u0427")
		t = replacetextEx(t, "\\u00d8", "\\u0428")
		t = replacetextEx(t, "\\u00d9", "\\u0429")
		t = replacetextEx(t, "\\u00da", "\\u042a")
		t = replacetextEx(t, "\\u00db", "\\u042b")
		t = replacetextEx(t, "\\u00dc", "\\u042c")
		t = replacetextEx(t, "\\u00dd", "\\u042d")
		t = replacetextEx(t, "\\u00de", "\\u042e")
		t = replacetextEx(t, "\\u00df", "\\u042f")
		//à-ï
		t = replacetextEx(t, "\\u00e0", "\\u0430")
		t = replacetextEx(t, "\\u00e1", "\\u0431")
		t = replacetextEx(t, "\\u00e2", "\\u0432")
		t = replacetextEx(t, "\\u00e3", "\\u0433")
		t = replacetextEx(t, "\\u00e4", "\\u0434")
		t = replacetextEx(t, "\\u00e5", "\\u0435")
		t = replacetextEx(t, "\\u00e6", "\\u0436")
		t = replacetextEx(t, "\\u00e7", "\\u0437")
		t = replacetextEx(t, "\\u00e8", "\\u0438")
		t = replacetextEx(t, "\\u00e9", "\\u0439")
		t = replacetextEx(t, "\\u00ea", "\\u043a")
		t = replacetextEx(t, "\\u00eb", "\\u043b")
		t = replacetextEx(t, "\\u00ec", "\\u043c")
		t = replacetextEx(t, "\\u00ed", "\\u043d")
		t = replacetextEx(t, "\\u00ee", "\\u043e")
		t = replacetextEx(t, "\\u00ef", "\\u043f")
		//ð-ÿ
		t = replacetextEx(t, "\\u00f0", "\\u0440")
		t = replacetextEx(t, "\\u00f1", "\\u0441")
		t = replacetextEx(t, "\\u00f2", "\\u0442")
		t = replacetextEx(t, "\\u00f3", "\\u0443")
		t = replacetextEx(t, "\\u00f4", "\\u0444")
		t = replacetextEx(t, "\\u00f5", "\\u0445")
		t = replacetextEx(t, "\\u00f6", "\\u0446")
		t = replacetextEx(t, "\\u00f7", "\\u0447")
		t = replacetextEx(t, "\\u00f8", "\\u0448")
		t = replacetextEx(t, "\\u00f9", "\\u0449")
		t = replacetextEx(t, "\\u00fa", "\\u044a")
		t = replacetextEx(t, "\\u00fb", "\\u044b")
		t = replacetextEx(t, "\\u00fc", "\\u044c")
		t = replacetextEx(t, "\\u00fd", "\\u044d")
		t = replacetextEx(t, "\\u00fe", "\\u044e")
	t = replacetextEx(t, "&amp;#255;", "\\u044f")
	t = replacetextEx(t, "&amp;#1103;", "\\u044f")
	t = replacetextEx(t, "&#255;", "\\u044f")
	t = replacetextEx(t, "&#1103;", "\\u044f")
	return t

/proc/convert1251_to_utf(t)
	//¨, ¸
	t = replacetextEx(t, "¨", "&#1025;")
	t = replacetextEx(t, "¸", "&#1105;")
	//À-Ï
	t = replacetextEx(t, "À", "&#1040;")
	t = replacetextEx(t, "Á", "&#1041;")
	t = replacetextEx(t, "Â", "&#1042;")
	t = replacetextEx(t, "Ã", "&#1043;")
	t = replacetextEx(t, "Ä", "&#1044;")
	t = replacetextEx(t, "Å", "&#1045;")
	t = replacetextEx(t, "Æ", "&#1046;")
	t = replacetextEx(t, "Ç", "&#1047;")
	t = replacetextEx(t, "È", "&#1048;")
	t = replacetextEx(t, "É", "&#1049;")
	t = replacetextEx(t, "Ê", "&#1050;")
	t = replacetextEx(t, "Ë", "&#1051;")
	t = replacetextEx(t, "Ì", "&#1052;")
	t = replacetextEx(t, "Í", "&#1053;")
	t = replacetextEx(t, "Î", "&#1054;")
	t = replacetextEx(t, "Ï", "&#1055;")
	//Ð-ß
	t = replacetextEx(t, "Ð", "&#1056;")
	t = replacetextEx(t, "Ñ", "&#1057;")
	t = replacetextEx(t, "Ò", "&#1058;")
	t = replacetextEx(t, "Ó", "&#1059;")
	t = replacetextEx(t, "Ô", "&#1060;")
	t = replacetextEx(t, "Õ", "&#1061;")
	t = replacetextEx(t, "Ö", "&#1062;")
	t = replacetextEx(t, "×", "&#1063;")
	t = replacetextEx(t, "Ø", "&#1064;")
	t = replacetextEx(t, "Ù", "&#1065;")
	t = replacetextEx(t, "Ú", "&#1066;")
	t = replacetextEx(t, "Û", "&#1067;")
	t = replacetextEx(t, "Ü", "&#1068;")
	t = replacetextEx(t, "Ý", "&#1069;")
	t = replacetextEx(t, "Þ", "&#1070;")
	t = replacetextEx(t, "ß", "&#1071;")
	//à-ï
	t = replacetextEx(t, "à", "&#1072;")
	t = replacetextEx(t, "á", "&#1073;")
	t = replacetextEx(t, "â", "&#1074;")
	t = replacetextEx(t, "ã", "&#1075;")
	t = replacetextEx(t, "ä", "&#1076;")
	t = replacetextEx(t, "å", "&#1077;")
	t = replacetextEx(t, "æ", "&#1078;")
	t = replacetextEx(t, "ç", "&#1079;")
	t = replacetextEx(t, "è", "&#1080;")
	t = replacetextEx(t, "é", "&#1081;")
	t = replacetextEx(t, "ê", "&#1082;")
	t = replacetextEx(t, "ë", "&#1083;")
	t = replacetextEx(t, "ì", "&#1084;")
	t = replacetextEx(t, "í", "&#1085;")
	t = replacetextEx(t, "î", "&#1086;")
	t = replacetextEx(t, "ï", "&#1087;")
	//ð-ÿ
	t = replacetextEx(t, "ð", "&#1088;")
	t = replacetextEx(t, "ñ", "&#1089;")
	t = replacetextEx(t, "ò", "&#1090;")
	t = replacetextEx(t, "ó", "&#1091;")
	t = replacetextEx(t, "ô", "&#1092;")
	t = replacetextEx(t, "õ", "&#1093;")
	t = replacetextEx(t, "ö", "&#1094;")
	t = replacetextEx(t, "÷", "&#1095;")
	t = replacetextEx(t, "ø", "&#1096;")
	t = replacetextEx(t, "ù", "&#1097;")
	t = replacetextEx(t, "ú", "&#1098;")
	t = replacetextEx(t, "û", "&#1099;")
	t = replacetextEx(t, "ü", "&#1100;")
	t = replacetextEx(t, "ý", "&#1101;")
	t = replacetextEx(t, "þ", "&#1102;")
	t = replacetextEx(t, "ÿ", "&#1103;")
	t = replacetextEx(t, "&#255;", "&#1103;")
	return t

/client/verb/fix_chat()
	set name = "Fix chat"
	set category = "OOC"
	if (!chatOutput || !istype(chatOutput))
		var/action = alert(src, "Invalid Chat Output data found!\nRecreate data?", "Wot?", "Recreate Chat Output data", "Cancel")
		if (action != "Recreate Chat Output data")
			return
		chatOutput = new /datum/chatOutput(src)
		chatOutput.start()
		action = alert(src, "Goon chat reloading, wait a bit and tell me if it's fixed", "", "Fixed", "Nope")
		if (action == "Fixed")
			log_game("GOONCHAT: [key_name(src)] Had to fix their goonchat by re-creating the chatOutput datum")
		else
			chatOutput.load()
			action = alert(src, "How about now? (give it a moment (it may also try to load twice))", "", "Yes", "No")
			if (action == "Yes")
				log_game("GOONCHAT: [key_name(src)] Had to fix their goonchat by re-creating the chatOutput datum and forcing a load()")
			else
				action = alert(src, "Welp, I'm all out of ideas. Try closing byond and reconnecting.\nWe could also disable fancy chat and re-enable oldchat", "", "Thanks anyways", "Switch to old chat")
				if (action == "Switch to old chat")
					winset(src, "output", "is-visible=true;is-disabled=false")
					winset(src, "browseroutput", "is-visible=false")
				log_game("GOONCHAT: [key_name(src)] Failed to fix their goonchat window after recreating the chatOutput and forcing a load()")

	else if (chatOutput.loaded)
		var/action = alert(src, "ChatOutput seems to be loaded\nDo you want me to force a reload, wiping the chat log or just refresh the chat window because it broke/went away?", "Hmmm", "Force Reload", "Refresh", "Cancel")
		switch (action)
			if ("Force Reload")
				chatOutput.loaded = FALSE
				chatOutput.start() //this is likely to fail since it asks , but we should try it anyways so we know.
				action = alert(src, "Goon chat reloading, wait a bit and tell me if it's fixed", "", "Fixed", "Nope")
				if (action == "Fixed")
					log_game("GOONCHAT: [key_name(src)] Had to fix their goonchat by forcing a start()")
				else
					chatOutput.load()
					action = alert(src, "How about now? (give it a moment (it may also try to load twice))", "", "Yes", "No")
					if (action == "Yes")
						log_game("GOONCHAT: [key_name(src)] Had to fix their goonchat by forcing a load()")
					else
						action = alert(src, "Welp, I'm all out of ideas. Try closing byond and reconnecting.\nWe could also disable fancy chat and re-enable oldchat", "", "Thanks anyways", "Switch to old chat")
						if (action == "Switch to old chat")
							winset(src, "output", "is-visible=true;is-disabled=false")
							winset(src, "browseroutput", "is-visible=false")
						log_game("GOONCHAT: [key_name(src)] Failed to fix their goonchat window forcing a start() and forcing a load()")

			if ("Refresh")
				chatOutput.showChat()
				action = alert(src, "Goon chat refreshing, wait a bit and tell me if it's fixed", "", "Fixed", "Nope, force a reload")
				if (action == "Fixed")
					log_game("GOONCHAT: [key_name(src)] Had to fix their goonchat by forcing a show()")
				else
					chatOutput.loaded = FALSE
					chatOutput.load()
					action = alert(src, "How about now? (give it a moment)", "", "Yes", "No")
					if (action == "Yes")
						log_game("GOONCHAT: [key_name(src)] Had to fix their goonchat by forcing a load()")
					else
						action = alert(src, "Welp, I'm all out of ideas. Try closing byond and reconnecting.\nWe could also disable fancy chat and re-enable oldchat", "", "Thanks anyways", "Switch to old chat")
						if (action == "Switch to old chat")
							winset(src, "output", "is-visible=true;is-disabled=false")
							winset(src, "browseroutput", "is-visible=false")
						log_game("GOONCHAT: [key_name(src)] Failed to fix their goonchat window forcing a show() and forcing a load()")
		return

	else
		chatOutput.start()
		var/action = alert(src, "Manually loading Chat, wait a bit and tell me if it's fixed", "", "Fixed", "Nope")
		if (action == "Fixed")
			log_game("GOONCHAT: [key_name(src)] Had to fix their goonchat by manually calling start()")
		else
			chatOutput.load()
			alert(src, "How about now? (give it a moment (it may also try to load twice))", "", "Yes", "No")
			if (action == "Yes")
				log_game("GOONCHAT: [key_name(src)] Had to fix their goonchat by manually calling start() and forcing a load()")
			else
				action = alert(src, "Welp, I'm all out of ideas. Try closing byond and reconnecting.\nWe could also disable fancy chat and re-enable oldchat", "", "Thanks anyways", "Switch to old chat")
				if (action == "Switch to old chat")
					winset(src, "output", list2params(list("on-show" = "", "is-disabled" = "false", "is-visible" = "true")))
					winset(src, "browseroutput", "is-disabled=true;is-visible=false")
				log_game("GOONCHAT: [key_name(src)] Failed to fix their goonchat window after manually calling start() and forcing a load()")

//Generated names do not include file extention.
//Used mainly for code that deals with assets in a generic way
//The same asset will always lead to the same asset name
/proc/generate_asset_name(var/file)
	return "asset.[md5(fcopy_rsc(file))]"

/datum/asset/simple/goonchat
	verify = FALSE
	assets = list(
		"jquery.min.js"            = 'code/modules/html_interface/js/jquery.min.js',
		"json2.min.js"             = 'code/modules/goonchat/browserassets/js/json2.min.js',
		"errorHandler.js"          = 'code/modules/goonchat/browserassets/js/errorHandler.js',
		"browserOutput.js"         = 'code/modules/goonchat/browserassets/js/browserOutput.js',
		"fontawesome-webfont.eot"  = 'tgui/assets/fonts/fontawesome-webfont.eot',
		"fontawesome-webfont.svg"  = 'tgui/assets/fonts/fontawesome-webfont.svg',
		"fontawesome-webfont.ttf"  = 'tgui/assets/fonts/fontawesome-webfont.ttf',
		"fontawesome-webfont.woff" = 'tgui/assets/fonts/fontawesome-webfont.woff',
		"font-awesome.css"	       = 'code/modules/goonchat/browserassets/css/font-awesome.css',
		"browserOutput.css"	       = 'code/modules/goonchat/browserassets/css/browserOutput.css',
	)
