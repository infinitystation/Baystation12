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

/obj/item/clothing/accessory/armorplate/mainkraft/light
	name = "light metal plate"
	desc = "Thin homemade metal plate. Unlikely to protect from something strong, but it's better than nothing."
	icon_state = "armor_light"
	armor = list(melee = 30, bullet = 35, laser = 35, energy = 10, bomb = 25, bio = 0, rad = 0)
	slowdown = 0.1

/obj/item/clothing/accessory/armorplate/mainkraft/medium
	name = "medium metal plate"
	desc = "Metal plate of medium thickness. Feels heavy. I hope it will be able to help."
	icon_state = "armor_medium"
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 25, bomb = 30, bio = 0, rad = 0)
	slowdown = 0.35

/obj/item/clothing/accessory/armorplate/mainkraft/heavy
	name = "heavy metal plate"
	desc = "A thick sheet of armor that can stop a bullet, it is a pity that as the plate is thick, so heavy."
	icon_state = "armor_merc"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 40, bomb = 40, bio = 0, rad = 0)
	slowdown = 0.75

/obj/item/clothing/suit/armor/pcarrier/mainkraft/plastic
	name = "plastic plate carrier"
	desc = "Someone made it out of plastic with their own hands. There you can hang a sheet of armor."
	icon_state = "pvest"

/obj/item/weapon/reagent_containers/glass/beaker/large/mitoll
	name = "iron beaker"
	desc = "Large steel capacity made by own hands."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "mbeaker"
	matter = list(MATERIAL_GLASS = 6000)
	volume = 150

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