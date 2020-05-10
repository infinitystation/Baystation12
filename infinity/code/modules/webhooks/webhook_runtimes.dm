/decl/webhook/send_runtime
	id = WEBHOOK_SEND_RUNTIME

/decl/webhook/send_runtime/get_message(var/list/data)
	. = ..()

	if(!data?.len || !data["main_desc"])
		.["content"] = "Тут должно быть сообщение о рантайме, но что-то пошло не так."
	else
		.["embeds"] = list("color" = COLOR_WEBHOOK_RUNTIME, "timestamp" = time2text(world.timeofday, "hh:mm:ss/DD:MM:YYYY"),
			"title" = "Произошла ошибка во время исполнения вашей Мечты.",
			"description" = DiscordSanitize(data["main_desc"]),//"Runtime Error in [data["file"]]. At the line[data["line"]].",
			"fields" = list(
/*				list(
					"name" = "Runtime Error:",
					"value" = DiscordSanitize(data["msg"]),
				),
				list(
					"name" = "In File:",
					"value" = DiscordSanitize(data["file"]),
					"inline" = 1
				),
				list(
					"name" = "At Line:",
					"value" = DiscordSanitize(data["line"]),
					"inline" = 1
				),
*/
				data["additional_desc"] ? list("name" = "Additional Data:", "value" = "```[DiscordSanitize(data["additional_desc"])]```") : null
			)
		)
