/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "Смена с режимом **[SSticker.mode ? SSticker.mode.name : "Unknown"]** только что закончилась\n\n"
	if(data)

		if(data["survivors"] > 0)

			var/s_was =      "Остался"
			var/s_survivor = "выживший"
			var/s_escaped =  "Эвакуировалось"

			if(data["survivors"] != 1)
				s_was = "Осталось"
				s_survivor = "выживших"

			if(!evacuation_controller.emergency_evacuation)
				s_escaped = "Транспортировано"

			desc += "[s_was] [data["survivors"]]: **[s_survivor]**\n"
			desc += "[s_escaped]: **[data["escaped"]]**\n"
		else
			desc += "**Никто не пережил эту смену**\n"
		desc += "Призраков: [data["ghosts"]]"

	.["embeds"] = list(list(
		"title" = "Смена под номером [game_id] окончена",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
