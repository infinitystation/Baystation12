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
	for(var/turf/simulated/floor/ai_grid/F  in world)
		F.color = f_color
	to_chat(usr, "Proccessing strata color was change to [f_color]")