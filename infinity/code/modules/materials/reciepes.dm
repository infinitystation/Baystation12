/datum/stack_recipe/mainkraft/larmor
	title = "light armor plate"
	result_type = /obj/item/clothing/accessory/armorplate/mainkraft/light
	req_amount = 5
	time = 30

/datum/stack_recipe/mainkraft/marmor
	title = "armor plate"
	result_type = /obj/item/clothing/accessory/armorplate/mainkraft/medium
	req_amount = 10
	difficulty = 1
	time = 60

/datum/stack_recipe/mainkraft/harmor
	title = "heavy armor plate"
	result_type = /obj/item/clothing/accessory/armorplate/mainkraft/heavy
	req_amount = 15
	difficulty = 2
	time = 120

/datum/stack_recipe/mainkraft/pcarrier
	title = "plate carrier"
	result_type = /obj/item/clothing/accessory/armorplate/mainkraft/heavy
	req_amount = 15
	difficulty = 2
	time = 120

/datum/stack_recipe/mainkraft/papercup
	title = "paper water cup"
	result_type = /obj/item/weapon/reagent_containers/food/drinks/sillycup
	req_amount = 1
	time = 10

/datum/stack_recipe/mainkraft/beaker
	title = "iron bowl"
	result_type = /obj/item/clothing/accessory/armorplate/mainkraft/medium
	req_amount = 6
	difficulty = 1
	time = 60

/material/steel/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += new/datum/stack_recipe/mainkraft/larmor(src)
	. += new/datum/stack_recipe/mainkraft/marmor(src)
	. += new/datum/stack_recipe/mainkraft/harmor(src)
	. += new/datum/stack_recipe/mainkraft/beaker(src)

/material/plasteel/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += new/datum/stack_recipe/mainkraft/pcarrier(src)

/material/cardboard/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += create_recipe_list(/datum/stack_recipe/box)