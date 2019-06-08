/datum/controller/subsystem/ticker/proc/update_server()
	end_game_state = END_GAME_AWAITING_UPDATE
	to_world(SPAN_NOTICE("<font size='3'><b>\n=== Сервер уходит на обновление! ===\n=== Он будет недоступен несколько минут. ===\n</b></font>"))

	sleep(10 SECONDS)

	if(end_game_state == END_GAME_AWAITING_UPDATE)
		send2mainirc("Производится обновление сервера.")
		game_log("SERVER", "Запущено обновление сервера. ")
		shell("update.bat")

/datum/controller/subsystem/ticker/proc/update_map(New_Map)
	if(shell("update_map.bat") == 0)
		send2mainirc("Следующей картой будет - [New_Map]!")
		log_and_message_admins("Компилирование карты завершено. Следующей картой будет - [New_Map].")
	else
		scheduled_map_change = 1
		log_and_message_admins("Ошибка в компилировании карты! Возпроизведение резервного обновлениЯ в конце раунда! Доложить об ошибке разработчикам!")

	if(GAME_STATE == RUNLEVEL_POSTGAME)
		end_game_state = END_GAME_AWAITING_TICKETS
