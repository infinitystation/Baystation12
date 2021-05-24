/datum/recipe/rye_bread
	reagents = list(/datum/reagent/blackpepper = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/egg
	)
	result = /obj/item/reagent_containers/food/snacks/sliceable/ryebread

/datum/recipe/pelmeni
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/rawmeatball
	)
	result = /obj/item/reagent_containers/food/snacks/dumpling

/datum/recipe/pelmeniboiled
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/dumpling,
		/obj/item/reagent_containers/food/snacks/dumpling,
		/obj/item/reagent_containers/food/snacks/dumpling,
		/obj/item/reagent_containers/food/snacks/dumpling,
		/obj/item/reagent_containers/food/snacks/dumpling
	)
	result = /obj/item/reagent_containers/food/snacks/boileddumplings

/datum/recipe/frouka
	reagents = list(/datum/reagent/sodiumchloride = 1, /datum/reagent/blackpepper = 1)
	fruit = list("potato" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/egg)
	result = /obj/item/reagent_containers/food/snacks/mars
