/obj/item/weapon/reagent_containers/food/snacks/monkeycube/lizard
	name = "lizard cube"
	monkey_type = /mob/living/simple_animal/lizard

/obj/item/weapon/reagent_containers/food/snacks/sliceable/ryebread
	name = "rye bread"
	icon_state = "Some plain old Earthen bread. Made of a rye."
	desc = "Some plain old Earthen rye bread."
	icon = 'infinity/icons/obj/food.dmi'
	icon_state = "bread-rye"
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/slice/ryebread
	slices_num = 6
	center_of_mass = "x=16;y=9"
	nutriment_desc = list("rye" = 10)
	nutriment_amt = 10
	bitesize = 2
	trash = null

/obj/item/weapon/reagent_containers/food/snacks/slice/ryebread
	name = "rye bread slice"
	desc = "A slice of home. A rye home."
	icon = 'infinity/icons/obj/food.dmi'
	icon_state = "bread-rye-slice"
	bitesize = 2
	center_of_mass = "x=16;y=4"
	whole_path = /obj/item/weapon/reagent_containers/food/snacks/sliceable/ryebread
	trash = null

/obj/item/weapon/reagent_containers/food/snacks/slice/ryebread
	filled = TRUE

/obj/item/weapon/reagent_containers/food/snacks/dumpling
	name = "\improper meat dumplings"
	desc = "Raw meat appetizer, native to Terra."
	icon = 'infinity/icons/obj/food.dmi'
	icon_state = "pelmeni"
	filling_color = "#ffffff"
	center_of_mass = "x=16;y=16"
	bitesize = 2
/obj/item/weapon/reagent_containers/food/snacks/dumpling/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)

obj/item/weapon/reagent_containers/food/snacks/boileddumplings
	name = "\improper boiled dumplings"
	desc = "A dish consisting of boiled pieces of meat wrapped in dough. Delicious!"
	icon = 'infinity/icons/obj/food.dmi'
	icon_state = "pelmeni_boiled"
	filling_color = "#ffffff"
	center_of_mass = "x=16;y=16"
	bitesize = 2
/obj/item/weapon/reagent_containers/food/snacks/dumpling/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 30)

/obj/item/weapon/reagent_containers/food/snacks/biomass
	name = "\improper nutriment cube"
	desc = "Contains nutriments in solid form that liquefy on contact with stomach acid"
	icon = 'infinity/icons/obj/food.dmi'
	icon_state = "nutriment_cube"
	filling_color = "#ffffff"
	trash = /obj/item/trash/cubewrapper
	center_of_mass = "x=16;y=16"
	bitesize = 10
/obj/item/weapon/reagent_containers/food/snacks/biomass/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment, 10)
