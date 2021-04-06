#define UPD_LOG_FILE	"update_log.out"	// Log file for shell() output
#define UPD_EXE_FILE	"updater"			// Without .sh or .bat
#define UPSTREAM_PREFIX	""					// To find or create remotes

/datum/controller/subsystem/ticker
	var/RunExe = ""				// Command to run exe file
	var/update_server			// Who requested update (if we delay it to round end)
	var/updating = FALSE		// DO NOT SPAM WITH UPDATE!!!
	var/respawn_cooldown = 0	// Unknown (for me) variable ~Laxesh

// Possible exit codes: null forbidden, 0 success, 1 error, 2 error but try to reboot after round, 3 rebooting (nothing can do after this point)
/datum/controller/subsystem/ticker/proc/ForceUpdate(var/branch, var/user = usr)
	if(user && !check_rights(R_SERVER, 1, user))	// No manual call please (if you have not enough access)
		return

	if(updating)
		to_chat(user, SPAN_WARNING(FONT_LARGE("Обновлялка уже занята. Не выключайте консоль если видите этот значок.")))
		return

	if(update_server)
		if(user)
			if(alert("Подтвердите перезапуск сервера для обновления", "Reboot for update?", "Да", "Нет") != "Да")
				to_chat(user, SPAN_WARNING("Используй 'Server' --> 'Update Server' чтобы отменить обновление в конце раунда."))
				return 1
		game_log("SERVER", "[user ? "[get_key(user)]" : "СЕРВЕР"] подтвердил рестарт сервера для обновлений от [update_server]")
		SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "reboot", "ckey" = get_key(user)))
		shell(RunExe)
		return 3

	if(!fexists(UPD_LOG_FILE))
		message_staff("UPDATER: no log file found. Creating a new one: [UPD_LOG_FILE]")
		text2file("", UPD_LOG_FILE)
	if(!(world.system_type in list(UNIX, MS_WINDOWS)))
		message_staff("## ERROR: What? What system your host using? What [world.system_type] is? Message it to your devs, this feature is not supported for this OS.")
		CRASH("Error, trying to update server using unknown OS([world.system_type]).")

	updating = TRUE

	send2mainirc("Производится обновление сервера.")
	send2admindiscord("Происходит обновление.[update_server ? " Инициировано [update_server]." : ""]")
	SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "requested", "ckey" = get_key(user)))

	game_log("SERVER", "[get_key(user)] начал обновление сервера.[branch ? " На ветку '[branch]'" : ""]")
	to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Сервер начинает обновление!</b>")))
	to_world(SPAN_NOTICE(FONT_LARGE("<br>Оно было инцировано [get_key(user)]")))

	var/exeEND = ".txt"				// .sh or .bat
	var/DMpref = "dm"				// DreamMaker for Unix
	var/upd_log						// We using it to get feedback from executing commands
	var/command = ""				// Current command for exe file
	var/DMB_NAME = "baystation12"	// If null using [initial(world.name)].dmb for compile cmd \ otherwise - [DMB_NAME].dmb
	var/Try_Compile_Between_Rounds_If_Fails = FALSE
	var/Between_Rounds_Compile_Code

	switch(world.system_type)
		if(UNIX)
			RunExe = "sh [UPD_EXE_FILE].sh"
			exeEND = ".sh"
			DMpref = "DreamMaker"
			Between_Rounds_Compile_Code = {"
				killall DreamDaemon;
				DreamMaker [DMB_NAME ? "[DMB_NAME]" : "[initial(world.name)]"].dme;
				sudo nohup nice -n -20 DreamDaemon [DMB_NAME ? "[DMB_NAME]" : "[initial(world.name)]"].dmb [world.port] -trusted -logself -public &
			"}
		if(MS_WINDOWS)
			RunExe = "[UPD_EXE_FILE].bat"
			exeEND = ".bat"
			Between_Rounds_Compile_Code = {"
				taskkill /f /im DreamDaemon.exe
				dm [DMB_NAME ? "[DMB_NAME]" : "[initial(world.name)]"].dme
				dreamdaemon [DMB_NAME ? "[DMB_NAME]" : "[initial(world.name)]"].dmb [world.port] -trusted -logself -public
			"}
		else
			message_staff("UPDATER: Non supported OS '[world.system_type]'. Unable to UPD.")
			to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Обновление отменено из-за ошибки.</b>")))
			SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "failure"))
			game_log("SERVER", "Обновление неудачно.")
			return
	if(fexists("[UPD_EXE_FILE][exeEND]"))
		fdel("[UPD_EXE_FILE][exeEND]")

	// Branch change requested
	if(branch)
		branch = sanitize(branch)				// No shell() injections please
		branch = replacetext(branch, "\n", "")	// Double check
		branch = replacetext(branch, " ", "")	// Triple check
		branch = replacetext(branch, ";", "")	// More checks
		if(!branch)
			message_staff("UPDATER: incorrect branch entered. It's name was deleted by sanitize.")
			to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Обновление отменено из-за ошибки.</b>")))
			SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "failure"))
			game_log("SERVER", "Обновление неудачно.")
			updating = FALSE
			return 1

		message_staff("UPDATER: branch '[branch]' entered. Checking out that branch")

		command = "git fetch"
		text2file(command, "[UPD_EXE_FILE][exeEND]")
		if(shell("[RunExe] > [UPD_LOG_FILE]") != 0)
			upd_log = file2text(UPD_LOG_FILE)
			message_staff("UPDATER: git fetch failure. Command was '[command]'. Error message:\n[upd_log]")
			to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Обновление отменено из-за ошибки.</b>")))
			SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "failure"))
			fdel("[UPD_EXE_FILE][exeEND]")
			game_log("SERVER", "Обновление неудачно.")
			updating = FALSE
			return 1
		message_staff("UPDATER: '[command]' success")
		fdel("[UPD_EXE_FILE][exeEND]")

		command = "git checkout [UPSTREAM_PREFIX][branch]"
		var/checkNewBranch = FALSE
		text2file(command, "[UPD_EXE_FILE][exeEND]")
		while(shell("[RunExe] > [UPD_LOG_FILE]") != 0)
			upd_log = file2text(UPD_LOG_FILE)
			message_staff("UPDATER: git checkout failure [checkNewBranch ? "#2" : "#1"]. Command was '[command]'. Error message:\n[upd_log]")
			if(!checkNewBranch)
				message_staff("UPDATER: Setting up remote branch...")
				fdel("[UPD_EXE_FILE][exeEND]")
				command = "git branch [UPSTREAM_PREFIX][branch] -t origin/[branch]"
				text2file(command, "[UPD_EXE_FILE][exeEND]")
				checkNewBranch = TRUE
				if(shell("[RunExe] > [UPD_LOG_FILE]") != 0)
					upd_log = file2text(UPD_LOG_FILE)
					message_staff("UPDATER: git branch failure. Command was '[command]'. Error message:\n[upd_log]")
					to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Обновление отменено из-за ошибки.</b>")))
					SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "failure"))
					fdel("[UPD_EXE_FILE][exeEND]")
					game_log("SERVER", "Обновление неудачно.")
					updating = FALSE
					return 1
				fdel("[UPD_EXE_FILE][exeEND]")
				command = "git checkout [UPSTREAM_PREFIX][branch]"
				text2file(command, "[UPD_EXE_FILE][exeEND]")
			else
				to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Обновление отменено из-за ошибки.</b>")))
				SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "failure"))
				fdel("[UPD_EXE_FILE][exeEND]")
				game_log("SERVER", "Обновление неудачно.")
				updating = FALSE
				return 1
		message_staff("UPDATER: '[command]' success")
		fdel("[UPD_EXE_FILE][exeEND]")

	// Branch selected. Pull changes
	command = "git pull --ff-only"
	text2file(command, "[UPD_EXE_FILE][exeEND]")
	if(shell("[RunExe] > [UPD_LOG_FILE]") != 0)
		upd_log = file2text(UPD_LOG_FILE)
		message_staff("UPDATER: pulling data failure. Command was '[command]'. Error message:\n[upd_log]")
		to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Обновление отменено из-за ошибки.</b>")))
		SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "failure"))
		fdel("[UPD_EXE_FILE][exeEND]")
		game_log("SERVER", "Обновление неудачно.")
		updating = FALSE
		return 1
	message_staff("UPDATER: '[command]' success")
	fdel("[UPD_EXE_FILE][exeEND]")

	// Files updated. Compile time
	to_world(SPAN_NOTICE(FONT_LARGE("<br>Файлы обновления получены. Начало компиляции.")))
	command = "[DMpref] -clean -max_errors 10 [DMB_NAME ? "[DMB_NAME]" : "[initial(world.name)]"].dme"
	text2file(command, "[UPD_EXE_FILE][exeEND]")

	if(shell("[RunExe] > [UPD_LOG_FILE]") != 0)
		upd_log = file2text(UPD_LOG_FILE)
		message_staff("UPDATER: compilation failure. Command was '[command]'. Error message:\n[upd_log]")
		if(Try_Compile_Between_Rounds_If_Fails)
			fdel("[UPD_EXE_FILE][exeEND]")
			command = Between_Rounds_Compile_Code
			text2file(command, "[UPD_EXE_FILE][exeEND]")
			update_server = get_key(user)
			to_world(SPAN_NOTICE(FONT_LARGE("<br>Компиляция неудачна. Отложено на конец раунда.")))
			game_log("SERVER", "Обновление отложено на конец раунда.")
			SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "delay"))
			updating = FALSE
			return 2
		to_world(SPAN_NOTICE(FONT_LARGE("<b><br>Обновление отменено из-за ошибки.</b>")))
		SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "failure"))
		fdel("[UPD_EXE_FILE][exeEND]")
		game_log("SERVER", "Обновление неудачно.")
		updating = FALSE
		return 1
	message_staff("UPDATER: '[command]' success")
	fdel("[UPD_EXE_FILE][exeEND]")
	fdel(UPD_LOG_FILE)
	to_world(SPAN_NOTICE(FONT_LARGE("<br>Обновление прошло успешно.")))
	game_log("SERVER", "Обновление успешно.")
	updating = FALSE
	SSwebhooks.send(WEBHOOK_SERVER_UPDATE, list("status" = "success"))
	return 0

#undef UPD_LOG_FILE
#undef UPD_EXE_FILE
#undef UPSTREAM_PREFIX

/datum/controller/subsystem/ticker/proc/update_map(New_Map)
	if(shell("update_map.bat") == 0)
		send2mainirc("Следующей картой будет - [New_Map]!")
		log_and_message_admins("Компилирование карты завершено. Следующей картой будет - [New_Map].")
	else
		scheduled_map_change = 1
		log_and_message_admins("Ошибка в компилировании карты! Возпроизведение резервного обновлениЯ в конце раунда! Доложить об ошибке разработчикам!")

	if(GAME_STATE == RUNLEVEL_POSTGAME)
		end_game_state = END_GAME_READY_TO_END
