/datum/controller/subsystem/ticker/proc/update_server()
	end_game_state = END_GAME_AWAITING_UPDATE
	to_world(SPAN_NOTICE("<font size='3'><b>\n=== Сервер уходит на обновление! ===\n=== Он будет недоступен примерно одну минуту. ===\n</b></span>"))

	sleep(10 SECONDS)

	if(end_game_state == END_GAME_AWAITING_UPDATE)
		send2maindiscord("Производится обновление сервера.")
		game_log("SERVER", "Запущено обновление сервера. ")
		shell("update.bat")
