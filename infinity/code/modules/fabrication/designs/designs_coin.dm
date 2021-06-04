/datum/fabricator_recipe/coin
	fabricator_types = list(FABRICATOR_CLASS_COIN)
	category="Сoins"
	path = /obj/item/material/coin/iron

/datum/fabricator_recipe/coin/New()
	.=..()
	resources[/material/iron]=2000*FABRICATOR_EXTRA_COST_FACTOR

/datum/fabricator_recipe/coin/gold
	name = "gold coin"
	path = /obj/item/material/coin/gold

/datum/fabricator_recipe/coin/gold/New()
	.=..()
	resources[/material/gold]=2000*FABRICATOR_EXTRA_COST_FACTOR

/datum/fabricator_recipe/coin/silver
	name = "silver coin"
	path = /obj/item/material/coin/silver

/datum/fabricator_recipe/coin/silver/New()
	.=..()
	resources[/material/silver]=2000*FABRICATOR_EXTRA_COST_FACTOR

/datum/fabricator_recipe/coin/diamond
	name = "diamond coin"
	path = /obj/item/material/coin/diamond

/datum/fabricator_recipe/coin/diamond/New()
	.=..()
	resources[/material/diamond]=2000*FABRICATOR_EXTRA_COST_FACTOR

/datum/fabricator_recipe/coin/uranium
	name = "uranium coin"
	path = /obj/item/material/coin/uranium

/datum/fabricator_recipe/coin/uranium/New()
	.=..()
	resources[/material/uranium]=2000*FABRICATOR_EXTRA_COST_FACTOR

/datum/fabricator_recipe/coin/platinum
	name = "platinum coin"
	path = /obj/item/material/coin/platinum

/datum/fabricator_recipe/coin/platinum/New()
	.=..()
	resources[/material/platinum]=2000*FABRICATOR_EXTRA_COST_FACTOR

/datum/fabricator_recipe/coin/phoron
	name = "phoron coin"
	path = /obj/item/material/coin/phoron

/datum/fabricator_recipe/coin/phoron/New()
	.=..()
	resources[/material/phoron]=2000*FABRICATOR_EXTRA_COST_FACTOR
