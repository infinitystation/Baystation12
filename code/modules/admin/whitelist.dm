//Ported from Tau-Ceti ~Quardbreak.
/datum/admins/proc/whitelist_panel()
	set category = "Server"
	set name = "Whitelist Panel"
	set desc = "Allows you to view whitelist and maybe add or edit users."

	src = usr.client.holder
	if(!check_rights(R_ADMIN))
		return

	var/output = {"<!DOCTYPE html>
<html>
<head>
<title>Whitelist Panel</title>
<script type='text/javascript' src='search.js'></script>
<link rel='stylesheet' type='text/css' href='panels.css'>
</head>
<body onload='selectTextField();updateSearch();'>
<div id='main'><table id='searchable' cellspacing='0'>
<tr class='title'>
<th text-align:center;'>CKEY <a class='small' href='?src=\ref[src];whitelist=add_user'>\[+\]</a></th>
</tr>
"}

	for(var/user_ckey in alien_whitelist)
		output += "<tr>"
		output += "<td style='text-align:center;'><a class='small' href='?src=\ref[src];whitelist=showspecies;ckey=[user_ckey]'>[user_ckey]</a></td>"
		output += "</tr>"

	output += {"
</table></div>
<div id='top'><b>Search:</b> <input type='text' id='filter' value='' style='width:70%;' onkeyup='updateSearch();'></div>
</body>
</html>"}

	usr << browse(output,"window=whitelist;size=600x500")

/datum/admins/proc/whitelist_view(user_ckey)
	src = usr.client.holder
	if(!check_rights(R_ADMIN))
		return
	if(!user_ckey)
		to_chat(usr, "<span class='alert'>Error: Topic 'whitelist': No valid ckey</span>")
		return

	var/output = {"<!DOCTYPE html>
<html>
<head>
<title>Whitelist Panel for [user_ckey]</title>
<script type='text/javascript' src='search.js'></script>
<link rel='stylesheet' type='text/css' href='panels.css'>
</head>
<body onload='selectTextField();updateSearch();'>
<div id='main'><table id='searchable' cellspacing='0'>
<tr class='title'>
<th style='width:125px;text-align:center;'>[uppertext(user_ckey)]</th>
<th style='width:125px;'>SPECIES <a class='small' href='?src=\ref[src];whitelist=add_species;ckey=[user_ckey]'>\[+\]</a></th><th style='width:100%;'>REASON</th><th style='width:125px;'>ADDED BY</th><th style='width:125px;'>EDITED BY</th>
</tr>
"}

	for(var/species in alien_whitelist[user_ckey])
		output += "<tr>"

		var/ban = alien_whitelist[user_ckey][species]["ban"] ? "Banned" : "Available"
		output += "<td><a class='small' href='?src=\ref[src];whitelist=edit_ban;ckey=[user_ckey];species=[species]'>[ban]</a></td>"
		output += "<td>[species]</td>"

		var/reason = sanitize(alien_whitelist[user_ckey][species]["reason"])
		output += "<td><a class='small' href='?src=\ref[src];whitelist=edit_reason;ckey=[user_ckey];species=[species]'>[reason]</a></td>"
		var/addby = alien_whitelist[user_ckey][species]["addby"]
		var/addtm = alien_whitelist[user_ckey][species]["addtm"]
		output += "<td>[addby] - [addtm]</td>"
		var/editby = alien_whitelist[user_ckey][species]["editby"]
		var/edittm = alien_whitelist[user_ckey][species]["edittm"]
		output += "<td>[editby] - [edittm]</td>"

		output += "</tr>"

	output += {"
</table></div>
<div id='top'><b>Search:</b> <input type='text' id='filter' value='' style='width:70%;' onkeyup='updateSearch();'></div>
</body>
</html>"}

	usr << browse(output,"window=whitelist_user;size=750x500")

/datum/admins/proc/whitelist_add_user()
	if(!check_rights(R_ADMIN))
		return

	var/target_ckey = input(usr,"type in ckey:","Add User", null) as null|text
	if(!target_ckey)
		return

	var/species = input(usr, "select species:", "Species") as null|anything in whitelisted_roles
	if(!species)
		return

	var/reason = input(usr, "type in reason:", "Reason") as null|text
	if(!reason)
		return

	whitelist_DB_add(target_ckey, species, reason, usr.ckey)

/datum/admins/proc/whitelist_add_species(target_ckey)
	if(!check_rights(R_ADMIN))
		return

	if(!target_ckey)
		return

	var/species = input(usr, "select species:", "Species") as null|anything in whitelisted_roles
	if(!species)
		return

	var/reason = input(usr, "type in reason:", "Reason") as null|text
	if(!reason)
		return

	whitelist_DB_add(target_ckey, species, reason, usr.ckey)

/datum/admins/proc/whitelist_edit(target_ckey, species, ban_edit)
	if(!check_rights(R_ADMIN))
		return

	if(!target_ckey || !species)
		return

	var/ban = alien_whitelist[target_ckey][species]["ban"]

	if(ban_edit)
		ban_edit = alert(usr, ban ? "Do you want to UNBAN [species] for [target_ckey]?" : "Do you want to REMOVE [species] for [target_ckey]?",,ban ? "Unban" : "Remove", "Cancel")
		switch(ban_edit)
			if("Cancel")
				return
			if("Unban")
				ban = FALSE
			if("Remove")
				ban = TRUE

	var/reason = input(usr, "type in reason:", "Reason") as null|text
	if(!reason)
		return

	whitelist_DB_edit(target_ckey, species, ban, ban_edit, reason, usr.ckey)

/proc/whitelist_DB_add(target_ckey, species, reason, adm_ckey, added_by_bot = FALSE)
	if(!config.usealienwhitelist)
		if(!added_by_bot)
			to_chat(usr, "<span class='warning'>Whitelist disabled.</span>")
		return FALSE

	if(!target_ckey || !species || !reason || !adm_ckey)
		return FALSE

	if(!added_by_bot && !check_rights(R_ADMIN))
		return FALSE

	target_ckey = ckey(target_ckey)
	species = lowertext(species)
	reason = sql_sanitize_text(reason)
	adm_ckey = ckey(adm_ckey)

	if(!(species in whitelisted_roles))
		if(!added_by_bot)
			to_chat(usr, "<span class='warning'>Species [species] does not exist in whitelisted species.</span>")
		return FALSE

	if(alien_whitelist[target_ckey] && alien_whitelist[target_ckey][species])
		if(!added_by_bot)
			to_chat(usr, "<span class='warning'>[species] for [target_ckey] already exists in whitelist.</span>")
		return FALSE

	var/database/query/insert_query = new("INSERT INTO whitelist VALUES (?, ?, '0', ?, ?, datetime('now'), ?, datetime('now'));", target_ckey, species, reason, adm_ckey, adm_ckey)
	insert_query.Execute(whitelist_db)
	var/fail_msg = insert_query.ErrorMsg()
	if(fail_msg)
		world.log << "SQL ERROR (I): [fail_msg]"
		message_admins("SQL ERROR (I): [fail_msg]")
		return FALSE

	if(!alien_whitelist[target_ckey])
		alien_whitelist[target_ckey] = list()
	alien_whitelist[target_ckey][species] = list("ban" = 0, "reason" = reason, "addby" = adm_ckey, "addtm" = time2text(world.realtime, "YYYY-MM-DD hh:mm:ss"), "editby" = adm_ckey)

	var/msg = "whitelisted [species] for [target_ckey] with reason: [sanitize(reason)]"
	if(!added_by_bot)
		message_admins("[key_name_admin(usr)] [msg]")
		log_admin("[key_name(usr)] [msg]")
		usr.client.holder.whitelist_panel()
		usr.client.holder.whitelist_view(target_ckey)
	else
		message_admins("[adm_ckey] [msg]")
		log_admin("[adm_ckey] [msg]")
	return TRUE

/datum/admins/proc/whitelist_DB_edit(target_ckey, species, ban, ban_edit, reason, adm_ckey)
	if(!config.usealienwhitelist)
		to_chat(usr, "<span class='notice'>Whitelist disabled.</span>")
		return

	if(!target_ckey || !species || !reason || !adm_ckey)
		return

	if(!check_rights(R_ADMIN))
		return

	target_ckey = ckey(target_ckey)
	species = lowertext(species)
	reason = sql_sanitize_text(reason)
	adm_ckey = ckey(adm_ckey)

	if(!(species in whitelisted_roles))
		to_chat(usr, "<span class='warning'>Species [species] does not exist in whitelisted species.</span>")
		return

	if(!alien_whitelist[target_ckey])
		to_chat(usr, "<span class='warning'>[target_ckey] does not exist in whitelist.</span>")
		return

	if(!alien_whitelist[target_ckey][species])
		to_chat(usr, "<span class='warning'>[species] for [target_ckey] does not exist in whitelist.</span>")
		return

	var/database/query/update_query
	if(ban_edit)
		update_query = new("UPDATE whitelist SET ban = ?, reason = ?, editby = ?, edittm = datetime('now') WHERE ckey = ? AND species = ?;", ban, reason, adm_ckey, target_ckey, species)
	else
		update_query = new("UPDATE whitelist SET reason = ?, editby = ?, edittm = datetime('now') WHERE ckey = ? AND species = ?;", reason, adm_ckey, target_ckey, species)
	update_query.Execute(whitelist_db)
	var/fail_msg = update_query.ErrorMsg()
	if(fail_msg)
		world.log << "SQL ERROR (U): [fail_msg]"
		message_admins("SQL ERROR (U): [fail_msg]")
		return

	var/msg = "changed reason in whitelist from [sanitize(alien_whitelist[target_ckey][species]["reason"])] to [sanitize(reason)] for [target_ckey] as [species]."
	if(ban_edit)
		alien_whitelist[target_ckey][species]["ban"] = ban
		msg = "[ban ? "removed" : "unbanned"] [species] from whitelist for [target_ckey] with reason [sanitize(reason)]."

	alien_whitelist[target_ckey][species]["reason"] = reason
	alien_whitelist[target_ckey][species]["editby"] = adm_ckey
	alien_whitelist[target_ckey][species]["edittm"] = time2text(world.realtime, "YYYY-MM-DD hh:mm:ss")

	message_admins("[key_name_admin(usr)] [msg]")
	log_admin("[key_name(usr)] [msg]")

	whitelist_view(target_ckey)

/hook/startup/proc/load_whitelistSQL()
	if(!config.usealienwhitelist)
		return

	if(!whitelist_db)

		// Create or load the DB.
		whitelist_db = new(whitelist_sqlite_path)

		// Whitelist table.
		var/database/query/init_schema = new(
			"CREATE TABLE IF NOT EXISTS whitelist ( \
			ckey TEXT NOT NULL, \
			species TEXT NOT NULL, \
			ban INTEGER NOT NULL, \
			reason TEXT NOT NULL, \
			addby TEXT NOT NULL, \
			addtm INTEGER NOT NULL, \
			editby TEXT NOT NULL, \
			edittm INTEGER NOT NULL \
			);")

		init_schema.Execute(whitelist_db)
		if(init_schema.ErrorMsg())
			world.log << "SQL ERROR (C): whitelist: [init_schema.ErrorMsg()]."
			return FALSE

	alien_whitelist = list()
	var/database/query/query = new("SELECT * FROM whitelist")
	query.Execute(whitelist_db)
	if(query.ErrorMsg())
		world.log << "SQL ERROR (L): whitelist: [query.ErrorMsg()]."
		return FALSE
	else
		while(query.NextRow())
			var/list/row = query.GetRowData()
			if(alien_whitelist[row["ckey"]])
				var/list/A = alien_whitelist[row["ckey"]]
				A.Add(list(row["species"] = list("ban" = row["ban"], "reason" = row["reason"], "addby" = row["addby"], "addtm" = row["addtm"], "editby" = row["editby"], "edittm" = row["edittm"])))
			else
				alien_whitelist[row["ckey"]] = list(row["species"] = list("ban" = row["ban"], "reason" = row["reason"], "addby" = row["addby"], "addtm" = row["addtm"], "editby" = row["editby"], "edittm" = row["edittm"]))
	return TRUE

/proc/is_alien_whitelisted(mob/M, species)
	if(!config.usealienwhitelist)
		return TRUE
	if(!M || !species || !alien_whitelist || !alien_whitelist[M.ckey])
		return FALSE

	species = lowertext(species)

	if(species == "human")
		return TRUE

	switch(species) //We don't use separate whitelist for languages, lets transform lang name to their race name.
		if("sinta'unathi")
			species = "unathi"
		if("siik'maas","siik'tajr")
			species = "tajaran"
		if("skrellian")
			species = "skrell"

	if(alien_whitelist[M.ckey][species] && !alien_whitelist[M.ckey][species]["ban"])
		return TRUE
	return FALSE