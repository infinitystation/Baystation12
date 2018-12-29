/datum/event/fake_alarm
	startWhen = 0
	endWhen = 60
	announceWhen = 65

	var/decl/security_state/security_state
	var/stored_security_level

/datum/event/fake_alarm/announce()
	priority_announcement.Announce("Сбой в системе судна [location_name()] произвел к ошибочному запуску ядерной боеголовки. Диагностирующая  программа предотвратила и остановила отсчёт. Действующему Капитану корабля следует доложить об данном инциденте Центральному Командованию.", "Система самоуничтожения", zlevels = affecting_z)

/datum/event/fake_alarm/start()
	security_state = decls_repository.get_decl(GLOB.using_map.security_state)
	stored_security_level = security_state.current_security_level
	if(security_state == security_state.severe_security_level)
		kill()

	security_state.set_security_level(security_state.severe_security_level, TRUE)

/datum/event/fake_alarm/end()
	security_state.set_security_level(stored_security_level, TRUE)
