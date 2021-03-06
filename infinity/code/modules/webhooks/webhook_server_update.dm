/decl/webhook/server_update
	id = WEBHOOK_SERVER_UPDATE

// Data expects a "name" field containing the name of the updaters ckey being announced.
/decl/webhook/server_update/get_message(var/list/data)
	. = ..()
	var/desc = ""
	if(!data["failure"])
		desc += "Производится обновление сервера\n"
		desc += "Мы пытаемся обновиться не прерывая игру"
	else
		desc += "Обновление не удалось\n"
		desc += "Разработчикам рекомендуется проверить логи"

	.["embeds"] = list(list(
		"title" = "Обновление сервера",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEV
	))
