/datum/admins/proc/xeno_whitelist_panel()
	set name = "Xenos Whitelist Panel"
	set desc = "Use this to edit players xenowhitelist. Yupi!"
	set category = "Admin"

	if(!usr.client) return

	if(istype(usr,/mob/new_player))
		to_chat(usr, "НаноУИ не работают в лобби. Когда нибудь я пойму почему. Пожалуйста зайди в раунд или обзерв.\n(с) Laxesh")
		return

	if(!istype(src,/datum/admins))
		src = usr.client.holder
	if(!istype(src,/datum/admins))
		to_chat(usr, "Error: you are not an admin!")
		return

	if(!check_rights(R_XENO))
		if(!check_rights(R_DEBUG))
			to_chat(usr, "<span class='warning'>Access Denied!</span>")
			return
		log_admin("[key_name(usr)] access xeno whitelist via debug.")
		message_staff("[key_name_admin(usr)] currently debugging xeno whitelist.")

	var/datum/nano_module/xenopanel/NM = new /datum/nano_module/xenopanel(usr)
	NM.ui_interact(usr)

/*
	This state checks that the user is an ~~admin~~ XenoModerator, end of story
*/
GLOBAL_DATUM_INIT(xeno_state, /datum/topic_state/admin_state/xeno, new)

/datum/topic_state/admin_state/xeno/can_use_topic(var/src_object, var/mob/user)
	return check_rights(R_XENO|R_DEBUG, 0, user) ? STATUS_INTERACTIVE : STATUS_CLOSE


/datum/nano_module/xenopanel
	var/alternate = FALSE	// 0 - current whitelist, 1 - not used whitelist
	var/list/used = list()
	var/list/noused = list()
//	var/list/xenoname = list()
	var/list/lowerxenoname = list()
	var/sortkey = "ckey"
	var/datum/nanoui/myui	// Shame on me

/datum/nano_module/xenopanel/New()
	.=..()
	for(var/s in all_species)
		var/datum/species/species = all_species[s]
		if(species.spawn_flags & SPECIES_IS_WHITELISTED)
			if(!(lowertext(species.get_bodytype()) in lowerxenoname))
				lowerxenoname.Add("[lowertext(species.get_bodytype())]")
//				xenoname.Add("[species.get_bodytype()]")
	used = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), sortkey)
	noused = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), sortkey)

/datum/nano_module/xenopanel/CanUseTopic(var/mob/user, var/datum/topic_state/state = GLOB.xeno_state)
	. = ..()

/datum/nano_module/xenopanel/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = GLOB.xeno_state)
	var/list/data = list()
	data["searchbox"] = "<form action='byond://'><input type='hidden' name='src' value='\ref[src]'>New ckey <input type='text' size='40' name='input' autofocus><input type='submit' value='Search'></form>"
	data["sorting"] = sortkey
	data["debug"] = check_rights(R_DEBUG)
	data["mode"] = alternate
	establish_db_connection()
	data["SQL"] = dbcon.IsConnected()	// -2 No connection, disabled, -1 Connected, config setup, 0 No connection, SQL setup, 1 Connected, SQL use setup
	if(!config.usealienwhitelistSQL)
		data["SQL"] = data["SQL"] ? -1 : -2
	data["disabled"] = !config.usealienwhitelist
	data["currentlist"] = alternate ? noused : used
//	data["allxenos"] = xenoname
	data["lowerallxenos"] = lowerxenoname

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "xeno_whitelist.tmpl", "XenoWhitelist Panel", 3000, 1000, src, state = state)
		ui.set_initial_data(data)
		ui.open()
	myui = ui

