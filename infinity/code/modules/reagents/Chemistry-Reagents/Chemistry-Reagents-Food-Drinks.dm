/datum/reagent/ethanol/kotovino
	name = "Djurl'Ma-Tua"
	description = "One of the oldest tajaran drinks, the history of which stretches from unknown-distant epochs. \
	Anywhere but on Ahdomai, this drink is not cooked. It tastes like wine, \
	but combines a large number of different types of spices and spices. "

	taste_description = "exotic, sweet, hard and gentle at the same time"
	color = "#ba86e4"
	strength = 80
	adj_temp = 5
	glass_name = "Djurl'Ma-Tua"
	glass_desc = "Exotic drink native to Ahdomai. Its taste is similar to wine with a lot of different condiments and spices."

/datum/reagent/ethanol/kotovino/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_TAJARA)
		M.adjustToxLoss(0.5 * removed)
	else
		M.apply_effect(4, PAIN, 0)
		if(prob(5))
			M.visible_message("<span class='warning'>[M] [pick("dry heaves!","coughs!","splutters!")]</span>", \
			"<span class='danger'>You can feel LIQUID HELL running down your throat and into your stomach!</span>")
	if(istype(M, /mob/living/carbon/slime))
		M.bodytemperature += rand(15, 30)
	holder.remove_reagent(/datum/reagent/frostoil, 5)

/datum/reagent/juice/selmsok
	name = "Selm juice"
	description = "Juice of one of the Ahdomai plants, which is taken to drink chilled."
	taste_description = "frightening sourness with spices"
	color = "#e486e3"
	glass_name = "Selm juice"
	glass_desc = " Juice of one of the Ahdomai plants, which is taken to drink chilled."

/datum/reagent/drink/bmilk
	name = "Bakara Milk"
	description = "An opaque white liquid produced by the mammary glands of mammals."
	taste_description = "milk... wait! Its not THAT MILK!"
	color = "#dfdfdf"
	glass_name = "milk"
	glass_desc = "White and nutritious goodness!"

/datum/reagent/drink/tajaran/chai
	name = "Herbal tincture"
	description = "Drink similar to tea, but from other herbs. If you brewed hundreds of medicinal herbs from pharmacies - could be something similar."
	taste_description = "hundreds of herbs"
	color = "#8f86e4"
	glass_name = "Herbal tincture"
	glass_desc = " Drink similar to tea, but from other herbs. If you brewed hundreds of medicinal herbs from pharmacies - could be something similar."

/datum/reagent/drink/tajaran/chai/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_TAJARA)
		M.heal_organ_damage(5 * removed, 5 * removed)
		M.adjustToxLoss(-3 * removed)

/datum/reagent/nutriment/szechuan
	name = "Szechuan"
	description = "A long forgotten sauce of Earth, recently re-discovered."
	taste_description = "sense of legend."
	reagent_state = LIQUID
	nutriment_factor = 10
	color = "#6d2d26" //rgb: 121, 35, 0

/datum/reagent/ethanol/github
	name = "GitHub"
	description = "The famous cocktail. Coined by programmers for programmers. Made not from programmers. Where's my merge, Elar?"
	taste_description = "sweet microchips, steel and Elar's merge"
	color = "#3d3d3d"
	strength = 20

	glass_name = "github cocktail"
	glass_desc = "The famous cocktail. Coined by programmers for programmers. Made not from programmers. Where's my merge, Elar?"

/datum/reagent/ethanol/discord
	name = "Discord"
	description = "You did it, Verhniy! Where's the Discord Nitro cocktail, though?"
	taste_description = "Well Played Good Games and CO-OP"
	color = "#36393f"
	strength = 10

	glass_name = "Discord cocktail"
	glass_desc = "You did it, Verhniy! Where's the Discord Nitro cocktail, though?"

/datum/reagent/nutriment/instantjuice/mandarin
	name = "Mandarin Juice Powder"
	description = "Dehydrated, powdered mandarin juice."
	taste_description = "dry sweet holiday"
	color = "#ffbc1f"

/datum/reagent/drink/juice/mandarin
	name = "Mandarin Juice"
	description = "Delicious sweet juice made from mandarins."
	taste_description = "sweet holiday"
	color = "#ffbc1f"

	glass_name = "mandarin juice"
	glass_desc = "Delicious juice made from mandarins."
