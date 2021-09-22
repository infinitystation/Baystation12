/datum/reagent/bicaridine/tobacco
	taste_description = "speeding up time?"

/datum/reagent/tobacco/perception
	name = "Herbal drugs and tobacco"
	description = "Cut and process tobacco leaves along with herbal preparations."
	taste_description = "tobacco"
	scent = "cigarette smoke and herbal drug?"
	scent_range = 6

/datum/reagent/tobacco/perception/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.add_chemical_effect(CE_SLOWDOWN, 1)

/datum/reagent/tobacco/medical
	name = "Medical tobacco"
	description = "medicinal tobacco used for relaxation and concentration."
	taste_description = "relax, concetration and tobacco"
	scent = "relax and tobacco"
	scent_range = 2

/datum/reagent/tobacco/strong
	name = "Strong tobacco"
	description = "Strong tobacco for strong men... or women, i don't know"
	taste_description = "strong tobacco that hits the throat hard"
	scent = "Strong tobacco"
	scent_range = 10

/datum/reagent/tobacco/strong/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.reagents.add_reagent(/datum/reagent/nicotine, 10)

/datum/reagent/tobacco/female
	name = "female tobacco"
	description = "female tobacco for good lady's"
	taste_description = "weak tobacco that gently caresses the throat."
	scent = "weak tobacco"

/datum/reagent/tobacco/honey
	name = "tobacco with honey"
	description = "tobacco that has been processed in honey"
	taste_description = "the sweetness of honey and the strength of tobacco."
	scent = "sweet tobacco"

/datum/reagent/tobacco/coffee
	name = "tobacco with coffee"
	description = "tobacco leaves that have been mixed with coffee powder"
	taste_description = "sweet tobacco and energetic coffee."
	scent = "sweet tobacco and energy tobacco"
	scent_descriptor = SCENT_DESC_ODOR
