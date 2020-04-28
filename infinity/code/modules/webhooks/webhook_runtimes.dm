/decl/webhook/send_runtime
	id = WEBHOOK_SEND_RUNTIME

/decl/webhook/send_runtime/get_message(var/list/data)
	. = ..()

	if(!data?.len || !data["file"])
		.["content"] = "Тут должно быть сообщение о рантайме, но что-то не так."
	else
		.["embeds"] = list(
			"color" = COLOR_WEBHOOK_RUNTIME,
			"fields" = list(
				list(
					"name" = "File",
					"value" =  data["file"]
				),
				list(
					"name" = "MSG",
					"value" = data["msg"],
					"inline" = 1
				),
				list(
					"name" = "line",
					"value" = data["line"],
					"inline" = 1
				)
			)
		)
