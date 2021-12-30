/obj/item/reagent_containers/pill/strange_pill
	name = "Lucy\'s pill"
	desc = "Hmmm..."
	icon_state = "pill2"
	trade_blacklisted = TRUE

/obj/item/reagent_containers/pill/strange_pill/New()
	..()
	reagents.add_reagent(/datum/reagent/rsh4, 1)
