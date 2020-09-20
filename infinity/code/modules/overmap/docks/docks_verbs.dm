/obj/docking_port/verb/cross_dock_verb()
	set name = "DOCK: Cross"
	set category = "Object"
	set src in view(1)

	if(!issilicon(usr))
		if(!can_touch(usr))
			return

	cross_dock(usr)

/obj/docking_port/verb/lock_dock_verb()
	set name = "DOCK: Lock"
	set category = "Object"
	set src in view(1)

	if(!usr.IsAdvancedToolUser())
		to_chat(usr, SPAN_WARNING("You don't have the dexterity to do this!"))
		return

	if(!issilicon(usr))
		if(!can_touch(usr))
			return

	lock_dock(usr)

/obj/docking_port/verb/announce_dock_verb()
	set name = "DOCK: Switch Announce Mode"
	set category = "Object"
	set src in view(1)

	if(!usr.IsAdvancedToolUser())
		to_chat(usr, SPAN_WARNING("You don't have the dexterity to do this!"))
		return

	if(!issilicon(usr))
		if(!can_touch(usr))
			return

	announce_turn(usr)
