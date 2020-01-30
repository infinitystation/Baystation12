/client/var/banprisoned = 0
/client/var/banprisoned_reason = ""

/client/proc/prisoner_init()
	if(!IsBanPrisoned(key, address, computer_id))
		return
	prefs.muted = MUTE_OOC | MUTE_ADMINHELP | MUTE_DEADCHAT | MUTE_PRAY
	banprisoned = 1

/client/proc/IsBanPrisoned(key, address, computer_id)
	if (!key)
		return 0

	if(ckey(key))
		if(!config.ban_legacy_system)
			var/ipquery
			var/cidquery
			if(address)
				ipquery = " OR ip = '[address]' "

			if(computer_id)
				cidquery = " OR computerid = '[computer_id]' "

			var/ckeytext = ckey(key)

			if(!establish_db_connection())
				to_world_log("Ban database connection failure. Player [ckeytext] not checked (ban prison)")
				diary << "Ban database connection failure. Player [ckeytext] not checked (ban prison)"
				return

			var/DBQuery/query = dbcon.NewQuery("SELECT ckey, a_ckey, reason, expiration_time, duration, bantime FROM erro_ban WHERE (ckey = '[ckeytext]' [ipquery] [cidquery]) AND (bantype = 'SOFT_PERMABAN'  OR (bantype = 'SOFT_TEMPBAN' AND expiration_time > Now())) AND isnull(unbanned)")
			query.Execute()

			while(query.NextRow())
				var/pckey = query.item[1]
				var/ackey = query.item[2]
				var/reason = query.item[3]
				var/expiration = query.item[4]
				var/duration = query.item[5]
				var/bantime = query.item[6]
				var/expires

				if(text2num(duration) > 0)
					expires = "��� ��� �� [duration] �����, � �� �������&#255; � [expiration] �� ���������� �������."

				src.banprisoned_reason = "��, ��� ���-�� ������, ��� �����������(�) ��� ��������� ��� ���������� ([pckey]) ���� �������� ���-������� �� �������: [reason]. ���� ��� �����(�) ������������� [ackey], � [bantime]. [expires]\n"
				return 1
			return 0
	else
		return 0

/mob/new_player/proc/new_player_panel_prisoner()
	var/output = "<div align='center'><B>New Player Options</B>"
	output +="<hr>"
	output += "<p><a href='byond://?src=\ref[src];show_preferences=1'>Setup Character</A></p>"

	output += "<p>����� ����������</p>"
	output += "<p>��� � ������</p>"

	if(SSticker && (GAME_STATE > RUNLEVEL_SETUP) && GLOB.prisonwarp)
		output += "<p><a href='byond://?src=\ref[src];spawn_prisoner=1'>Join as Prisoner</A></p>"

	panel = new(src, "Welcome","Welcome to [GLOB.using_map.full_name]", 245, 280, src)
	panel.set_window_options("can_close=0")
	panel.set_content(JOINTEXT(output))
	panel.open()
	return

/mob/new_player/proc/Spawn_Prisoner()
	var/mob/living/carbon/human/character = create_character()	//creates the human and transfers vars and mind

	character.loc = pick(GLOB.prisonwarp)

	setup_and_greet_prisoner(character)
	qdel(src)

/mob/new_player/proc/setup_and_greet_prisoner(mob/living/carbon/human/character)

	character << character.client.banprisoned_reason
	text = {"������������, �� ��������� ����������� � ������ �������� ������.
�� ������ ���� �� �������, ������� ���� ������� ���� ��� ����� � ����.
	"}
	to_chat(character, sanitize_a0(text))
	message_admins("<span class='notice'>[key_name_admin(character)](<A HREF='?_src_=holder;adminmoreinfo=\ref[character]'>?</A>)(<A HREF='?_src_=holder;adminplayerobservefollow=\ref[character]'>FLW</A>) � ���� ��� �����������.</span>")