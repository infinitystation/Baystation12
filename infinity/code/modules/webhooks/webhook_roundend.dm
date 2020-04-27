/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "Смена с режимом **[SSticker.mode ? SSticker.mode.name : "Unknown"]** только что закончилась\n\n"
	if(data)
		var/s_escaped =  "Эвакуированных"
		if(!evacuation_controller.emergency_evacuation)
			s_escaped = "Транспортированных"
		if(data["survivors"] > 0)
			desc += "Выживших: **[data["survivors"]]**\n"
			desc += "[s_escaped]: **[data["escaped"]]**\n"
		else
			desc += "**Никто не пережил эту смену**\n"
		desc += "Призраков: **[data["ghosts"]]**\n"
		desc += "Игроков: **[LAZYLEN(GLOB.clients)]**\n"
		desc += "Продолжительность: **[roundduration2text()]**"

	.["embeds"] = list(list(
		"title" = "Смена под номером [game_id] окончена",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
