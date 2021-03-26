/obj/item/stack/material/cult
	name = "runed metal"
	icon_state = "sheet-reinf"
	plural_icon_state = "sheet-reinf-mult"
	max_icon_state = "sheet-reinf-max"
	default_type = MATERIAL_CULT

/obj/item/stack/material/cult/five
	amount = 5

/datum/stack_recipe/cult/door
	title = "runic door"
	result_type = /obj/machinery/door/unpowered/simple/cult
	req_amount = 2
	time = 30

/datum/stack_recipe/cult/archives
	title = "archives"
	result_type =/obj/structure/cult/tome
	req_amount = 5
	time = 30

/datum/stack_recipe/cult/pylon
	title = "pylon"
	result_type =/obj/structure/cult/pylon
	req_amount = 3
	time = 30

/datum/stack_recipe/cult/forge
	title = "daemon forge"
	result_type =/obj/structure/cult/forge
	req_amount = 5
	time = 30

/datum/stack_recipe/cult/altar
	title = "altar"
	result_type =/obj/structure/cult/talisman
	req_amount = 5
	time = 30

/material/cult/generate_recipes(var/reinforce_material)
	if(reinforce_material)	//recipies below don't support composite materials
		return

	. += new /datum/stack_recipe/cult/door(src)

	. += new /datum/stack_recipe/cult/altar(src)
	. += new /datum/stack_recipe/cult/forge(src)
	. += new /datum/stack_recipe/cult/pylon(src)
	. += new /datum/stack_recipe/cult/archives(src)

/obj/item/stack/material/cult/attack_self(mob/user as mob)
	if(amount < 5)
		to_chat(user, SPAN_WARNING("There's not enough [src] to make anything!"))
		return

	var/list/options = list()
	var/optionals = list("Runic Door" = /obj/machinery/door/unpowered/simple/cult,
						 "Archives" = /obj/structure/cult/tome,
						 "Pylon" = /obj/structure/cult/pylon,
						 "Daemon Forge" = /obj/structure/cult/forge,
						 "Altar" = /obj/structure/cult/talisman,
						 "Bloodstone" = /obj/structure/cult/bloodstone
						 )
	for(var/i in optionals)
		var/obj/I = optionals[i]
		var/obj/optionality = new I(src)
		options[i] = image(icon = 'infinity/icons/obj/cultradial.dmi', icon_state = optionality.icon_state)
		qdel(optionality)

	var/choice = show_radial_menu(user, src, options, radius = 32, require_near = TRUE, menu_icon = 'infinity/icons/obj/cultradial.dmi')
	if(!choice)
		return

	var/choice_type = optionals[choice]

	new choice_type(get_turf(src))

	amount -= 5
