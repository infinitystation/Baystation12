/material/alloy
	name = "unknown alloy"
	lore_text = "An alloy from 2 or many materials"
	var/alloy_difficulty_level = 1
	var/list/alloyed_in_alloy = list()
	stack_type = /obj/item/stack/material/aluminium/alloy
	icon_colour = "#444"

/material/alloy/proc/generateName()
	name = ""
	if(length(alloyed_in_alloy))
		for(var/material/i in alloyed_in_alloy)
			name += "[i.name][alloyed_in_alloy[length(alloyed_in_alloy)] == i ? "" : "ed "]"

/obj/item/stack/material/aluminium/alloy
	name = "unknown alloy"

/obj/item/stack/material/aluminium/alloy/Initialize()
	. = ..()
	calculateAlloy()

/obj/item/stack/material/aluminium/alloy/proc/calculateAlloy()
	var/material/M = material
	name = M.name ? M.name : initial(name)