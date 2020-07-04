/datum/computer_file/data/config
	filetype = "CFG"
	do_not_edit = 1

/datum/computer_file/data/config/proc/get_setting(var/setting_name)
	. = lowertext(replacetext(stored_data, " ", ""))
	. = splittext(stored_data, "<br>")
	for(var/i in .) if(copytext(i, 1, length(setting_name) + 1) == setting_name)
		i = splittext(i, ":")
		if(i) . = i[2]
		break
	if(!.) . = null

/datum/computer_file/data/config/main
	filename = "config"

/datum/computer_file/data/config/main/New()
	. = ..()
	stored_data += "[MODULAR_CONFIG_REMCON_SETTING]:ROOT@[rand(1000, 9999)]<br>"

