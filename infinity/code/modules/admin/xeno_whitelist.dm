/datum/admins/proc/xeno_whitelist_panel()
	set name = "Xenos Whitelist Panel"
	set desc = "Use this to edit players xenowhitelist. Yupi!"
	set category = "Admin"

	if(istype(usr,/mob/new_player))
		to_chat(usr, "������ �� �������� � �����. ����� ������ � ����� ������. ���������� ����� � ����� ��� ������. (�) Laxesh")
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
		log_admin("[key_name(src)] access xeno whitelist via debug.")
		message_staff("[key_name_admin(src)] currently debugging xeno whitelist.")

	var/datum/nano_module/xenopanel/NM = new /datum/nano_module/xenopanel(usr)
	NM.ui_interact(usr)

/*
	This state checks that the user is an ~~admin~~ XenoModerator, end of story
*/
GLOBAL_DATUM_INIT(xeno_state, /datum/topic_state/admin_state/xeno, new)

/datum/topic_state/admin_state/xeno/can_use_topic(var/src_object, var/mob/user)
	return check_rights(R_XENO, 0, user) ? STATUS_INTERACTIVE : STATUS_CLOSE


/datum/nano_module/xenopanel
	var/alternate = FALSE	// 0 - current whitelist, 1 - not used whitelist
	var/list/used = list()
	var/list/noused = list()
//	var/list/xenoname = list()
	var/list/lowerxenoname = list()
	var/sortkey = "ckey"

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
		ui = new(user, src, ui_key, "xeno_whitelist.tmpl", "XenoWhitelist Panel", 3000, 1000)
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/xenopanel/Topic(var/mob/user, href_list, state)
	..()

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
			to_chat(user, "�� ������� ���������� ����������� � ��")
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
			if(ckey["GRANT"] && ckey["GRANT"].len)
				grant[ckey["ckey"]] = ckey["GRANT"]
			if(ckey["REVOKE"] && ckey["REVOKE"].len)
				revoke[ckey["ckey"]] = ckey["REVOKE"]
		var/success
		if(!alternate)
			if(config.usealienwhitelistSQL)
				success = upload_SQL(grant, revoke)
			else
				success = upload_CONFIG(grant,revoke)
		else
			if(!config.usealienwhitelistSQL)
				success = upload_SQL(grant, revoke)
			else
				success = upload_CONFIG(grant,revoke)
		if(!success)
			log_admin("Error: Alien Whitelist Panel - Unable to override WL source")
			message_staff("Error: Alien Whitelist Panel - Unable to override WL source")
		used = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
		noused = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
		. = TOPIC_REFRESH

	else if (href_list["synch"])
		if(alert("�� ������� ��� ������ ������ ������ �� [href_list["synch"] ? "�� � ������" : "������� � ��"]?\n��� ��������� ���� ����� ��������!", "Synch", "��", "������") == "������")
			return TOPIC_NOACTION
		/*
		var/list/list
		if(config.usealienwhitelistSQL)
			if(href_list["synch"])
				list = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
			else
				list = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
		else
			if(href_list["synch"])
				list = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
			else
				list = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")

		var/list/grant = list()
		var/list/revoke = list()
		for(var/list/ckey in list)
			if(ckey["GRANT"] && ckey["GRANT"].len)
				grant[ckey["ckey"]] = ckey["GRANT"]
			if(ckey["REVOKE"] && ckey["REVOKE"].len)
				revoke[ckey["ckey"]] = ckey["REVOKE"]
		*/
		to_world("����� ������ ")
		. = TOPIC_REFRESH

	else if (href_list["refresh"])
		if(alert("�� ������� ��� ������ ������������������ � �� | ������-������?\n��� ��������� ���� ����� ��������!", "Refresh", "��", "������") == "������")
			return TOPIC_NOACTION
		used = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(FALSE), lowerxenoname), "ckey")
		noused = SortByRace(ParseXenoWhitelist(GetXenoWhitelist(TRUE), lowerxenoname), "ckey")
		. = TOPIC_REFRESH
	else if(href_list["input"])
		var/input = lowertext(sanitize(href_list["input"]))
		sortkey = input
		inckeysearch(input)
		. = TOPIC_REFRESH

