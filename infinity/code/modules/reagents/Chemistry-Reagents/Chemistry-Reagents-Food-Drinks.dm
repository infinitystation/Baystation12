
/datum/reagent/ethanol/kotovino
	name = "Djurl'Ma-Tua"
	description = " One of the oldest tajaran drinks, the history of which stretches from unknown-distant epochs. Anywhere but on Ahdomai, this drink is not cooked. It tastes like wine, but combines a large number of different types of spices and spices. "
	taste_description = "exotic, sweet, hard and gentle at the same time"
	color = "#ba86e4"
	strength = 80
	adj_temp = 5
	glass_name = "Djurl'Ma-Tua"
	glass_desc = " Exotic drink native to Ahdomai. Its taste is similar to wine with a lot of different condiments and spices."

/datum/reagent/ethanol/kotovino/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_TAJARA)
		M.adjustToxLoss(0.5 * removed)
	else
		M.apply_effect(4, PAIN, 0)
		if(prob(5))
			M.visible_message("<span class='warning'>[M] [pick("dry heaves!","coughs!","splutters!")]</span>", "<span class='danger'>You can feel LIQUID HELL running down your throat and into your stomach!</span>")
	if(istype(M, /mob/living/carbon/slime))
		M.bodytemperature += rand(15, 30)
	holder.remove_reagent(/datum/reagent/frostoil, 5)

/datum/reagent/juice/selmsok
	name = "Selm juice"
	description = "Juice of one of the Ahdomai plants, which is taken to drink chilled"
	taste_description = "frightening sourness with spices"
	color = "#e486e3"
	glass_name = "Selm juice"
	glass_desc = " Juice of one of the Ahdomai plants, which is taken to drink chilled. "

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
	glass_desc = " Drink similar to tea, but from other herbs. If you brewed hundreds of medicinal herbs from pharmacies - could be something similar. "

/datum/reagent/drink/tajaran/chai/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_TAJARA)
		M.heal_organ_damage(5 * removed, 5 * removed)
		M.adjustToxLoss(-3 * removed)