/datum/nano_module/xenopanel/Topic(var/href, href_list, state)
	if(..())
		return 1
	if(href_list["close"]) // This is called when the window is closed; we've signed up to get notified of it.
		qdel(src)
		return 1
	if (href_list["mode"])
		alternate = text2num(href_list["mode"])
		. = TOPIC_REFRESH

	else if (href_list["DBreconnect"])
		establish_db_connection()
		if(dbcon.IsConnected())
			used = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
			noused = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
			. = TOPIC_REFRESH
		else
			to_chat(usr, "Не удалось установить подключение к БД")
			. = TOPIC_NOACTION

	else if (href_list["ckey"] && href_list["race"])
		var/list/list = alternate ? noused : used
		var/list/ckey
		for(ckey in list)
			if(ckey["ckey"] == href_list["ckey"])
				break
		if(!ckey)
			log_admin("Error: Alien Whitelist Panel - unknown ckey marker found. Ckey [href_list["ckey"]]; Race [href_list["race"]]")
			message_staff("Error: Alien Whitelist Panel - unknown ckey marker found. Ckey [href_list["ckey"]]; Race [href_list["race"]]")
			return TOPIC_NOACTION
		if(href_list["race"] in ckey["YES"])
			ckey["YES"] -= list(href_list["race"])
			ckey["REVOKE"] += list(href_list["race"])
		else if(href_list["race"] in ckey["REVOKE"])
			ckey["REVOKE"] -= list(href_list["race"])
			ckey["YES"] += list(href_list["race"])
		else if(href_list["race"] in ckey["NO"])
			ckey["NO"] -= list(href_list["race"])
			ckey["GRANT"] += list(href_list["race"])
		else if(href_list["race"] in ckey["GRANT"])
			ckey["GRANT"] -= list(href_list["race"])
			ckey["NO"] += list(href_list["race"])
		else
			log_admin("Error: Alien Whitelist Panel - unknown species found. Ckey [href_list["ckey"]]; Race [href_list["race"]]")
			message_staff("Error: Alien Whitelist Panel - unknown species found. Ckey [href_list["ckey"]]; Race [href_list["race"]]")
		. = TOPIC_REFRESH

	else if (href_list["sorting"])
		sortkey = href_list["sorting"]
		used = SortByRace(used, sortkey)
		noused = SortByRace(noused, sortkey)
		. = TOPIC_REFRESH

	else if (href_list["send"])
		var/list/list = alternate ? noused : used
		var/list/grant = list()
		var/list/revoke = list()
		for(var/list/ckey in list)
			var/list/local = ckey["GRANT"]
			if(local && local.len)
				grant["[ckey["ckey"]]"] += local
			local = ckey["REVOKE"]
			if(local && local.len)
				revoke["[ckey["ckey"]]"] += local
		var/success
		if(!alternate)
			if(config.usealienwhitelistSQL)
				success = upload_SQL(usr, grant, revoke)
			else
				success = upload_CONFIG(usr, grant,revoke)
		else
			if(!config.usealienwhitelistSQL)
				success = upload_SQL(usr, grant, revoke)
			else
				success = upload_CONFIG(usr, grant,revoke)
		if(!success)
			log_admin("Error: Alien Whitelist Panel - Unable to override WL source")
			message_staff("Error: Alien Whitelist Panel - Unable to override WL source")
		used = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
		noused = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
		. = TOPIC_REFRESH

	else if (href_list["synch"])
		if(href_list["synch"] == "CDB")
			if(alert("Вы уверены что хотите скопировать данные из конфига в БД?\nВсе изменения ниже будут отменены!", "Synch", "Да", "Отмена") == "Отмена")
				return TOPIC_NOACTION
		else if(href_list["synch"] == "DBC")
			if(alert("Вы уверены что хотите скопировать данные из БД в конфиг?\nВсе изменения ниже будут отменены!", "Synch", "Да", "Отмена") == "Отмена")
				return TOPIC_NOACTION
		else
			to_chat(usr, "Ошибка синхронизации: неизвестные адреса синхронизации.")
			return TOPIC_NOACTION
		var/list/list
		var/list/notlist
		if(config.usealienwhitelistSQL)
			if(href_list["synch"] == "CDB")
				list = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
				notlist = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
			else
				list = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
				notlist = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
		else
			if(href_list["synch"] == "CDB")
				list = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
				notlist = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
			else
				list = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
				notlist = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")

		var/list/grant = list()
		for(var/list/ckey in list)
			var/list/local = ckey["YES"]
			if(local && local.len)
				grant[ckey["ckey"]] = local

		if(TRUE)		// HARD RESET not need this. But we not need HReset now.
			var/list/notgrant = list()
			for(var/list/ckey in notlist)
				var/list/local = ckey["YES"]
				if(local && local.len)
					notgrant[ckey["ckey"]] = local

			grant = difflist(grant, notgrant)

		if(!grant || !grant.len)
			to_chat(usr, "Нечего переносить.")
			return TOPIC_NOACTION
		var/success
		if(href_list["synch"] == "CDB")
			success = upload_SQL(usr, grant, null)
		else
			success = upload_CONFIG(usr, grant, null)
		if(!success)
			to_chat(usr, "Загрузка неудалась.")
		. = TOPIC_REFRESH

	else if (href_list["refresh"])
		if(alert("Вы уверены что хотите синхронизироваться с БД | конфиг-файлом?\nВсе изменения ниже будут отменены!", "Refresh", "Да", "Отмена") == "Отмена")
			return TOPIC_NOACTION
		used = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
		noused = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
		. = TOPIC_REFRESH
	else if (href_list["input"])
		var/input = lowertext(sanitize(href_list["input"]))
		sortkey = input
		if(!input)
			return TOPIC_NOACTION
		if(used)
			used = inckeysearch(used, input)
		if(noused)
			noused = inckeysearch(noused, input)
		if(myui)
			myui.update()
		. = TOPIC_REFRESH

