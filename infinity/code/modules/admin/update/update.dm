/client/proc/update_server()
	set name = "Update Server"
	set desc="Synchronize with the master branch."
	set category = "Server"

	if(!check_rights(R_SERVER))
		return

	if(!SSticker.update_server)
		if(alert("Обновить сервер?", "Run Update", "Да", "Нет") == "Да")
			SSticker.ForceUpdate()
	else
		if(alert("Отменить обновление сервера в конце раунда?", "Cancel Update", "Да", "Нет") == "Да")
			to_world(SPAN_NOTICE(FONT_LARGE("<b>\nОбновление сервера в конце раунда было отменено.</b> \n")))
			game_log("SERVER", "[ckey] отменил обновление сервера.")
			SSticker.update_server = null
