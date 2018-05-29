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

GLOBAL_LIST_INIT(c1251_to_utf_table, list(
	"¿" = "0410", "‡" = "0430",
	"¡" = "0411", "·" = "0431",
	"¬" = "0412", "‚" = "0432",
	"√" = "0413", "„" = "0433",
	"ƒ" = "0414", "‰" = "0434",
	"≈" = "0415", "Â" = "0435",
	"∆" = "0416", "Ê" = "0436",
	"«" = "0417", "Á" = "0437",
	"»" = "0418", "Ë" = "0438",
	"…" = "0419", "È" = "0439",
	" " = "041a", "Í" = "043a",
	"À" = "041b", "Î" = "043b",
	"Ã" = "041c", "Ï" = "043c",
	"Õ" = "041d", "Ì" = "043d",
	"Œ" = "041e", "Ó" = "043e",
	"œ" = "041f", "Ô" = "043f",
	"–" = "0420", "" = "0440",
	"—" = "0421", "Ò" = "0441",
	"“" = "0422", "Ú" = "0442",
	"”" = "0423", "Û" = "0443",
	"‘" = "0424", "Ù" = "0444",
	"’" = "0425", "ı" = "0445",
	"÷" = "0426", "ˆ" = "0446",
	"◊" = "0427", "˜" = "0447",
	"ÿ" = "0428", "¯" = "0448",
	"Ÿ" = "0429", "˘" = "0449",
	"⁄" = "042a", "˙" = "044a",
	"€" = "042b", "˚" = "044b",
	"‹" = "042c", "¸" = "044c",
	"›" = "042d", "˝" = "044d",
	"ﬁ" = "042e", "˛" = "044e",
	"ﬂ" = "042f", "ˇ" = "044f",

	"®" = "0401", "∏" = "0451",

	"Å" = "0403", "™" = "0404",
	"Ø" = "0407", "É" = "0453",
	"∫" = "0454", "ø" = "0457",
	"•" = "0490", "¥" = "0491",
	"ï" = "2022", "ñ" = "2013",
	"ó" = "2014", "π" = "2116"
))

GLOBAL_LIST_INIT(j1251_to_utf_table, list(
	"c0" = "0410", "e0" = "0430",
	"c1" = "0411", "e1" = "0431",
	"c2" = "0412", "e2" = "0432",
	"c3" = "0413", "e3" = "0433",
	"c4" = "0414", "e4" = "0434",
	"c5" = "0415", "e5" = "0435",
	"c6" = "0416", "e6" = "0436",
	"c7" = "0417", "e7" = "0437",
	"c8" = "0418", "e8" = "0438",
	"c9" = "0419", "e9" = "0439",
	"ca" = "041a", "ea" = "043a",
	"cb" = "041b", "eb" = "043b",
	"cc" = "041c", "ec" = "043c",
	"cd" = "041d", "ed" = "043d",
	"ce" = "041e", "ee" = "043e",
	"cf" = "041f", "ef" = "043f",
	"d0" = "0420", "f0" = "0440",
	"d1" = "0421", "f1" = "0441",
	"d2" = "0422", "f2" = "0442",
	"d3" = "0423", "f3" = "0443",
	"d4" = "0424", "f4" = "0444",
	"d5" = "0425", "f5" = "0445",
	"d6" = "0426", "f6" = "0446",
	"d7" = "0427", "f7" = "0447",
	"d8" = "0428", "f8" = "0448",
	"d9" = "0429", "f9" = "0449",
	"da" = "042a", "fa" = "044a",
	"db" = "042b", "fb" = "044b",
	"dc" = "042c", "fc" = "044c",
	"dd" = "042d", "fd" = "044d",
	"de" = "042e", "fe" = "044e",
	"df" = "042f", "ff" = "044f",

	"a8" = "0401", "b8" = "0451",

	"81" = "0403", "aa" = "0404",
	"af" = "0407", "83" = "0453",
	"ba" = "0454", "bf" = "0457",
	"a5" = "0490", "b4" = "0491",
	"95" = "2022", "96" = "2013",
	"97" = "2014", "b9" = "2116"
))

/proc/extA2U(t)
	if(!t)
		return

	t = replacetext(t, "&#255;", "\\u044f")
	t = replacetext(t, "&#1103;", "\\u044f")

	if(DM_VERSION < 511)
		for(var/s in GLOB.j1251_to_utf_table)
			t = replacetext(t, "\\x[s]", "\\u[GLOB.j1251_to_utf_table[s]]")
	else
		for(var/s in GLOB.j1251_to_utf_table)
			t = replacetext(t, "\\u00[s]", "\\u[GLOB.c1251_to_utf_table[s]]")
	return t

/proc/convert1251_to_utf(t)
	if(!t)
		return

	t = replacetext(t, "&#255;", "&#x044f")
	t = replacetext(t, "&#1103;", "&#x044f")

	for(var/s in GLOB.c1251_to_utf_table)
		t = replacetext(t, s, "&#x[GLOB.c1251_to_utf_table[s]];")
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
