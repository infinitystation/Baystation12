#define TEASCORD_S 1 // Settings
#define TEASCORD_C 2 // Contacts

/datum/computer_file/program/teascord
	filename = "teascord"
	filedesc = "Teascord"
	program_icon_state = "generic"
	program_menu_icon = "cup"
	extended_desc = "Free messenger with VOIP that specializes in text and audio communication between users in a chat channel"
	size = 9
	nanomodule_path = /datum/nano_module/teascord/
	requires_ntnet = 1
	available_on_ntnet = 1
	usage_flags = PROGRAM_ALL

/datum/nano_module/teascord/
	name = "Teascord"
	var/screen_state = TEASCORD_C

/datum/nano_module/teascord/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = GLOB.default_state)
	var/list/data = host.initial_data()

	data["screen_state"] = screen_state

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "teascord.tmpl", name, 700, 800, state = state)
		ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/teascord/Topic(href, href_list)
	var/mob/user = usr
	if(..())
		return 1

	if(href_list["contacts"])
		screen_state = TEASCORD_C
		return 1

	if(href_list["settings"])
		screen_state = TEASCORD_S
		return 1

#undef TEASCORD_S
#undef TEASCORD_C
