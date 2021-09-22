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
	var/lockdown_support = FALSE

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