/datum/nano_module/xenopanel/proc/inckeysearch(var/list/list, var/ckey)
	var/list/newckey = list()
	var/list/insort = list()
	var/list/notinsort = list()
	var/create = TRUE
	list = sortByKey(list, "ckey")
	for(var/list/check in list)
		if(check["ckey"] == ckey)
			create = FALSE
			newckey[++newckey.len] = check
		else if(findtext(check["ckey"], ckey, 1, length(ckey)+1))
			insort[++insort.len] = check
		else
			notinsort[++notinsort.len] = check

	if(create)
		var/list/check = list()
		check["ckey"] = ckey
		for(var/race in lowerxenoname)
			check["NO"] += list(race)
		newckey[++newckey.len] = check

	list.Cut()
	list.Add(newckey)
	list.Add(insort)
	list.Add(notinsort)
	return list

/datum/nano_module/xenopanel/proc/upload_SQL(var/client/user, var/list/grant, var/list/revoke)
	. = 1
	user = user.get_client()
	if(grant && grant.len)
		for(var/ckey in grant)
			var/list/check = grant[ckey]
			var/dbckey = sql_sanitize_text("[ckey]")
			for(var/race in check)
				var/sql = "INSERT INTO `whitelist` (ckey,race) VALUES ('[lowertext(dbckey)]','[lowertext(race)]')"
				establish_db_connection()
				if(!dbcon.IsConnected())
					return 0
				var/DBQuery/query_insert = dbcon.NewQuery(sql)
				query_insert.Execute()
			log_admin("Alien Whitelist GRANTED (SQL) by [user.ckey]. [lowertext(dbckey)]: [jointext(check, ", ")]")
			message_staff("Alien Whitelist GRANTED (SQL) by [user.ckey]. [lowertext(dbckey)]: [jointext(check, ", ")]")
	if(revoke && revoke.len)
		for(var/ckey in revoke)
			var/list/check = revoke[ckey]
			var/dbckey = sql_sanitize_text("[ckey]")
			for(var/race in check)
				var/sql = "DELETE FROM `whitelist` WHERE ckey = '[lowertext(dbckey)]' AND race = '[lowertext(race)]'"
				establish_db_connection()
				if(!dbcon.IsConnected())
					return 0
				var/DBQuery/query_insert = dbcon.NewQuery(sql)
				query_insert.Execute()
			log_admin("Alien Whitelist REVOKED (SQL) by [user.ckey]. [lowertext(dbckey)]: [jointext(check, ", ")]")
			message_staff("Alien Whitelist REVOKED (SQL) by [user.ckey]. [lowertext(dbckey)]: [jointext(check, ", ")]")
	user = user.get_client()
	SSwebhooks.send(WEBHOOK_XENO_WHITELIST, list("ckey" = user.ckey, "grant" = grant, "revoke" = revoke, "type" = "базу данных"))
	if(config.usealienwhitelistSQL)
		return load_alienwhitelistSQL()

