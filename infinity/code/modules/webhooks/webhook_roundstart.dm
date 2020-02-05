/decl/webhook/roundstart/get_message(var/list/data)
	. = ..()
	var/desc = "Начало новой смены"
	if(data && data["gamemode"])
		desc += " c режимом [data["gamemode"]]"
	if(data && data["players"])
		desc += "; Количество игроков: [data["players"]]"
//	desc += "."

	.["embeds"] = list(list(
		"title" = "Смена началась",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
