/datum/computer_file/data/teascord_account/
	var/login = ""
	var/password = ""
	var/nickname = ""

	var/list/friendlist = list()
	var/list/blacklist = list()

	var/active_invites = list()

	var/connected_client

/datum/computer_file/data/teascord_account/New()
	ntnet_global.teascord_accounts.Add(src)
	. = ..()

/datum/computer_file/data/teascord_account/Destroy()
	ntnet_global.teascord_accounts.Remove(src)
	. = ..()
