/client/proc/update_server()
	set name = "Update Server"
	set desc="Synchronize with the master branch."
	set category = "Server"

	if(!check_rights(R_SERVER))
		return

	if(!SSticker.server_update)
		switch(alert("Выберите способ.", "Update Server", "В конце раунда", "Принудительно", "Отмена"))
			if("В конце раунда")
				to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Сервер уйдет на обновление в конце раунда!</b><br>Инициировано [key].<br>")))
				game_log("SERVER", "[ckey] подготовил оновление сервера.")
				SSticker.server_update_client = src.key
				SSticker.server_update = TRUE
			if("Принудительно")
				if(alert("Вы уверены что хотите принудительно обновить сервер?\nСервер будет немедленно перезапущен!", "Force Update", "Да", "Отмена" ) == "Отмена")
					return
				to_world(SPAN_NOTICE(FONT_LARGE("<b>\nНачато принудительное обновление сервера! \nПерезапуск через одну минуту (или меньше).</b> \nИнициировано [key]. \n")))
				game_log("SERVER", "[ckey] запустил принудительное обновление сервера. ")
				SSticker.server_update_client = key
				SSticker.ForceUpdate()
	else
		if(alert("Отменить обновление сервера в конце раунда?", "Cancel Update", "Да", "Нет") == "Да")
			to_world(SPAN_NOTICE(FONT_LARGE("<b>\nОбновление сервера в конце раунда было отменено.</b> \n")))
			game_log("SERVER", "[ckey] отменил обновление сервера.")
			SSticker.server_update_client = null
			SSticker.server_update = FALSE
