/decl/webhook/roundstart/get_message(var/list/data)
	. = ..()
	var/desc = "Режим: [SSticker.master_mode]\n"
	desc += "Количество игроков: [LAZYLEN(GLOB.player_list)]"
	.["embeds"] = list(list(
		"title" = "Смена началась",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
