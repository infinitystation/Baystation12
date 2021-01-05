/mob/living/silicon/ai/proc/change_floor()
	set category = "Silicon Commands"
	set name = "MOOD: Change Floor"

	var/f_color = input("Choose your color, dark colors are not recommended!") as color
	if(!length(f_color)) return
	var/area/area = get_area(src)
	if(area) for(var/area/i in get_areas(area.type))
		for(var/turf/simulated/floor/bluegrid/F in i)
			F.color = f_color
	to_chat(usr, "Proccessing strata color was changed to <font color='[f_color]'>[f_color]</font>")

/mob/living/silicon/ai/proc/show_crew_monitor()
	set category = "Silicon Commands"
	set name = "CREW: Show Crew Lifesigns Monitor"

	open_subsystem(/datum/nano_module/crew_monitor)

/mob/living/silicon/ai/proc/show_crew_records()
	set category = "Silicon Commands"
	set name = "CREW: Show Crew Records"

	open_subsystem(/datum/nano_module/records)

/mob/living/silicon/ai
	var/list/announcements_variants = list(
		"Torch Voice Announcement"	=	'sound/AI/newAI.ogg',
		"TG Voice Announcement"		=	'infinity/sound/AI/TG/newai.ogg'
		)

/mob/living/silicon/ai/on_mob_init()
	. = ..()
	INVOKE_ASYNC(src, .proc/AnnouncePresence)

/mob/living/silicon/ai/proc/AnnouncePresence()
	if(alert(src, "Do you want to announce your activation?", "Activation Announce", "Yes", "No") == "Yes")
		var/result = input(src, "Announce your presence?", "Presence.") in announcements_variants
		if(announcements_variants.Find(result))
			var/result_sound = announcements_variants[result]
			if(isfile(result_sound))
				announcement.Announce("Новый ИИ загружен в ядро.", new_sound = result_sound)