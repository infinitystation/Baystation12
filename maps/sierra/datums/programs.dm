/var/const/access_digwar = "ACCESS_DIGWAR"
/datum/access/access_digwar
	id = access_digwar
	desc = "Warrant Authorization"
	region = ACCESS_REGION_SECURITY

/datum/computer_file/program/digitalwarrant/New()
	. = ..()
	confirm_access = access_digwar