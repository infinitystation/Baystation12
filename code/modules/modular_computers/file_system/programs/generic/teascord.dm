#define LOGIN_SCREEN 1
#define REGISTRATION_SCREEN 2
#define CONTACTS_SCREEN 3

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

/datum/computer_file/program/teascord/run_program()
    . = ..()
    if(NM)
        var/datum/nano_module/teascord/NMT = NM
        if(NMT.current_account)
            NMT.current_account.connected_clients |= NMT

/datum/computer_file/program/teascord/kill_program()
    if(NM)
        var/datum/nano_module/teascord/NMT = NM
        if(NMT.current_account)
            NMT.current_account.connected_clients -= NMT
    . = ..()

/datum/nano_module/teascord
	name = "Teascord"
	var/tab = LOGIN_SCREEN

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
	data["stored_login"] = stored_login
	data["stored_password"] = stars(stored_password, 0)

	/*switch(tab)
		if(2)
			data["voice"] = voice
			data["microphone"] = microphone
			data["camera"] = camera*/

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
		clear_stored()
		tab = CONTACTS_SCREEN
		return 1
	else
		error_message = "Invalid Password"
		return 0

/datum/nano_module/teascord/proc/create_account()
	for(var/datum/computer_file/data/teascord_account/account in ntnet_global.teascord_accounts)
		if(!account)
			continue
		if(stored_login && stored_login == account.login)
			error_message = "This login already taken"
			return

	if(!stored_login)
		error_message = "Login not entered."
		return

	if(!stored_password)
		error_message = "Password not entered."
		return

	var/datum/computer_file/data/teascord_account/new_acc = new/datum/computer_file/data/teascord_account()
	new_acc.login = stored_login
	new_acc.password = stored_password
	clear_stored()
	tab = LOGIN_SCREEN

/datum/nano_module/teascord/proc/clear_stored()
	stored_login = ""
	stored_password = ""

/datum/nano_module/teascord/proc/log_out()
	if(current_account)
		current_account.connected_clients -= src
	tab = LOGIN_SCREEN
	current_account = null

/datum/nano_module/teascord/Topic(href, href_list)
	if(..())
		return 1
	var/mob/living/user = usr

	if(href_list["select_tab"])
		tab = href_list["select_tab"]
		clear_stored()
		if(error_message)
			error_message = ""
		return 1

	if(href_list["new_acc"])
		create_account()
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

#undef LOGIN_SCREEN
#undef REGISTRATION_SCREEN
#undef CONTACTS_SCREEN
