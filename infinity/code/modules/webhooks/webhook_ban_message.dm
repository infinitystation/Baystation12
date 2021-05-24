/decl/webhook/send_ban
	id = WEBHOOK_SEND_BAN

/proc/minutesTOdays(var/minutes, var/delimeter = "-")
	minutes = text2num(minutes)
	if(istext(minutes))
		return minutes
	var/mins = minutes % 60
	minutes = (minutes-mins) / 60
	if(minutes == 0)
		return "0[delimeter]0[delimeter][mins]"
	var/hours = minutes % 24
	minutes = (minutes-hours) / 24
	if(minutes == 0)
		return "0[delimeter][hours][delimeter][mins]"
	return "[minutes][delimeter][hours][delimeter][mins]"

/proc/DDHHMMtoText(var/line, var/delimeter = "-")
	var/list/date = splittext(line, delimeter)
	var/output = ""

	for(var/time in 1 to 3)
		date[time] = text2num(date[time])
		if(date[time] && date[time] != 0)
			var/ending
			switch(time)
				if(3)
					if(((date[time] % 100) != 11) && ((date[time] % 10) == 1))	ending = "Минута"
					else if(!((date[time] % 100) in list(12,13,14)) && ((date[time] % 10) in list(2,3,4)))	ending = "Минуты"
					else ending = "Минут"
				if(2)
					if(((date[time] % 100) != 11) && ((date[time] % 10) == 1))	ending = "Час"
					else if(!((date[time] % 100) in list(12,13,14)) && ((date[time] % 10) in list(2,3,4)))	ending = "Часа"
					else ending = "Часов"
				if(1)
					if(((date[time] % 100) != 11) && ((date[time] % 10) == 1))	ending = "День"
					else if(!((date[time] % 100) in list(12,13,14)) && ((date[time] % 10) in list(2,3,4)))	ending = "Дня"
					else ending = "Дней"
			output += "[length(output) ? ", " : ""][date[time]] [ending]"
	return output

