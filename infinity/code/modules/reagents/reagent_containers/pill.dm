/obj/item/weapon/reagent_containers/pill/nanopsi
	name = "NanoPsi"
	desc = "The pill feels like it's made of cold metal."
	icon_state = "pillC"

/obj/item/weapon/reagent_containers/pill/nanopsi/New()
	..()
	reagents.add_reagent(/datum/reagent/nanopsi, 5)

/obj/item/weapon/storage/pill_bottle/nanopsi
	name = "bottle of Nanopsi pills"
	desc = "An extremely illegal substance that allows the user to gain unprecedented psionic powers that can be amplified... Of the side effects-shortens the life of the brain, but who cares?"
	wrapper_color = COLOR_BLUE
	startswith = list(/obj/item/weapon/reagent_containers/pill/nanopsi = 10)