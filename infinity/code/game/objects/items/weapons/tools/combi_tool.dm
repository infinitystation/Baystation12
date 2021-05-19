/obj/item/combitool
	name = "combi-tool"
	desc = "It even has one of those nubbins for doing the thingy."
	icon = 'icons/obj/tools.dmi'
	icon_state = "combitool"
	w_class = ITEM_SIZE_SMALL

	var/list/spawn_tools = list(
		/obj/item/screwdriver,
		/obj/item/wrench,
		/obj/item/wirecutters,
		/obj/item/material/knife,
		/obj/item/material/kitchen/utensil/fork,
		/obj/item/material/hatchet
		)
	var/list/tools = list()
	var/current_tool = TRUE
	safely = TRUE

/obj/item/combitool/examine()
	..()
	if(loc == usr && tools.len)
		to_chat(usr, "It has the following fittings:")
		for(var/obj/item/tool in tools)
			to_chat(usr, "\icon[tool] - [tool.name][tools[current_tool]==tool?" (selected)":""]")

/obj/item/combitool/New()
	..()
	for(var/type in spawn_tools)
		tools |= new type(src)

/obj/item/combitool/attack_self(mob/user as mob)
	if(++current_tool > tools.len) current_tool = TRUE
	var/obj/item/tool = tools[current_tool]
	if(!tool)
		to_chat(user, "You can't seem to find any fittings in \the [src].")
	else
		to_chat(user, "You switch \the [src] to the [tool.name] fitting.")
	return TRUE

/obj/item/combitool/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!M.Adjacent(user))
		return FALSE
	var/obj/item/tool = tools[current_tool]
	if(!tool) return FALSE
	return (tool ? tool.attack(M,user) : FALSE)

/obj/item/combitool/afterattack(var/atom/target, var/mob/living/user, proximity, params)
	if(!proximity)
		return FALSE
	var/obj/item/tool = tools[current_tool]
	if(!tool) return FALSE
	tool.loc = user
	var/resolved = target.attackby(tool,user)
	if(!resolved && tool && target)
		tool.afterattack(target, user, TRUE)
	if(tool)
		tool.loc = src