/decl/webhook/send_ban/get_message(var/list/data)
	. = ..()

	if(!length(data) || !data["bantype"])
		.["content"] = "Тут должно быть сообщение о бане, но кто то вызвал вебхук вручную."
		return
	//	Дискорд не допускает пустых строк в эмбеде, и удаляет его, по этому лучше уж [ДАННЫЕ УДАЛЕНЫ] ~Laxesh
	if(!data["setter"])		data["setter"] = "ДАННЫЕ УДАЛЕНЫ"
	if(!data["banned"])		data["banned"] = "ДАННЫЕ УДАЛЕНЫ"
	if(!data["reason"])		data["reason"] = "ДАННЫЕ УДАЛЕНЫ"
	var/setter = list(
		"name" = "Администратор",
		"value" = data["setter"],
		"inline" = 1
	)
	var/banned = list(
		"name" = "Забанен",
		"value" = data["banned"],
		"inline" = 1
	)
	var/reason = list(
		"name" = "Причина",
		"value" = data["reason"]
	)
	var/list/desc = list(
		"color" = COLOR_WEBHOOK_BAN,
		"footer" = list(
			"icon_url" = "https://cdn.discordapp.com/emojis/244791612268347392.png",	// :inf: emoji
			"text" = "За обжалованием обращаться в #подача_заявок"
		),
		"thumbnail" = list(
			"url" = "https://cdn.discordapp.com/emojis/314350489020137474.png"			// :ban: emoji
		)
	)
	switch(data["bantype"])
		if(BANTYPE_PERMA)
			desc.Add(list(
				"title" = "ПЕРМАНЕНТНАЯ БЛОКИРОВКА",
				"description" = "Пользователь был забанен навсегда",
				"fields" = list(
					banned, setter, reason
				)
			))
		if(BANTYPE_TEMP)
			if(!data["duration"])		data["duration"] = "ДАННЫЕ УДАЛЕНЫ"
			var/duration = list(
				"name" = "Длительность",
				"value" = DDHHMMtoText(minutesTOdays(data["duration"]))
			)
			desc.Add(list(
				"title" = "ВРЕМЕННАЯ БЛОКИРОВКА",
				"description" = "Пользователь был забанен на время",
				"fields" = list(
					banned, setter, duration, reason
				)
			))
		if(BANTYPE_JOB_PERMA)
			if(!data["banned_jobs"])		data["banned_jobs"] = "ДАННЫЕ УДАЛЕНЫ"
			var/banned_jobs = list(
				"name" = "Заблокированные профессии",
				"value" = data["banned_jobs"],
				"inline" = 1
			)
			desc.Add(list(
				"title" = "ПЕРМАНЕНТНАЯ БЛОКИРОВКА ПРОФЕССИЙ",
				"description" = "Пользователь навсегда потерял эти роли",
				"fields" = list(
					banned, setter, banned_jobs, reason
				)
			))
		if(BANTYPE_JOB_TEMP)
			if(!data["duration"])		data["duration"] = "ДАННЫЕ УДАЛЕНЫ"
			var/duration = list(
				"name" = "Длительность",
				"value" = DDHHMMtoText(minutesTOdays(data["duration"])),
				"inline" = 1
			)
			if(!data["banned_jobs"])		data["banned_jobs"] = "ДАННЫЕ УДАЛЕНЫ"
			var/banned_jobs = list(
				"name" = "Заблокированные профессии",
				"value" = data["banned_jobs"],
				"inline" = 1
			)
			desc.Add(list(
				"title" = "ВРЕМЕННАЯ БЛОКИРОВКА ПРОФЕССИЙ",
				"description" = "Пользователь потерял эти роли на время",
				"fields" = list(
					banned, setter, duration, banned_jobs, reason
				)
			))
		if("UNBAN")
			desc["color"] = COLOR_WEBHOOK_SUCCESS
			banned["name"] = "Разбанен"
			var/jobs = data["banned_jobs"]
			if(jobs && (jobs != ""))
				var/banned_jobs = list(
					"name" = "Разблокированные профессии",
					"value" = data["banned_jobs"]
				)
				desc.Add(list(
					"title" = "СНЯТИЕ БАНА",
					"description" = "Пользователь был разбанен",
					"fields" = list(
						banned, setter, banned_jobs
					)
				))
			else
				desc.Add(list(
					"title" = "СНЯТИЕ БАНА",
					"description" = "Пользователь был разбанен",
					"fields" = list(
						banned, setter
					)
				))
		if("EDIT")
			desc["color"] = COLOR_WEBHOOK_XENO
			banned["name"] = "Цель редактирования"
			if(data["duration"])
				var/list/dur = splittext(data["duration"], " - ")
				var/from = DDHHMMtoText(minutesTOdays(dur[1]))
				var/notfrom = DDHHMMtoText(minutesTOdays(dur[2]))
				var/oldduration = list(
					"name" = "Старая длительность",
					"value" = "[from]"
				)
				var/duration = list(
					"name" = "Новая длительность",
					"value" = "[notfrom]",
					"inline" = 1
				)
				desc.Add(list(
					"title" = "РЕДАКТИРОВАНИЕ БАНА",
					"description" = "Изменена продолжительность бана",
					"fields" = list(
						banned, setter, oldduration, duration
					)
				))
			else if(data["reason"] != "ДАННЫЕ УДАЛЕНЫ")
				var/list/reas = splittext(data["reason"], "@#*$#@")
				if(length(reas) != 2)
					.["content"] = "Спецсимволы в измененном банризоне. Зачем?"
					return
				var/oldreason = list(
					"name" = "Старая причина",
					"value" = reas[1]
				)
				reason["name"] = "Новая причина"
				reason["value"] = reas[2]
				desc.Add(list(
					"title" = "РЕДАКТИРОВАНИЕ БАНА",
					"description" = "Изменена причина бана",
					"fields" = list(
						banned, setter, oldreason, reason
					)
				))
		else
			.["content"] = "Неопознаный тип бана. Администрация, что вы за люди такие?"
			return
	.["embeds"] = list(desc)
