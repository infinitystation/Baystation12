/mob/new_player/Login()
	update_Login_details()	//handles setting lastKnownIP and computer_id for use by the ban systems as well as checking for multikeying

	if(config.usewhitelist_database && config.overflow_server_url && !whitelist_check())
		src << link(config.overflow_server_url)

	if (config.motd)
		to_chat(src, "<div class=\"motd\">[config.motd]</div>", handle_whitespace=FALSE)
	to_chat(src, "<div class='info'>Game ID: <div class='danger'>[game_id]</div></div>")

	if(!mind)
		mind = new /datum/mind(key)
		mind.active = 1
		mind.current = src

	loc = null
	GLOB.using_map.show_titlescreen(client)
	my_client = client
	set_sight(sight|SEE_TURFS)

	// Add to player list if missing
	if (!list_find(GLOB.player_list, src))
		ADD_SORTED(GLOB.player_list, src, /proc/cmp_mob_key)

	if(client)
		new_player_panel()
		if(SSinput.initialized)
			client.set_macros()

	if(!SScharacter_setup.initialized)
		SScharacter_setup.newplayers_requiring_init += src
	else
		deferred_login()

// This is called when the charcter setup system has been sufficiently initialized and prefs are available.
// Do not make any calls in mob/Login which may require prefs having been loaded.
// It is safe to assume that any UI or sound related calls will fall into that category.
/mob/new_player/proc/deferred_login()
	if(client)
		client.playtitlemusic()
		client.prefs?.apply_post_login_preferences() //inf
		maybe_send_staffwarns("connected as new player")
		if(client.get_preference_value(/datum/client_preference/goonchat) == GLOB.PREF_YES)
			if(!client.chatOutput.loaded) //inf, уже имеем вызов в client/New(). Здесь он для рестартов
				client.chatOutput.start()

/* inf-dev	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
	var/decl/security_level/SL = security_state.current_security_level
	var/alert_desc = ""
	if(SL.up_description)
		alert_desc = SL.up_description
	to_chat(src, "<span class='notice'>The alert level on the [station_name()] is currently: <font color=[SL.light_color_alarm]><B>[SL.name]</B></font>. [alert_desc]</span>")
*/

/mob/new_player/proc/whitelist_check()
	// Admins are immune to overflow rerouting
	if(!config.usewhitelist_database)
		return TRUE
	if(check_rights(rights_required = 0, show_msg = 0))
		return TRUE
	establish_db_connection()
	//Whitelisted people are immune to overflow rerouting.
	if(dbcon.IsConnected())
		var/dbckey = sql_sanitize_text(src.ckey)
		var/DBQuery/find_ticket = dbcon.NewQuery(
			"SELECT ckey FROM [sqlfdbkdbutil].ckey_whitelist WHERE ckey='[dbckey]' AND is_valid=true AND port=[world.port] AND date_start<=NOW() AND (NOW()<date_end OR date_end IS NULL)"
		)

		if(!find_ticket.Execute())
			to_world_log(dbcon.ErrorMsg())
			return FALSE
		if(!find_ticket.NextRow())
			return FALSE
		return TRUE
	return FALSE
