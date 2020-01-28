/proc/to_world_ban(var/bantype = null, var/setter = "", var/banned = "", var/reason = "", var/duration = null)
	if(isnull(bantype)) return

	var/reason_public = reason
	reason = sql_sanitize_text(reason)
//	reason = sanitize_a0(reason)

	switch(bantype)
		if(BANTYPE_PERMA)
			to_world(SPAN_NOTICE("<b>BAN: Администратор [setter] ЖЕСТКО и НАВСЕГДА заблокировал(а) игрока [banned]. Причина: \"[reason_public]\"</b>"))
			send2adminlogirc("BAN: Администратор [setter] ЖЕСТКО и НАВСЕГДА заблокировал(а) игрока [banned]. Причина: \"[reason]\"")
		if(BANTYPE_TEMP)
			to_world(SPAN_NOTICE("<b>BAN: Администратор [setter] ЖЕСТКО заблокировал(а) игрока [banned]. Причина: \"[reason_public]\"; Срок - [duration] минут.</b>"))
			send2adminlogirc("BAN: Администратор [setter] ЖЕСТКО заблокировал(а) игрока [banned]. Причина: \"[reason]\"; Срок - [duration] минут.")
		if(BANTYPE_SOFTPERMA)
			to_world(SPAN_NOTICE("<b>BAN: Администратор [setter] перманентно(а) отправил игрока [banned] в бан-тюрьму. Причина: \"[reason_public]\"</b>"))
			send2adminlogirc("BAN: Администратор [setter] перманентно отправил(а) игрока [banned] в бан-тюрьму. Причина: \"[reason]\"")
		if(BANTYPE_SOFTBAN)
			to_world(SPAN_NOTICE("<b>BAN: Администратор [setter] временно(а) отправил игрока [banned] в бан-тюрьму. Причина: \"[reason_public]\"; Срок - [duration] минут.</b>"))
			send2adminlogirc("BAN: Администратор [setter] временно отправил(а) игрока [banned] в бан-тюрьму. Причина: \"[reason]\"; Срок - [duration] минут.")
/*
		if(BANTYPE_JOB_PERMA)
			to_world(SPAN_NOTICE("<b>JOB-BAN: Администратор [setter] перманентно заблокировал(а) роли ([msg]) игроку [banned]. Причина: \"[reason_public]\"</b>"))
			send2adminlogirc("Администратор [setter] перманентно заблокировал(а) роли ([msg]) игроку [banned]. Причина: \"[reason]\"")
		if(BANTYPE_JOB_TEMP)
			to_world(SPAN_NOTICE("<b>JOB-BAN: Администратор [setter] временно заблокировал(а) роли ([msg]) игроку [banned]. Причина: \"[reason_public]\"; Срок - [duration] минут.</b>"))
			send2adminlogirc("Администратор [setter] временно заблокировал(а) роли ([msg]) игроку [banned]. Причина: \"[reason]\"; Срок - [duration] минут.")*/
