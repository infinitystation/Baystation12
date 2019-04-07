/datum/computer_file/program/teascord
	filename = "teascord"
	filedesc = "Teascord"
	program_icon_state = "supply"
	program_key_state = "rd_key"
	program_menu_icon = "phone"
	size = 1
	available_on_ntnet = 1
	requires_ntnet = 1
	requires_ntnet_feature = NTNET_COMMUNICATION
	nanomodule_path = /datum/nano_module/teascord

/datum/nano_module/teascord
	name = "Teascord"
	var/tab = 0 // 0: Log In screen, 1: Sign In screen

	var/stored_login = ""
	var/stored_password = ""
	var/error_message = ""

	var/voice = TRUE												// Can I hear the interlocutor?
	var/microphone = TRUE											// Can our interlocutor hear us?
	var/camera	= TRUE												// Can our interlocutor use our camera in a video call?

	var/datum/computer_file/data/teascord_account/current_account
	var/datum/computer_file/data/teascord_account/current_interlocutor

datum/nano_module/teascord/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, state = GLOB.default_state)
	var/list/data = host.initial_data()

	data["tab"] = tab
	data["error_message"] = error_message

	switch(tab)
		if(0)
			data["stored_login"] = stored_login
			data["stored_password"] = stars(stored_password, 0)
		if(1)
		if(2)
			data["voice"] = voice
			data["microphone"] = microphone
			data["camera"] = camera

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "teascord.tmpl", name, 800, 800, state = state)
		ui.set_auto_update(1)
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/teascord/proc/log_in()
	var/datum/computer_file/data/teascord_account/target
	for(var/datum/computer_file/data/teascord_account/account in ntnet_global.teascord_accounts)
		if(!account)
			continue
		if(stored_login && stored_login == account.login)
			target = account
			break

	if(!target)
		error_message = "Invalid Login"
		return 0

	var/use_pass
	if(stored_password)
		use_pass = stored_password

	if(use_pass == target.password)
		current_account = target
		current_account.connected_clients |= src
		tab = 1
		return 1
	else
		error_message = "Invalid Password"
		return 0

/datum/nano_module/teascord/proc/log_out()
	if(current_account)
		current_account.connected_clients -= src
	current_account = null

/datum/nano_module/teascord/Topic(href, href_list)
	if(..())
		return 1
	var/mob/living/user = usr

	if(href_list["select_tab"])
		tab = href_list["select_tab"]
		return 1

	if(href_list["new_acc"])
		var/log = input(user,"Create login'", "Login")
		if(!log)
			return 1
		var/pas    = input(user,"Create password", "Password")
		if(!pas)
			return 1
		var/datum/computer_file/data/teascord_account/new_acc = new/datum/computer_file/data/teascord_account()
		new_acc.login = log
		new_acc.password = pas
		return 1

	if(href_list["edit_login"])
		var/newlogin = sanitize(input(user,"Enter login", "Login", stored_login), 100)
		if(newlogin)
			stored_login = newlogin
		return 1

	if(href_list["edit_password"])
		var/newpass = sanitize(input(user,"Enter password", "Password"), 100)
		if(newpass)
			stored_password = newpass
		return 1

	if(href_list["login"])
		log_in()
		return 1

	if(href_list["logout"])
		log_out()
		return 1

	if(href_list["voice_call"])

		return 1

	if(href_list["video_call"])

		return 1

	if(href_list["stop_call"])

		return 1

	if(href_list["toggle_sound"])
		voice = !voice
		return 1

	if(href_list["toggle_microphone"])
		microphone = !microphone
		return 1

	if(href_list["toggle_camera"])
		camera = !camera
		return 1

	if(href_list["send_frend_request"])

		return 1

	if(href_list["accept_frend_request"])

		return 1

	if(href_list["ignore_frend_request"])

		return 1

	if(href_list["add_to_blacklist"])

		return 1

	if(href_list["remove_from_blacklist"])

		return 1
