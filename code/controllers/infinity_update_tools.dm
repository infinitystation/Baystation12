/datum/controller/gameticker
	var/update_waiting = FALSE			//build updating?
	var/updater_ckey = ""				//who updating build?

/client/proc/update_server()
	set category = "Server"
	set name = "Update Server"

	if (!usr.client.holder)
		return

	if(currentbuild.folder == currentbuild.update)
		to_chat(usr, "Ошибка. Переключите билд на основной")
		return

	if(ticker.buildchangechecked)
		to_chat(usr, "Вы не можете обновить сервер так как активированна команда смены билда.")
		return

	var/confirm = alert("End the round and update server?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return

	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] запустил(а) обновление сервера.")
		log_game("[key_name_admin(usr)] запустил(а) обновление сервера.")
		if(!ticker.updater_ckey)
			ticker.updater_ckey = usr.key
		force_update_server()

/client/proc/update_server_round_end()
	set category = "Server"
	set name = "Update Server at Round End"

	if(!usr.client.holder)
		return

	if(currentbuild.folder == currentbuild.update)
		to_chat(usr, "Ошибка. Переключите билд на основной.")
		return

	if(ticker.buildchangechecked)
		to_chat(usr, "Вы не можете обновить сервер так как активированна команда смены билда.")
		return

	var/confirm = alert("Инициировать обновление в конце раунда? Текущий статус: обновление [ticker.update_waiting ? "" : "не"] запланировано.", "End Round", "Trigger End round Update", "Cancel Update", "Exit")
	if(confirm == "Trigger End round Update")
		if(ticker.update_waiting)
			if(alert("Внимание! Обновление в  конце раунда уже было запланировано сотрудником [ticker.updater_ckey], в случае продолжения ticker.updater_ckey будет перезаписан на Ваш псевдоним. Вы уверены?", "Да", "Нет") == "Нет")
				return
		ticker.update_waiting = TRUE
		ticker.updater_ckey = usr.key
		message_admins("[key_name_admin(usr)] инициировал(а) обновление сервера в конце текущего раунда.")
		log_game("[key_name_admin(usr)] запланировал(а) обновление сервера в конце текущего раунда.")
		return

	else if(confirm == "Cancel Update")
		ticker.update_waiting = FALSE
		ticker.updater_ckey = ""
		message_admins("[key_name_admin(usr)] отменил(а) обновление сервера в конце текущего раунда.")
		log_game("[key_name_admin(usr)] отменил(а) обновление сервера в конце текущего раунда.")
		return
	else
		return

/proc/force_update_server()
	if(currentbuild.folder == currentbuild.update)
		to_chat(world, "Ошибка обновлени&#255;. Переключитесь из тестового билда на основной.")
		return

	if(ticker.buildchangechecked)
		to_chat(usr, "Вы не можете обновить сервер так как активированна команда смены билда.")
		return

	to_chat(world, "<span class='adminooc'><font size=5>ВНИМАНИЕ! СЕРВЕР ОБНОВЛЯЕТСЯ ЧЕРЕЗ 10 СЕКУНД! СЕРВЕР НЕ БУДЕТ РАБОТАТЬ НЕСКОЛЬКО МИНУТ!</font><br>Обновление [ticker.update_waiting ? "в конце раунда запланировано" : "запущено"] сотрудником [ticker.updater_ckey]</span>.")
	sound_to(world, sound('sound/effects/alarm.ogg', repeat = 0, wait = 0, volume = 100, channel = 1))
	sleep(100)
	shell("sudo sh ../update.sh [currentbuild.dmb_file] [currentbuild.folder] [world.port] [currentbuild.update]")
