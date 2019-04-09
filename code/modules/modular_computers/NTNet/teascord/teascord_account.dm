/datum/computer_file/data/teascord_account/
	var/login = ""
	var/password = ""
	var/nickname = ""

	var/list/friendlist = list()
	var/list/blacklist = list()

	var/connected_clients = list()

/datum/computer_file/data/teascord_account/New()
	nickname = login
	ntnet_global.teascord_accounts.Add(src)
	. = ..()

/datum/computer_file/data/teascord_account/Destroy()
	ntnet_global.teascord_accounts.Remove(src)
	. = ..()
