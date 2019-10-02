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
	result_type = /obj/item/weapon/reagent_containers/food/drinks/sillycup
	req_amount = 1
	time = 10

/datum/stack_recipe/mainkraft/beaker
	title = "iron bowl"
	result_type = /obj/item/weapon/reagent_containers/glass/beaker/large/mitoll
	req_amount = 6
	difficulty = 1
	time = 60

/datum/stack_recipe/mainkraft/laserframe
	title = "laser frame"
	result_type = /obj/item/weapon/laserframe
	req_amount = 15
	time = 45
	difficulty = 2

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

/datum/stack_recipe/mainkraft/barrier
	title = "concrete block"
	result_type = /obj/structure/barrierfc
	req_amount = 10
	difficulty = 1
	time = 60

/datum/stack_recipe/tile/fcfloor
	title = "concrete pavement"
	result_type = /obj/item/stack/tile/fconcrete

/datum/stack_recipe/furniture/wall_frame/fc
	title = "concrete wall frame"
	result_type = /obj/structure/wall_frame/fconcrete
	req_amount = 2
	time = 20

/material/fconcrete/generate_recipes(var/reinforce_material)
	. = ..()
	if(reinforce_material)	//recipies below don't support composite materials
		return
	. += new/datum/stack_recipe/mainkraft/barrier(src)
	. += new/datum/stack_recipe/furniture/wall_frame/fc(src)
	. += new/datum/stack_recipe/tile/fcfloor(src)
	. += new/datum/stack_recipe/baseball_bat(src)
	. += new/datum/stack_recipe/ashtray(src)
	. += new/datum/stack_recipe/coin(src)
	. += new/datum/stack_recipe/spoon(src)
	. += new/datum/stack_recipe/ring(src)
	. += new/datum/stack_recipe/clipboard(src)
	. += new/datum/stack_recipe/urn(src)
	. += new/datum/stack_recipe/furniture/chair(src)
	. += new/datum/stack_recipe/furniture/door(src)
	. += new/datum/stack_recipe/furniture/barricade(src)
	. += new/datum/stack_recipe/furniture/stool(src)
	. += new/datum/stack_recipe/furniture/bar_stool(src)
	. += new/datum/stack_recipe/furniture/bed(src)
	. += new/datum/stack_recipe/furniture/pew(src)
	. += new/datum/stack_recipe/furniture/pew_left(src)
	. += new/datum/stack_recipe/lock(src)
	. += new/datum/stack_recipe/railing(src)
	. += new/datum/stack_recipe/rod(src)
	. += new/datum/stack_recipe/grip(src)
	. += new/datum/stack_recipe/furniture/wall_frame(src)
	. += new/datum/stack_recipe/fork(src)
	. += new/datum/stack_recipe/knife(src)
	. += new/datum/stack_recipe/blade(src)
	. += new/datum/stack_recipe/furniture/rack(src)
	. += new/datum/stack_recipe/key(src)

