/obj/machinery/keycard_auth/sierra/interact(mob/user)
	user.set_machine(src)

	var/list/dat = list()

	dat += "<h1>Карточное Устройство Аутентификации</h1>"

	dat += "Это устройство используется для активации высокоуровневых событий. Для этого требуется одновременно провести двумя картами, высокого уровня доступа."
	dat += "<br><hr><br>"

	if(screen == 1)
		dat += "Выберите протокол для активации:<br>"

		var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
		if(security_state.current_security_level == security_state.severe_security_level)
			dat += "Нельзя изменить код угрозы обьекта: [security_state.severe_security_level.name] введен.<br>"
		else
			if(security_state.current_security_level == security_state.high_security_level)
				dat += "<A href='?src=\ref[src];triggerevent=Revert alert'>Отменить [security_state.high_security_level.name]</A><br>"
			else
				dat += "<A href='?src=\ref[src];triggerevent=Red alert'>Активировать [security_state.high_security_level.name]</A><br>"

		if(!config.ert_admin_call_only)
			dat += "<A href='?src=\ref[src];triggerevent=Emergency Response Team'>Отряд Быстрого Реагирования</A><br>"

		if(!maint_all_access)
			dat += "<A href='?src=\ref[src];triggerevent=Grant Emergency Maintenance Access'>Разрешить Аварийный Технический Доступ</A><br>"
		else
			dat += "<A href='?src=\ref[src];triggerevent=Revoke Emergency Maintenance Access'>Отменить Аварийный Технический Доступ</A><br>"
		dat += "<A href='?src=\ref[src];triggerevent=Grant Nuclear Authorization Code'>Получить Коды Ядерной Авторизации</A><br>"
		dat += "<a href='?src=\ref[src];triggerevent=Evacuate'>Иницировать Процедуру Эвакуации</a><br>"
	if(screen == 2)
		dat += "Пожалуйста проведите картой чтобы активировать следующий протокол: <b>[event]</b>"
		dat += "<p><A href='?src=\ref[src];reset=1'>Back</A>"

	var/datum/browser/popup = new(user, "kad_window", "Keycard Authentication Device", 500, 250)
	popup.set_content(JOINTEXT(dat))
	popup.open()
	return

/obj/machinery/keycard_auth/sierra/trigger_event()
	switch(event)
		if("Red alert")
			var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
			security_state.stored_security_level = security_state.current_security_level
			security_state.set_security_level(security_state.high_security_level)
			SSstatistics.add_field("alert_keycard_auth_red",1)
		if("Revert alert")
			var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
			security_state.set_security_level(security_state.stored_security_level)
			SSstatistics.add_field("alert_keycard_revert_red",1)
		if("Grant Emergency Maintenance Access")
			GLOB.using_map.make_maint_all_access()
			SSstatistics.add_field("alert_keycard_auth_maintGrant",1)
		if("Revoke Emergency Maintenance Access")
			GLOB.using_map.revoke_maint_all_access()
			SSstatistics.add_field("alert_keycard_auth_maintRevoke",1)
		if("Emergency Response Team")
			if(is_ert_blocked())
				to_chat(usr, "<span class='warning'>Все отряды быстрого реагирования уже на выезде, мы пока что не можем предоставить еще.</span>")
				return

			trigger_armed_response_team(1)
			SSstatistics.add_field("alert_keycard_auth_ert",1)
		if("Grant Nuclear Authorization Code")
			var/obj/machinery/nuclearbomb/nuke = locate(/obj/machinery/nuclearbomb/station) in world
			if(nuke)
				to_chat(usr, "Код ядерной авторизации: [nuke.r_code]")
			else
				to_chat(usr, "Терменал системы самоуничтожения не найден.")
			SSstatistics.add_field("alert_keycard_auth_nukecode",1)
		if("Bolt All Saferooms")
			GLOB.using_map.bolt_saferooms()
			SSstatistics.add_field("bolted_saferoom",1)
		if("Unbolt All Saferooms")
			GLOB.using_map.unbolt_saferooms()
			SSstatistics.add_field("unbolted_saferoom",1)
		if("Evacuate")
			if(!evacuation_controller)
				to_chat(usr, "<span class='danger'>Невозможно начать эвакуацию!</span>")
				return
			for (var/datum/evacuation_option/EO in evacuation_controller.available_evac_options())
				if(EO.abandon_ship)
					evacuation_controller.handle_evac_option(EO.option_target, usr, TRUE)
					return
