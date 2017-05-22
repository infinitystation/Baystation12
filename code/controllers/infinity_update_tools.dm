/datum/controller/gameticker
	var/update_waiting = 0				//build updating?
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

	var/confirm = alert("Инициировать обновление в конце раунда?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return

	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] инициировал(а) обновление сервера в конце текущего раунда.")
		log_game("[key_name_admin(usr)] инициировал(а) обновление сервера в конце текущего раунда.")
		to_chat(world, "<span class='pm'><span class='howto'><b>~~ Администратор [usr.key] инициировал(а) обновление сервера в конце текущего раунда ~~</b></span></span>\n")
//		to_chat(world, "<span class='adminooc'>Администратор [usr.key] инициировал(а) обновление сервера в конце текущего раунда.</span>")
		ticker.updater_ckey = usr.key
		ticker.update_waiting = 1

/proc/force_update_server()
	if(currentbuild.folder == currentbuild.update)
		to_chat(world, "Ошибка обновлени&#255;. Переключитесь из тестового билда на основной.")
		return

	if(ticker.buildchangechecked)
		to_chat(usr, "Вы не можете обновить сервер так как активированна команда смены билда.")
		return

	to_chat(world, "<span class='adminooc'><FONT size=5>ВНИМАНИЕ! СЕРВЕР ОБНОВЛЯЕТСЯ ЧЕРЕЗ 10 СЕКУНД! СЕРВЕР НЕ БУДЕТ РАБОТАТЬ НЕСКОЛЬКО МИНУТ!</FONT><br>Обновление в конце раунда инициировано администратором [ticker.updater_ckey]</span>.")
	sound_to(world, sound('sound/effects/alarm.ogg', repeat = 0, wait = 0, volume = 100, channel = 1))
	sleep(100)
	shell("sh ../update.sh [currentbuild.dmb_file] [currentbuild.folder] [world.port] [currentbuild.update]")