/datum/nano_module/xenopanel/proc/inckeysearch(var/ckey)
	var/list/list = alternate ? noused : used
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
		var/list/check
		check["ckey"] = ckey
		for(var/race in lowerxenoname)
			check["NO"] += list(race)
		newckey[++newckey.len] = check

	if(alternate)
		noused.Cut()
		noused.Add(newckey)
		noused.Add(insort)
		noused.Add(notinsort)
	else
		used.Cut()
		used.Add(newckey)
		used.Add(insort)
		used.Add(notinsort)

/datum/nano_module/xenopanel/proc/upload_SQL(var/list/grant, var/list/revoke)
	. = 1
	if(grant && grant.len)
		for(var/list/ckey in grant)
			var/dbckey = sql_sanitize_text("[ckey]")
			for(var/race in ckey)
				var/sql = "INSERT INTO `whitelist` (ckey,race) VALUES ([lowertext(dbckey)],[lowertext(race)])"
				establish_db_connection()
				if(!dbcon.IsConnected())
					return 0
				var/DBQuery/query_insert = dbcon.NewQuery(sql)
				query_insert.Execute()
				to_world(sql)
	if(revoke && revoke.len)
		for(var/list/ckey in revoke)
			var/dbckey = sql_sanitize_text("[ckey]")
			for(var/race in ckey)
				var/sql = "DELETE FROM `whitelist` WHERE ckey = [lowertext(dbckey)] AND race = [lowertext(race)]"
				establish_db_connection()
				if(!dbcon.IsConnected())
					return 0
				var/DBQuery/query_insert = dbcon.NewQuery(sql)
				query_insert.Execute()
				to_world(sql)
	if(config.usealienwhitelistSQL)
		return load_alienwhitelistSQL()

/datum/nano_module/xenopanel/proc/upload_CONFIG(var/list/grant, var/list/revoke)
	. = 1
	var/text = file2text("config/alienwhitelist.txt")
	if (!text)
		log_misc("Failed to load config/alienwhitelist.txt")
		return 0
	var/list/list = splittext(text, "\n")
	if(revoke && revoke.len)
		for(var/list/ckey in revoke)
			for(var/race in ckey)
				list -= "[lowertext(ckey)] - [lowertext(race)]"
	if(grant && grant.len)
		for(var/list/ckey in grant)
			for(var/race in ckey)
				list += "[lowertext(ckey)] - [lowertext(race)]"
	if(!list || !list.len)
		log_misc("Failed to load config/alienwhitelist.txt")
		return 0
	text = jointext(list, "\n")
	fdel("config/alienwhitelist.txt")
	text2file(text, "config/alienwhitelist.txt")
	if(!config.usealienwhitelistSQL)
		return load_alienwhitelist()

//	���� ������� ���� � �������� - ����������� ��� ������
/proc/SortByRace(var/list/L, var/race = "ckey")
	if(!L)
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

//	��� ���� ����� �� ��� ��������� ������ ����, ��� ����� ��� ����� ������ ��� ��� ����������. �� - ��������, �� ���� �����! ~Laxesh
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

//	��� ����������� ��������� - ���� �� ���������, � ��� ��� ������� ��� ����.
// 	�������� ���� � ��������� - whitelist["ckey"]=list("race1","race2")
/proc/GetXenoWhitelist(var/not_used_list = FALSE)
	var/SQL = config.usealienwhitelistSQL
	. = list()
	//��� ����� ����������� �� �������, � �� ����.
	if(!not_used_list && alien_whitelist)
		. = alien_whitelist
	//��� ����� txt ��, � ��� ���� ���������. (!XOR)
	else if(!(not_used_list ^ SQL) || (!alien_whitelist && !SQL))
		var/text = file2text("config/alienwhitelist.txt")
		if (text)
			. = splittext(text, "\n")
		else
			return
	//��� ����� SQL ��, � ��� ���� ���������. (XOR)
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
	//����������� ���������
	else
		return

	//�� ��� SQL ���� �� ������� �����������. �������� � ����� ���������.
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

