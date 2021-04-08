/decl/webhook/server_update
	id = WEBHOOK_SERVER_UPDATE

// Data expects a "name" field containing the name of the updaters ckey being announced.
/decl/webhook/server_update/get_message(var/list/data)
	. = ..()
	var/desc = ""
	var/color = COLOR_WEBHOOK_DEV
	if(!data)
		.["content"] = "Тут должно быть сообщение об обновлении, но кто то вызвал вебхук вручную."
		return
	if(!data["status"])
		.["content"] = "Статус обновления не найден!"
		return
	else if(data["status"] == "requested")
		var/ckey = data["ckey"]
		desc += "[ckey ? "**[ckey]** запросил" : "Запрошено"] обновление сервера\n"
		desc += "Мы пытаемся обновиться не прерывая игру"
	else if(data["status"] == "failure")
		desc += "Обновление не удалось\n"
		desc += "Разработчикам рекомендуется проверить логи"
		color = COLOR_WEBHOOK_BAN
	else if(data["status"] == "reboot")
		desc += "Производится обновление сервера\n"
		desc += "Сервер может быть недоступен дольше чем обычно"
		var/ckey = data["ckey"]
		if(ckey)
			desc += "\n\nДосрочный рестарт подтвержден **[ckey]**"
			color = COLOR_WEBHOOK_BAN
	else if(data["status"] == "canceled")
		var/ckey = data["ckey"]
		desc += "Обновление в конце раунда отменено[ckey ? " **[ckey]**" : ""]."
		color = COLOR_WEBHOOK_XENO
	else if(data["status"] == "delay")
		desc += "Обновление отложено на конец раунда"
		color = COLOR_WEBHOOK_XENO
	else if(data["status"] == "success")
		desc += "Обновление прошло успешно\n"
		desc += "Изменения вступают в силу со следующего раунда"
		color = COLOR_WEBHOOK_SUCCESS
	else
		.["content"] = "Неизвестный статус обновления!"
		return

	.["embeds"] = list(list(
		"title" = "Обновление сервера",
		"description" = desc,
		"color" = color
	))
