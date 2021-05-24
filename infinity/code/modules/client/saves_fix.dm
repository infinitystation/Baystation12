GLOBAL_LIST_EMPTY(prefs_fixed)

/client/verb/fix_preferences()
	set name = "Fix Characters Load"
	set category = "OOC"

	if(ckey in GLOB.prefs_fixed)
		to_chat(usr, SPAN_NOTICE("Ваши персонажи уже должны были загрузиться. Если этого не произошло - пожалуйста, сообщите разработчикам."))
		return

	GLOB.prefs_fixed += ckey

	prefs.load_data()
	prefs.sanitize_preferences()

	return 0
