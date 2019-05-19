/obj/item/weapon/reagent_containers/food/drinks/bottle/Djurl_Ma_Tua
	name = "Djurl'Ma-Tua"
	desc = "One of the oldest tajaran drinks, the history of which stretches from unknown-distant epochs. Anywhere but on Ahdomai, this drink is not cooked. It tastes like wine, but combines a large number of different types of spices and spices."
	icon_state = "kotobuhlo"
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/kotovino, 120)

/obj/item/weapon/reagent_containers/food/drinks/bottle/Herbal_tincture
	name = "Herbal tincture"
	desc = "Drink similar to tea, but from other herbs. If you brewed hundreds of medicinal herbs from pharmacies - could be something similar."
	icon_state = "kotochai"
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/tajaran/chai, 120)