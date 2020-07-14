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