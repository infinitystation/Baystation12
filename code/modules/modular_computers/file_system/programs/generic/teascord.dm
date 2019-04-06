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
	var/tab = 0 // 0: Login screen, 1: Contacts

datum/nano_module/teascord/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, state = GLOB.default_state)
	var/list/data = host.initial_data()

	data["tab"] = tab

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "teascord.tmpl", name, 800, 800, state = state)
		ui.set_auto_update(1)
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/teascord/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["select_tab"])
		tab = href_list["select_tab"]
		return 1
