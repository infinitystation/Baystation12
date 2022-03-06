/proc/to_world_ban(var/bantype = null, var/setter = "", var/banned = "", var/reason = "", var/duration = null, var/banned_jobs)
	if(isnull(bantype)) return

	reason = sql_sanitize_text(reason)
//	reason = sanitize_a0(reason)
//	Разбан юзера идет через bantype = "UNBAN" изменеие = bantype = "EDIT" мы не выводим это на сервере, но отправляем весточку вебхуком
	SSwebhooks.send(WEBHOOK_SEND_BAN, list("bantype" = bantype, "setter" = setter, "banned" = banned, "reason" = reason, "duration" = duration, "banned_jobs" = banned_jobs))
	switch(bantype)
		if(BANTYPE_PERMA)
			send2adminlogirc("BAN: Администратор [setter] перманентно заблокировал(а) игрока [banned]. Причина: \"[reason]\"")
		if(BANTYPE_TEMP)
			send2adminlogirc("BAN: Администратор [setter] временно заблокировал(а) игрока [banned]. Причина: \"[reason]\"; Срок - [duration] минут.")
		if(BANTYPE_JOB_PERMA)
			send2adminlogirc("Администратор [setter] перманентно заблокировал(а) роли ([banned_jobs]) игроку [banned]. Причина: \"[reason]\"")
		if(BANTYPE_JOB_TEMP)
			send2adminlogirc("Администратор [setter] временно заблокировал(а) роли ([banned_jobs]) игроку [banned]. Причина: \"[reason]\"; Срок - [duration] минут.")
