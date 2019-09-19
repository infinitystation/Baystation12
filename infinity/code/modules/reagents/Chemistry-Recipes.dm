/datum/chemical_reaction/github
	name = "GitHub"
	result = /datum/reagent/ethanol/github
	required_reagents = list(/datum/reagent/drink/juice/watermelon = 1, /datum/reagent/fuel = 1, /datum/reagent/iron = 1)
	result_amount = 10
	mix_message = "Microchips are starting to blur in the water..."

/datum/chemical_reaction/discord
	name = "Discord"
	result = /datum/reagent/ethanol/discord
	required_reagents = list(/datum/reagent/drink/juice/grape = 1, /datum/reagent/fuel = 1, /datum/reagent/iron = 1)
	result_amount = 10
	mix_message = "Voice yelling and memes are starting to blur in the water..."

/*INFINITY - Soldification*/
/datum/chemical_reaction/goldalchemy
	name = "Gold"
	result = null
	required_reagents = list(/datum/reagent/frostoil = 5, /datum/reagent/gold = 20)
	catalysts = list(/datum/reagent/coolant=1)
	result_amount = 1
	mix_message = "The solution solidifies into a golden mass."

/datum/chemical_reaction/goldalchemy/on_reaction(var/datum/reagents/holder, var/created_volume, var/reaction_flags)
	..()
	new /obj/item/stack/material/gold(get_turf(holder.my_atom), created_volume)
	
/datum/chemical_reaction/silveralchemy
	name = "Silver"
	result = null
	required_reagents = list(/datum/reagent/frostoil = 5, /datum/reagent/silver = 20)
	result_amount = 1
	mix_message = "The solution solidifies into a silver mass."

/datum/chemical_reaction/silveralchemy/on_reaction(var/datum/reagents/holder, var/created_volume, var/reaction_flags)
	..()
	new /obj/item/stack/material/silver(get_turf(holder.my_atom), created_volume)	
