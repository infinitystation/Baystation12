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

/datum/chemical_reaction/concrete
	name = "concrete"
	result = null
	required_reagents = list(/datum/reagent/silicon = 20, /datum/reagent/iron = 5, /datum/reagent/aluminium = 5, /datum/reagent/water = 20)
	result_amount = 5
	mix_message = "The solution solidifies into a grey mass."

/datum/chemical_reaction/concrete/on_reaction(var/datum/reagents/holder, var/created_volume, var/reaction_flags)
	..()
	new /obj/item/stack/material/concrete(get_turf(holder.my_atom), created_volume)

/datum/chemical_reaction/mandarinjuice
	name = "Mandarin Juice"
	result = /datum/reagent/drink/juice/mandarin
	required_reagents = list(/datum/reagent/water = 3, /datum/reagent/nutriment/instantjuice/mandarin = 1)
	result_amount = 3
	mix_message = "The solution settles into a clear orange beverage."

/datum/chemical_reaction/compote
	name = "Compote"
	result = /datum/reagent/drink/compote
	required_reagents = list(/datum/reagent/water = 2, /datum/reagent/drink/juice/berry = 1, /datum/reagent/drink/juice/apple = 1, /datum/reagent/drink/juice/pear = 1)
	result_amount = 5
	mix_message = "The mixture turns a soft orange, bubbling faintly"
	minimum_temperature = 40 CELSIUS
	maximum_temperature = (40 CELSIUS)
