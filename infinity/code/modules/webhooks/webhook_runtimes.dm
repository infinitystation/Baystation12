/decl/webhook/send_runtime
	id = WEBHOOK_SEND_RUNTIME

/decl/webhook/send_runtime/get_message(var/list/data)
	. = ..()

	if(!data?.len || !data["main_desc"])
		.["content"] = "Тут должно быть сообщение о рантайме, но что-то пошло не так."
	else
		var/runtime_desc = list(
			"color" = COLOR_WEBHOOK_RUNTIME,
			"footer" = list("text" = time2text(world.timeofday, "hh:mm:ss/DD:MM:YYYY")),
			"title" = "Произошла ошибка во время исполнения вашей Мечты.",
			"description" = DiscordSanitize(data["main_desc"]),
		)
		if(data["additional_desc"])
			runtime_desc["fields"] = list(list("name" = "Additional Data:", "value" = "```c\n[data["additional_desc"]]```"))
		.["embeds"] = list(runtime_desc)
