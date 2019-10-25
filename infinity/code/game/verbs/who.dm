/client/verb/who()
	set name = "Who"
	set category = "OOC"

	var/msg = "<b>Список Игроков:</b>\n"

	var/list/Lines = list()

	var/living = 0
	var/dead = 0
	var/observers = 0
	var/lobby = 0
	var/living_antags = 0
	var/dead_antags = 0

	if(check_rights(R_INVESTIGATE, 0))
		log_admin("[key_name(usr)] checked advanced who in-round.")
		for(var/client/C in GLOB.clients)
			var/entry = "\t[C.key]"
			if(!C.mob) //If mob is null, print error and skip rest of info for client.
				entry += " - <font color='red'><i>HAS NO MOB</i></font>"
				Lines += entry
				continue

			if(isghost(C.mob))
				entry += " - <font color='gray'><b>Наблюдает</b></font> as <b>[C.mob.real_name]</b>"
			else if(isliving(C.mob))
				entry += " - <font color='green'><b>Играет</b></font> as <b>[C.mob.real_name]</b>"

			switch(C.mob.stat)
				if(UNCONSCIOUS)
					entry += " - <font color='#404040'><b>В отключке</b></font>"
					living++
				if(DEAD)
					if(isghost(C.mob))
						var/mob/observer/ghost/O = C.mob
						if(O.started_as_observer)
							observers++
						else
							entry += " - <b>МЕРТВ</b>"
							dead++
					else if(isnewplayer(C.mob))
						entry += " - <font color='#006400'><b>В лобби</b></font>"
						lobby++
					else
						entry += " - <b>МЕРТВ</b>"
						dead++
				else
					living++

			if(isnum(C.player_age))
				var/age = C.player_age

				if(age <= 1)
					age = "<font color='#ff0000'><b>[age]</b></font>"
				else if(age < 10)
					age = "<font color='#ff8c00'><b>[age]</b></font>"

				entry += " - [age]"

			if(is_special_character(C.mob))
				entry += " - <b><font color='red'>Антагонист</font></b>"
				if(!C.mob.mind.current || C.mob.mind.current?.stat == DEAD)
					dead_antags++
				else
					living_antags++

			if(C.is_afk())
				entry += " - <b>АФК: [C.inactivity2text()]</b>"
			entry += " (<A HREF='?_src_=holder;adminmoreinfo=\ref[C.mob]'>?</A>)"
			Lines += entry
	else
		for(var/client/C in GLOB.clients)
			if(!C.is_stealthed())
				var/entry = "[C.key]"
/*				switch(C.mob.stat)
					if(DEAD)
						if(isghost(C.mob))
							var/mob/observer/ghost/O = C.mob
							if(O.started_as_observer)
								entry += " - <font color='gray'><b>Наблюдает</b></font>"
							else
								entry += " - <font color='green'><b>Играет</b></font>"
						else if(isnewplayer(C.mob))
							entry += " - <font color='#006400'><b>В лобби</b></font>"
					else
						entry += " - <font color='green'><b>Играет</b></font>"*/

				if(C.is_afk())
					entry += " - <b>AFK: [C.inactivity2text()]</b>"

				Lines += entry

	for(var/line in sortList(Lines))
		msg += "[line]\n"

	if(check_rights(R_INVESTIGATE, 0))
		msg += "<b><font color='green'>Живых: [living]</font> | Мертвых: [dead] | <font color='gray'>Наблюдателей: [observers]</font> | <font color='#006400'>Лоббистов: [lobby]</font> | <font color='#8100aa'>Живых Антагов: [living_antags]</font> | <font color='#9b0000'>Мертвых Антагов: [dead_antags]</font></b>\n"

	msg += "<b>Всего Игроков: [length(Lines)]</b>"
	to_chat(src, msg)

/client/verb/staffwho()
	set category = "Admin"
	set name = "Staffwho"

	var/list/msg = list()
	var/active_staff = 0
	var/total_staff = 0
	var/can_investigate = check_rights(R_INVESTIGATE, 0)

	for(var/client/C in GLOB.admins)
		var/line = list()
		if(!can_investigate && C.is_stealthed())
			continue
		total_staff++
		if(check_rights(R_ADMIN,0,C))
			line += "\t[C], <b>["\improper[C.holder.rank]"]</b>"
		else
			line += "\t[C], ["\improper[C.holder.rank]"]"
		if(!C.is_afk())
			active_staff++
		if(can_investigate)
			if(C.is_afk())
				line += " (АФК - [C.inactivity2text()])"
			if(isghost(C.mob))
				line += " - Наблюдает"
			else if(istype(C.mob,/mob/new_player))
				line += " - В лобби"
			else
				line += " - Играет"
			if(C.is_stealthed())
				line += " (Стелс)"
			if(C.get_preference_value(/datum/client_preference/show_ooc) == GLOB.PREF_HIDE)
				line += " <font color='#002eb8'><b><s>(OOC)</s></b></font>"
			if(C.get_preference_value(/datum/client_preference/show_looc) == GLOB.PREF_HIDE)
				line += " <font color='#3a9696'><b><s>(LOOC)</s></b></font>"
			if(C.get_preference_value(/datum/client_preference/show_aooc) == GLOB.PREF_HIDE)
				line += " <font color='#960018'><b><s>(AOOC)</s></b></font>"
			if(C.get_preference_value(/datum/client_preference/show_dsay) == GLOB.PREF_HIDE)
				line += " <font color='#530fad'><b><s>(DSAY)</s></b></font>"
		line = jointext(line,null)
		if(check_rights(R_ADMIN,0,C))
			msg.Insert(1, line)
		else
			msg += line

	if(config.admin_irc)
		to_chat(src, "<span class='info'>Ваш запрос на помощь могут увидеть админы в дискорде. Если администрации нет на сервере, всё равно попробуйте написать, возможно вам ответ&#255;т оттуда.</span>")
	to_chat(src, "<b>Сотрудники [active_staff]/[total_staff]:</b>")
	to_chat(src, jointext(msg,"\n"))
