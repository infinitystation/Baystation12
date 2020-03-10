/client/proc/update_server()
	set name = "Update Server"
	set desc="Synchronize with the master branch."
	set category = "Server"
	if(!check_rights(R_SERVER))
		return
	if(!SSticker.update_server)
		switch(alert("Выберите способ.", "Update Server", "В конце раунда", "Принудительно", "Отмена"))
			if("В конце раунда")
				to_world(SPAN_NOTICE("<font size='3'><b>\n=== Сервер уйдет на обновление в конце раунда! ===\n=== Обновление инициализировано игроком [src]. ===\n</b></font>"))
				game_log("SERVER", "[key_name(src)] подготовил обновление сервера. ")
				SSticker.update_server = 1
				SSticker.updater = src
			if("Принудительно")
				if(alert("Вы уверены что хотите принудительно обновить сервер?\nСервер будет немедленно перезапущен!", "Force Update", "Да", "Отмена") == "Отмена")
					return

				to_world(SPAN_NOTICE("<font size='3'><b>\n=== Принудительное обновление сервера было запущено игроком [src]! ===\n=== Сервер будет обновлен и доступен через несколько минут. ===\n</b></font>"))
				game_log("SERVER", "[key_name(src)] запустил принудительное обновление сервера. ")
				spawn(5 SECONDS)
					send2mainirc("Производится обновление сервера.")
					send2admindiscord("Происходит обновление. Инициировано [ckey].")
					SSwebhooks.send(WEBHOOK_SERVER_UPDATE)
					shell("sh update_start.sh")
	else
		if(alert("Отменить обновление сервера в конце раунда?", "Cancel Update", "Да", "Нет") == "Да")
			to_world(SPAN_NOTICE("<font size='3'><b>\n=== Обновление сервера в конце раунда было отменено игроком [src]. ===\n</b></font>"))
			game_log("SERVER", "[key_name(src)] отменил обновление сервера.")
			SSticker.update_server = 0
			SSticker.updater = null