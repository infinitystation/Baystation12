#define LOGIN_SCREEN 1
#define REGISTRATION_SCREEN 2
#define CONTACTS_SCREEN 3
#define SETTINGS_SCREEN 4
#define CONVERSATION_SCREEN 5

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

	var/voice = TRUE
	var/microphone = TRUE
	var/camera	= TRUE

/datum/computer_file/program/teascord/run_program()
    . = ..()
    if(NM)
        var/datum/nano_module/teascord/NMT = NM
        NMT.program = src
        NMT.voice = voice
        NMT.microphone = microphone
        NMT.camera = camera
        if(NMT.current_account)
            NMT.current_account.connected_client = NMT

/datum/computer_file/program/teascord/kill_program()
    if(NM)
        var/datum/nano_module/teascord/NMT = NM
        if(NMT.current_account)
            NMT.current_account.connected_client = null
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

	var/datum/computer_file/program/teascord/program

	var/datum/computer_file/data/teascord_room/conversation

	var/datum/computer_file/data/teascord_account/current_account
	var/datum/computer_file/data/teascord_account/current_interlocutor

datum/nano_module/teascord/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, state = GLOB.default_state)
	var/list/data = host.initial_data()


	data["tab"] = tab
	data["error_message"] = error_message
	data["stored_login"] = stored_login
	data["stored_password"] = stars(stored_password, 0)
	if(current_account)
		data["nickname"] = current_account.nickname

	switch(tab)
		if(3)
			var/list/available_contacts[0]
			for(var/datum/computer_file/data/teascord_account/AC in ntnet_global.teascord_accounts)
				available_contacts.Add(contacts_to_nanoui(AC))
			data["contacts"] = available_contacts


	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "teascord.tmpl", name, 555, 500, state = state)
		ui.set_auto_update(1)
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/teascord/proc/contacts_to_nanoui(var/datum/computer_file/data/teascord_account/AC)
	return list(list(
		"login" = AC.login,
		"nickname" = AC.nickname,
		"ref" = "\ref[AC]"
		))

/datum/nano_module/teascord/proc/log_in()
	var/datum/computer_file/data/teascord_account/target
	for(var/datum/computer_file/data/teascord_account/account in ntnet_global.teascord_accounts)
		if(stored_login && stored_login == account.login)
			target = account
			break

	if(!target)
		error_message = "Invalid Login"
		return 0

	if(stored_password == target.password)
		if(target.connected_client)
			var/datum/nano_module/teascord/active_client = target.connected_client
			active_client.log_out()
		current_account = target
		current_account.connected_client = src
		tab = CONTACTS_SCREEN
		clear_stored()
		return 1
	else
		error_message = "Invalid Password"
		return 0

/datum/nano_module/teascord/proc/create_account()
	for(var/datum/computer_file/data/teascord_account/account in ntnet_global.teascord_accounts)
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
	new_acc.nickname = stored_login
	tab = LOGIN_SCREEN

/datum/nano_module/teascord/proc/delete_account()
	if(conversation)
		conversation.leave(current_account)
	clear_stored()
	tab = LOGIN_SCREEN
	current_account.Destroy()

/datum/nano_module/teascord/proc/_call(var/datum/computer_file/data/teascord_account/caller, var/datum/computer_file/data/teascord_account/invited, var/private = 0)
	if(conversation)
		error_message = "'BUG' You can't call when you're already in the conversation."
		return 0
	if(!invited.connected_client)
		error_message = "This client is offline."
		return 0
	if(caller in invited.blacklist)
		error_message = "You can't call them because this client has disconnected calls from non-friends or blocked you."
		return 0
	if(caller == invited)
		error_message = "'BUG' You can't call yourself."
		return 0

	var/datum/computer_file/data/teascord_room/new_room = new/datum/computer_file/data/teascord_room()
	new_room.join(caller)
	new_room.invite(invited)
	new_room.private = private
	tab = CONVERSATION_SCREEN

/datum/nano_module/teascord/proc/invite(var/datum/computer_file/data/teascord_account/inviter, var/datum/computer_file/data/teascord_account/invited)
	if(!conversation)
		error_message = "'BUG' You can't invite when you have no conversations."
		return 0
	if(!invited.connected_client)
		error_message = "This client is offline."
		return 0
	if(inviter in invited.blacklist)
		error_message = "You can't call them because this client has disconnected calls from non-friends or blocked you."
		return 0
	if(conversation.private)
		error_message = "You can't invite anyone in the private conversation."
		return 0
	if(invited in conversation.connected_clients)
		error_message = "You can't invite someone who is already in it to the conversation."
		return 0
	if(conversation in invited.active_invites)
		error_message = "This client is already invited to this conversation."
		return
	if(inviter == invited)
		error_message = "'BUG' You can't invite yourself."
		return 0

	conversation.invite(inviter, invited)

/datum/nano_module/teascord/proc/leave_conversation()
	conversation.leave(current_account)
	tab = CONTACTS_SCREEN

/datum/nano_module/teascord/proc/clear_stored()
	stored_login = ""
	stored_password = ""
	error_message = ""

/datum/nano_module/teascord/proc/log_out()
	if(current_account)
		current_account.connected_client = null
	if(conversation)
		conversation.leave(current_account)
	clear_stored()
	tab = LOGIN_SCREEN
	current_account = null

/datum/nano_module/teascord/Topic(href, href_list)
	if(..())
		return 1
	var/mob/living/user = usr

	if(href_list["select_tab"])
		tab = href_list["select_tab"]
		clear_stored()
		return 1

	if(href_list["new_acc"])
		create_account()
		return 1

	if(href_list["delete_acc"])
		if(alert(user, "Are you sure that you want to delete [current_account.login] account?", "Account deleting", "Yes", "No") == "Yes")
			delete_account()
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

	if(href_list["call"])
		var/private = 0
		var/response = alert(user, "Should the conversation be private?", "Call setting", "Yes", "No", "Cancel")
		if(response == "Yes")
			private = 1
		else if(response == "Cancel")
			return 1
		var/datum/computer_file/data/teascord_account/ACC = locate(href_list["call"]) in ntnet_global.teascord_accounts
		_call(current_account, ACC, private)
		return 1

	if(href_list["invite"])
		invite(current_account, href_list["invite"])
		return 1

	if(href_list["accept_invite"])

		return 1
	if(href_list["decline_invite "])

		return 1
	if(href_list["leave_conversation"])
		if(alert(user, "Are you sure that you want to leave the conversation?", "Tea room", "Yes", "No") == "Yes")
			leave_conversation()
		return 1

	if(href_list["toggle_sound"])
		voice = !voice
		program.voice = voice
		return 1

	if(href_list["toggle_microphone"])
		microphone = !microphone
		program.microphone = microphone
		return 1

	if(href_list["toggle_camera"])
		camera = !camera
		program.camera = camera
		return 1

	if(href_list["send_friend_request"])

		return 1

	if(href_list["accept_friend_request"])

		return 1

	if(href_list["ignore_friend_request"])

		return 1

	if(href_list["add_to_blacklist"])

		return 1

	if(href_list["remove_from_blacklist"])

		return 1

#undef LOGIN_SCREEN
#undef REGISTRATION_SCREEN
#undef CONTACTS_SCREEN
#undef SETTINGS_SCREEN
#undef CONVERSATION_SCREEN
