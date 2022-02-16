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
	result_type = /obj/item/clothing/suit/armor/pcarrier/mainkraft/plastic
	req_amount = 15
	difficulty = 2
	time = 120

/datum/stack_recipe/mainkraft/papercup
	title = "paper water cup"
	result_type = /obj/item/reagent_containers/food/drinks/sillycup
	req_amount = 1
	time = 10

/datum/stack_recipe/mainkraft/beaker
	title = "iron bowl"
	result_type = /obj/item/reagent_containers/glass/beaker/large/mitoll
	req_amount = 6
	difficulty = 1
	time = 60

/datum/stack_recipe/mainkraft/laserframe
	title = "laser frame"
	result_type = /obj/item/laserframe
	req_amount = 15
	time = 45
	difficulty = 2

/datum/stack_recipe/chem_mine
	title = "mine casing"
	result_type = /obj/item/mine/chem_mine
	difficulty = 3

/material/steel/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += new/datum/stack_recipe/mainkraft/larmor(src)
	. += new/datum/stack_recipe/mainkraft/marmor(src)
	. += new/datum/stack_recipe/mainkraft/harmor(src)
	. += new/datum/stack_recipe/mainkraft/beaker(src)

/material/plastic/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += new/datum/stack_recipe/mainkraft/pcarrier(src)

/material/plasteel/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += new/datum/stack_recipe/mainkraft/laserframe(src)

/material/cardboard/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += new/datum/stack_recipe/mainkraft/papercup(src)

/datum/stack_recipe/tile/cfloor
	title = "concrete pavement"
	result_type = /obj/item/stack/tile/concrete

/material/concrete/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += new/datum/stack_recipe/furniture/wall_frame(src)
	. += new/datum/stack_recipe/tile/cfloor(src)
	. += new/datum/stack_recipe/furniture/chair(src)
	. += new/datum/stack_recipe/furniture/door(src)
	. += new/datum/stack_recipe/furniture/stool(src)
	. += new/datum/stack_recipe/furniture/pew(src)
	. += new/datum/stack_recipe/furniture/pew_left(src)
	. += new/datum/stack_recipe/railing(src)
	. += new/datum/stack_recipe/furniture/rack(src)
