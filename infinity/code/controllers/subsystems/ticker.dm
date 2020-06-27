/datum/controller/subsystem/ticker/proc/update_server()
	end_game_state = END_GAME_AWAITING_UPDATE
	to_world(SPAN_NOTICE(FONT_LARGE("<b>\n Сервер уходит на обновление!\n Запуск через одну минуту (или меньше). \n</b>")))

	sleep(10 SECONDS)

	if(end_game_state == END_GAME_AWAITING_UPDATE)
		send2mainirc("Производится обновление сервера.")
		updater && istype(updater) ? send2admindiscord("\n Происходит обновление. Инициировано [updater.ckey].") : null
		SSwebhooks.send(WEBHOOK_SERVER_UPDATE)
		game_log("SERVER", "Запущено обновление сервера. ")
		shell("sh ./update_start.sh")

/datum/controller/subsystem/ticker/proc/update_map(New_Map)
	if(shell("update_map.bat") == 0)
		send2mainirc("Следующей картой будет - [New_Map]!")
		log_and_message_admins("Компилирование карты завершено. Следующей картой будет - [New_Map].")
	else
		scheduled_map_change = 1
		log_and_message_admins("Ошибка в компилировании карты! Возпроизведение резервного обновлениЯ в конце раунда! Доложить об ошибке разработчикам!")

	if(GAME_STATE == RUNLEVEL_POSTGAME)
		end_game_state = END_GAME_READY_TO_END
