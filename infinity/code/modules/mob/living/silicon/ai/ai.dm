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
