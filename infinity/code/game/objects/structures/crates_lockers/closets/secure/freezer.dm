/obj/structure/closet/fridge
	name = "fridge"
	icon = 'icons/obj/closets/fridge.dmi'
	closet_appearance = null

/obj/structure/closet/secure_closet/freezer/fridge/zeppelin/WillContain()
	return list(
		/obj/item/reagent_containers/food/drinks/milk = 2,
		/obj/item/reagent_containers/food/condiment/flour = 2,
		/obj/item/storage/fancy/egg_box = 2,
		/obj/item/reagent_containers/food/snacks/meat/beef = 4,
		/obj/item/reagent_containers/food/snacks/fish = 2,
		/obj/item/reagent_containers/food/condiment/small/peppermill = 1,
		/obj/item/reagent_containers/food/condiment/small/saltshaker = 1)

/obj/structure/closet/secure_closet/freezer
	var/jones = FALSE

/obj/structure/closet/secure_closet/freezer/ex_act()
	if(!jones)
		jones = TRUE
		return