/datum/nano_module/xenopanel/proc/upload_CONFIG(var/client/user, var/list/grant, var/list/revoke, var/sort = TRUE)
	. = 1
	user = user.get_client()
	var/text = file2text("config/alienwhitelist.txt")
	if (!text)
		log_misc("Failed to load config/alienwhitelist.txt")
		return 0
	var/list/list = splittext(text, "\n")
	// Empty line in the end
	if(list[list.len] == "")
		list -= list[list.len]
	if(revoke && revoke.len)
		for(var/ckey in revoke)
			var/list/check = revoke[ckey]
			for(var/race in check)
				list -= "[lowertext(ckey)] - [lowertext(race)]"
			log_admin("Alien Whitelist REVOKED (CONFIG) by [user.ckey]. [lowertext(ckey)]: [jointext(check, ", ")]")
			message_staff("Alien Whitelist REVOKED (CONFIG) by [user.ckey]. [lowertext(ckey)]: [jointext(check, ", ")]")
	if(grant && grant.len)
		for(var/ckey in grant)
			var/list/check = grant[ckey]
			for(var/race in check)
				list += "[lowertext(ckey)] - [lowertext(race)]"
			log_admin("Alien Whitelist GRANTED (CONFIG) by [user.ckey]. [lowertext(ckey)]: [jointext(check, ", ")]")
			message_staff("Alien Whitelist GRANTED (CONFIG) by [user.ckey]. [lowertext(ckey)]: [jointext(check, ", ")]")
	if(!list || !list.len)
		log_misc("Failed to load config/alienwhitelist.txt")
		return 0
	// Not working
	if(sort)
		var/ckeys = list()
		var/list/racecheck = list()
		for(var/check in list)
			var/list/unite = splittext(check, " - ")
			var/list/a = list()
			a["ckey"] = unite[1]
			a["race"] = unite[2]
			ckeys += list(a)
			if(!(unite[2] in racecheck))
				racecheck[++racecheck.len] = unite[2]
		racecheck = sortList(racecheck)
		var/list/result = list()
		for(var/check in racecheck)
			var/list/ckeys1 = list()
			for(var/chekycheck in ckeys)
				var/list/local = chekycheck
				if(local["race"] == check)
					ckeys1 += list(chekycheck)
			ckeys1 = sortByKey(ckeys1, "ckey")
			result += ckeys1
			ckeys1.Cut()

		list.Cut()
		for(var/ChEcK in result)
			var/list/key = ChEcK
			var/CKEY = key["ckey"]
			var/RACE = key["race"]
			var/unite = "[CKEY] - [RACE]"
			list += unite
	SSwebhooks.send(WEBHOOK_XENO_WHITELIST, list("ckey" = user.ckey, "grant" = grant, "revoke" = revoke, "type" = "конфиг-файл"))
	text = jointext(list, "\n")
	fdel("config/alienwhitelist.txt")
	text2file(text, "config/alienwhitelist.txt")
	if(!config.usealienwhitelistSQL)
		return load_alienwhitelist()

//	Если элемент есть в подлисте - вытаскиваем его повыше
/proc/SortByRace(var/list/L, var/race = "ckey")
	if(!length(L))
		return
	L = sortByKey(L, "ckey")
	if(race && !(race == "ckey"))
		var/list/insort = list()
		var/list/secondsort = list()
		var/list/tirhdsort = list()
		var/list/notinsort = list()
		for(var/list/s in L)
			if(lowertext(race) in s["GRANT"])
				insort[++insort.len] = s
			else if(lowertext(race) in s["REVOKE"])
				secondsort[++secondsort.len] = s
			else if(lowertext(race) in s["YES"])
				tirhdsort[++tirhdsort.len] = s
			else
				notinsort[++notinsort.len] = s
		L.Cut()
		L.Add(insort)
		L.Add(secondsort)
		L.Add(tirhdsort)
		L.Add(notinsort)
	return L

