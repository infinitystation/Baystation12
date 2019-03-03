/obj/item/weapon/reagent_containers/pill/strange_pill
	name = "Lucy\'s pill"
	desc = "Hmmm..."
	icon_state = "pill2"

/obj/item/weapon/reagent_containers/pill/strange_pill/New()
	..()
	reagents.add_reagent(/datum/reagent/rsh4, 1)