GLOBAL_LIST_EMPTY(fax_cache)

/datum/admin_secret_item/admin_secret/list_fax
	name = "List Fax Messages"

/datum/admin_secret_item/admin_secret/list_fax/execute(var/mob/user)
	. = ..()
	if(!.)
		return

	if(!GLOB.fax_cache.len) return

	show_browser(user, JOINTEXT(GLOB.fax_cache), "window=faxlog;size=780x420;can_close=1")