//	Для того чтобы уи мог нормально читать дату, нам нужно наш общий список еще раз переделать. Да - говнокод, но зато какой! ~Laxesh
/proc/ParseXenoWhitelist(var/list/list, var/list/allspecies)
	var/list/A = list()
	if(!list.len)
		return
	A = splittext(pick(list), " - ")
	if(A.len && (A.len >=2))
		log_admin("Error: Alien Whitelist SQL usage has been turned on, but list wasn't reloaded.")
		message_staff("Error: Alien Whitelist SQL usage has been turned on, but list wasn't reloaded.")
		return
	A.Cut()
	for(var/string in list)
		var/list/unite = list()
		unite["ckey"] = string
		for(var/s in allspecies)
			if(s in list[string])
				unite["YES"] += list(s)
			else
				unite["NO"] += list(s)
		A += list(unite)
	return A

//	При отключенном вайтлисте - лист не генерится, а так что генерим его сами.
// 	Получаем лист в структуре - whitelist["ckey"]=list("race1","race2")
/proc/GetXenoWhitelist(var/not_used_list = FALSE)
	var/SQL = config.usealienwhitelistSQL
	. = list()
	//Нам нужен действующий ВЛ сервера, и он есть.
	if(!not_used_list && alien_whitelist)
		. = alien_whitelist
	//Нам нужен txt ВЛ, и его надо загрузить. (!XOR)
	else if(!(not_used_list ^ SQL) || (!alien_whitelist && !SQL))
		var/text = file2text("config/alienwhitelist.txt")
		if (text)
			. = splittext(text, "\n")
		else
			return
	//Нам нужен SQL ВЛ, и его надо загрузить. (XOR)
	else if((not_used_list ^ SQL) || (!alien_whitelist && SQL))
		establish_db_connection()
		if(!dbcon.IsConnected())
			return
		var/DBQuery/query = dbcon.NewQuery("SELECT * FROM whitelist")
		if(!query.Execute())
			to_world_log(dbcon.ErrorMsg())
			return
		else
			while(query.NextRow())
				var/list/row = query.GetRowData()
				if(.[row["ckey"]])
					var/list/A = .[row["ckey"]]
					A.Add(row["race"])
				else
					.[row["ckey"]] = list(row["race"])
	//Неизвестное состояние
	else
		return

	//Но при SQL лист по другому формируется. Приводим к общей структуре.
	if(SQL ^ not_used_list)
		return
	var/list/secondary = list()
	var/list/list = .
	for(var/s in .)
		var/list/A = splittext(s, " - ")
		if((!A.len) || (A.len < 2))
			if(list[list.len] == s)
				break
			log_admin("File alien_whitelist parsing error in line: [s]")
			message_staff("File alien_whitelist parsing error in line: [s]")
			continue
		if(A[1] in secondary)
			var/list/B = secondary[A[1]]
			if(findtext(s, " - All"))
				B = list()
				for(var/race in all_species)
					var/datum/species/species = all_species[race]
					if(species.spawn_flags & SPECIES_IS_WHITELISTED)
						B.Add("[lowertext(species.name)]")
			else
				if(!(A[2] in B))
					B.Add(lowertext(A[2]))
		else
			if(findtext(s, " - All"))
				secondary[A[1]] = list()
				for(var/race in all_species)
					var/datum/species/species = all_species[race]
					if(species.spawn_flags & SPECIES_IS_WHITELISTED)
						secondary[A[1]] += list("[lowertext(species.name)]")
			else
				secondary[A[1]] = list(lowertext(A[2]))
	. = secondary

