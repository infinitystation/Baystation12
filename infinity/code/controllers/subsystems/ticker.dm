/datum/controller/subsystem/ticker/proc/update_server()
	end_game_state = END_GAME_AWAITING_UPDATE
	to_world(SPAN_NOTICE("<font size='3'><b>\n=== Сервер уходит на обновление! ===\n=== Он будет недоступен несколько минут. ===\n</b></font>"))

	sleep(10 SECONDS)

	if(end_game_state == END_GAME_AWAITING_UPDATE)
		send2maindiscord("Производится обновление сервера.")
		game_log("SERVER", "Запущено обновление сервера. ")
		shell("update.bat")
