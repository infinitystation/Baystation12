/decl/webhook/server_update
	id = WEBHOOK_SERVER_UPDATE

// Data expects a "name" field containing the name of the updaters ckey being announced.
/decl/webhook/server_update/get_message(var/list/data)
	. = ..()
	var/desc = "Производится обновление сервера\n"
	desc += "Сервер может быть недоступен дольше чем обычно"

	.["embeds"] = list(list(
		"title" = "Обновление сервера",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEV
	))
