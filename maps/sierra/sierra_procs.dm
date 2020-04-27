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
