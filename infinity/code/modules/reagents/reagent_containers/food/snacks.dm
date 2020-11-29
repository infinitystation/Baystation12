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
