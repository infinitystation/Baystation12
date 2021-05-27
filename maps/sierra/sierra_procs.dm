/datum/map/make_maint_all_access(var/radstorm = 0)
	maint_all_access = 1
	if(radstorm)
		priority_announcement.Announce("Требования к доступу у шлюзов в технические тоннели временнно отключены. Экранированные отсеки - технические тоннели, челноки, камеры заключения, дормиторий.", "Внимание!")
	else
		priority_announcement.Announce("Требования к доступу у шлюзов в технические тоннели временнно отключены.", "Внимание!")

/datum/map/revoke_maint_all_access(var/radstorm = 0)
	maint_all_access = 0
	priority_announcement.Announce("Требования к доступу у шлюзов в технические тоннели восстановлены.", "Внимание!")

/datum/map/proc/toggle_crew_sensors(var/new_mode = 0, var/force = FALSE)
	if(ntnet_global && ntnet_global.check_function(NTNET_SYSTEMCONTROL))	// No network - no remote control
		var/tracked = crew_repository.scan()
		for(var/obj/item/clothing/under/suit in tracked)
			var/turf/pos = get_turf(suit)
			if(pos && (pos.z in GLOB.using_map.map_levels))
				if(force || (suit.sensor_mode < new_mode))
					suit.sensor_mode = new_mode

	//Automatic code alert lockdown code here
/datum/map
	var/list/high_secure_areas
	var/list/secure_areas
	var/lockdown = FALSE

/datum/map/sierra
	high_secure_areas = list(
	//	"First Deck - Security - Armory",			WikiPedia's
	//	"First Deck - Security - Armory Lobby",		Lie
	//	"First Deck - Vault",
	//	"AI Chamber",
		"Second Deck - AI Upload",
		"Second Deck - AI Upload Access")

	secure_areas = list(
		"Second Deck - Engine - Supermatter",
		"Second Deck - Engineering - Technical Storage",
		"Second Deck - Teleporter",
		"First Deck - Telecoms - Storage",
		"First Deck - Telecoms - Monitoring",
		"First Deck - Telecoms",
		"First Deck - EVA",
		"Security - Brig",
		"Security - Prison Wing",
		"Third Deck - Hangar",
		"Third Deck - Hangar - Atmospherics Storage",
		"Third Deck - Water Cistern"
		)

/datum/map/proc/area_lockdown(var/a)
	var/area/area = get_area_name(a)
	for(var/obj/machinery/door/airlock/airlock in area)
		airlock.command("secure_close")

/datum/map/proc/area_unlock(var/a)
	var/area/area = get_area_name(a)
	for(var/obj/machinery/door/airlock/airlock in area)
		airlock.command("unlock")

/datum/map/proc/lock_secure_areas()
	if(secure_areas)
		for(var/area in secure_areas)
			area_lockdown(area)

/datum/map/proc/unlock_secure_areas()
	if(secure_areas)
		for(var/area in secure_areas)
			area_unlock(area)

/datum/map/proc/lock_high_secure_areas()
	if(high_secure_areas)
		for(var/area in high_secure_areas)
			area_lockdown(area)

/datum/map/proc/unlock_high_secure_areas()
	if(high_secure_areas)
		for(var/area in high_secure_areas)
			area_unlock(area)

/datum/map/proc/lockdown(var/force)
	lockdown = !lockdown
	if(force && force == "close")
		lockdown = TRUE
	else if(force && force == "open")
		lockdown = FALSE

	if(!lockdown)
		for(var/obj/machinery/door/blast/regular/lockdown/door in SSmachines.machinery)
			door.autoclose = FALSE
			INVOKE_ASYNC(door, /obj/machinery/door/proc/open)
	else
		for(var/obj/machinery/door/blast/regular/lockdown/door in SSmachines.machinery)
			door.autoclose = TRUE
			INVOKE_ASYNC(door, /obj/machinery/door/blast/proc/delayed_close)
/*	for better times
/mob/living/silicon/ai/verb/lockdown()
	set category = "Silicon Commands"
	set name = "Vessel's Lockdown"
	set desc = "Toggles local Lockdowns Blastdoors"

	GLOB.using_map.lockdown()
	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
	priority_announcement.Announce("[GLOB.using_map.lockdown ? "Сохраняйте спокойствие и оставайтесь на своих местах. Если есть раненые [src.name] поможет отвести их к медбею." : "Возвращайтесь к работе. Текущий уровень угрозы: [security_state.current_security_level.name]!"]", "[GLOB.using_map.lockdown ? "Активирован карантин!" : "Отмена карантина!"]")
*/

/datum/map/sierra/roundend_player_status()
	for(var/mob/Player in GLOB.player_list)
		if(Player.mind && !isnewplayer(Player))
			if(Player.stat != DEAD)
				var/turf/playerTurf = get_turf(Player)
				if(evacuation_controller.round_over() && evacuation_controller.emergency_evacuation)
					if(isNotAdminLevel(playerTurf.z))
						to_chat(Player, "<font color='blue'><b>Вам удалось выжить, но вы были брошены на [station_name()], [Player.real_name]...</b></font>")
					else
						to_chat(Player, "<font color='green'><b>Вам удалось пережить события на [station_name()], [Player.real_name]!</b></font>")
				else if(isAdminLevel(playerTurf.z))
					to_chat(Player, "<font color='green'><b>Вы успешно избежали событий на [station_name()], [Player.real_name].</b></font>")
				else if(issilicon(Player))
					to_chat(Player, "<font color='green'><b>Ваши системы сохранили свою функциональность после событий на [station_name()], [Player.real_name].</b></font>")
				else
					to_chat(Player, "<font color='blue'><b>Вы пережили очередную смену на [station_name()], [Player.real_name].</b></font>")
			else
				if(isghost(Player))
					var/mob/observer/ghost/O = Player
					if(!O.started_as_observer)
						to_chat(Player, "<font color='red'><b>Вы не пережили события на [station_name()]...</b></font>")
				else
					to_chat(Player, "<font color='red'><b>Вы не пережили события на [station_name()]...</b></font>")
