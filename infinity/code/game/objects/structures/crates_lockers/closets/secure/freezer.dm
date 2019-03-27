/obj/structure/closet/fridge
	name = "fridge"
	icon = 'icons/obj/closets_inf.dmi'
	closet_appearance = /decl/closet_appearance/crate/freezer

/obj/structure/closet/secure_closet/freezer/fridge/zeppelin/WillContain()
	return list(
		/obj/item/weapon/reagent_containers/food/drinks/milk = 2,
		/obj/item/weapon/reagent_containers/food/condiment/flour = 2,
		/obj/item/weapon/storage/fancy/egg_box = 2,
		/obj/item/weapon/reagent_containers/food/snacks/meat/beef = 4,
		/obj/item/weapon/reagent_containers/food/snacks/fish = 2,
		/obj/item/weapon/reagent_containers/food/condiment/small/peppermill = 1,
		/obj/item/weapon/reagent_containers/food/condiment/small/saltshaker = 1)
