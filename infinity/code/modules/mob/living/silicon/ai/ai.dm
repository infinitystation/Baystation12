/mob/living/silicon/ai/proc/change_floor()
	set category = "Silicon Commands"
	set name = "MOOD: Change Floor"

	var/f_color = input("Choose your color, dark colors are not recommended!") as color
	var/list/black_list = list("#000000","#080808", "#111111", "#1c1c1c", "#292929", "#333333","#4d4d4d")
	if(f_color in black_list)
		to_chat(usr, "[f_color] is not allowed")
		return
	if(!f_color)
		return
	for(var/turf/simulated/floor/bluegrid/F  in world)
		F.color = f_color
	to_chat(usr, "Proccessing strata color was change to [f_color]")

/mob/living/silicon/ai/proc/show_crew_monitor()
	set category = "Silicon Commands"
	set name = "CREW: Show Crew Lifesigns Monitor"

	open_subsystem(/datum/nano_module/crew_monitor)

/mob/living/silicon/ai/proc/show_crew_records()
	set category = "Silicon Commands"
	set name = "CREW: Show Crew Records"

	open_subsystem(/datum/nano_module/records)