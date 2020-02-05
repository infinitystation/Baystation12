/decl/webhook/server_start
	id = WEBHOOK_SERVER_START

// Data expects a "url" field pointing to the current hosted server and port to connect on.
/decl/webhook/server_start/get_message(var/list/data)
	. = ..()
	var/desc = "Новая смена скоро начнётся"
	if(data)
		if(data["map"]) desc += " на объекте [data["map"]]"
		if(data["url"]) desc += " по адресу [data["url"]]"
//	desc += "."

	.["embeds"] = list(list(
		"title" = "Сервер запущен",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
