/datum/controller/gameticker
	var/update_waiting = 0				//build updating?
	var/updater_ckey = ""				//who updating build?

/client/proc/update_server()
	set category = "Server"
	set name = "Update Server"
	if (!usr.client.holder)
		return
	if(currentbuild.folder == currentbuild.update)
		usr << "Ошибка. Переключите билд на основной"
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
	if (!usr.client.holder)
		return
	if(currentbuild.folder == currentbuild.update)
		usr << "Ошибка. Переключите билд на основной"
		return
	var/confirm = alert("Инициировать обновление в конце раунда?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return
	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] инициировал(а) обновление сервера в конце текущего раунда.")
		log_game("[key_name_admin(usr)] инициировал(а) обновление сервера в конце текущего раунда.")
		world << "<span class='adminooc'>Администратор [usr.key] инициировал(а) обновление сервера в конце текущего раунда.</span>"
		ticker.updater_ckey = usr.key
		ticker.update_waiting = 1

/proc/force_update_server()
	if(currentbuild.folder == currentbuild.update)
		world << "Ошибка обновлени&#255;. Переключитесь из тестового билда на основной."
		return
	world << "<span class='adminooc'><FONT size=5>ВНИМАНИЕ! СЕРВЕР ОБНОВЛЯЕТСЯ ЧЕРЕЗ 10 СЕКУНД! СЕРВЕР НЕ БУДЕТ РАБОТАТЬ НЕСКОЛЬКО МИНУТ!</FONT><br>Обновление в конце раунда инициировано администратором [ticker.updater_ckey]</span>."
	playsound_global('sound/effects/alarm.ogg', repeat=0, channel=1, volume=100)
	sleep(100)
	shell("sh ../update.sh [currentbuild.dmb_file] [currentbuild.folder] [world.port] [currentbuild.update]")

/proc/playsound_global(file, repeat=0, wait, channel, volume)
	for(var/V in clients)
		V << sound(file, repeat, wait, channel, volume)