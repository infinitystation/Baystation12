/obj/docking_port/control/proc/panel_interraction(var/mob/user)
	if(broken)
		to_chat(user, SPAN_WARNING("It's broken."))
		return
	if(!usr.IsAdvancedToolUser())
		to_chat(usr, SPAN_WARNING("You don't have the dexterity to do this!"))
		return
	if(req_access.len)
		if(!check_access(user, req_access))
			to_chat(user, SPAN_WARNING("Access Denied"))
			return
	if(my_enterence.broken)
		to_chat(user, SPAN_WARNING("The dock is broken."))
		return
	var/list/choices_panel = list("Cancel","Docking", "Lockdown", "Announce")
	var/pick_choice = input(user, "Select a module you want to interract with.", "Dock Control Panel", "Cancel") in choices_panel
	if(!Adjacent(user) && !issilicon(user))
		to_chat(user, SPAN_WARNING("You have to stay close to the dock while working with with panel."))
		return
	switch(pick_choice)
		if("Docking")
			my_enterence.pick_entity_connect_disconnect(user)
		if("Lockdown")
			my_enterence.lock_dock(user)
		if("Announce")
			my_enterence.announce_turn(user)

/obj/docking_port/control/proc/find_enterence(var/mob/user)
	for(var/enterence in GLOB.cardinal)
		var/turf/T = get_step(src, enterence)
		var/obj/docking_port/enterence/find_enterence = locate() in T
		if(find_enterence) //they found each other :*
			find_enterence.control_panel = src
			my_enterence = find_enterence
			if(user)
				visible_message("\icon[src] <b>[src]</b> объявляет: \"Обнаружен стыковочный док. Производится обмен данными.\"")
				my_enterence.visible_message("\icon[my_enterence] <b>[my_enterence]</b> объявляет: \"Пакет данных принят. Док TDP-NT-E[rand(1,999)] готов к работе.\"")
			return
	visible_message("\icon[src] <b>[src]</b> объявляет: \"Поблизости не найдено ни одного стыковочного порта. Пожалуйста, свяжитесь с инженерной командой ближайшего ремонтного дока.\"")
	return