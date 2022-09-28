/mob/living/silicon/robot/key_down(_key, client/user)
	switch(_key)
		if("1", "2", "3")
			cmd_toggle_module(text2num(_key))
			return
		if("4")
			a_intent_change(INTENT_HOTKEY_LEFT)
			return
		if("X")
			cycle_modules()
			return
		if("Q")
			cmd_unequip_module() // User is in QWERTY hotkey mode.
	return ..()
