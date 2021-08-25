//Inf, снизу отсылка в сигаре из МГС 5
/datum/reagent/tobacco/perception
	name = "Herbal drugs and tobacco"
	description = "Cut and process tobacco leaves along with herbal preparations.."
	taste_description = "tobacco, medicinal herbs and speeding up time?"
	reagent_state = SOLID
	color = "#684b3c"
	scannable = 1
	value = 3
	scent = "cigarette smoke and herbal drug?"
	scent_descriptor = SCENT_DESC_ODOR
	scent_range = 6

/datum/reagent/tobacco/perception/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.reagents.add_reagent(/datum/reagent/nicotine, 6)
	M.reagents.add_reagent(/datum/reagent/bicaridine, 3)
	M.add_chemical_effect(CE_PAINKILLER, 5)


/datum/reagent/tobacco/medical
	name = "Medical tobacco"
	description = "medicinal tobacco used for relaxation and concentration."
	taste_description = "Relax, concetration and tobacco"
	reagent_state = SOLID
	color = "#684b3c"
	scannable = 1
	value = 3
	scent = "relax and tobacco"
	scent_descriptor = SCENT_DESC_ODOR
	scent_range = 2
//ifn медицинская травка для пациентов менталиста

/datum/reagent/tobacco/medical/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.reagents.add_reagent(/datum/reagent/paroxetine, 3)
	M.reagents.add_reagent(/datum/reagent/nicotine, 3)

datum/reagent/tobacco/strong
	name = "Strong tobacco"
	description = "Strong tobacco for strong men... or women, i don't know"
	taste_description = "strong tobacco that hits the throat hard"
	reagent_state = SOLID
	color = "#684b3c"
	scannable = 1
	value = 3
	scent = "Strong tobacco"
	scent_descriptor = SCENT_DESC_ODOR
	scent_range = 10
//inf Boss, try remember basic of CQC

/datum/reagent/tobacco/strong/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.reagents.add_reagent(/datum/reagent/nicotine, 10)

datum/reagent/tobacco/female
	name = "female tobacco"
	description = "female tobacco for good lady's"
	taste_description = "weak tobacco that gently caresses the throat."
	reagent_state = SOLID
	color = "#684b3c"
	scannable = 1
	value = 3
	scent = "weak tobacco"
	scent_descriptor = SCENT_DESC_ODOR
	scent_range = 4
//inf ladie's, we go viva la france

datum/reagent/tobacco/honey
	name = "tobacco with honey"
	description = "tobacco that has been processed in honey"
	taste_description = "you can feel the sweetness of honey and the strength of tobacco."
	reagent_state = SOLID
	color = "#684b3c"
	scannable = 1
	value = 3
	scent = "sweet tobacco"
	scent_descriptor = SCENT_DESC_ODOR
	scent_range = 4

datum/reagent/tobacco/honey/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.reagents.add_reagent(/datum/reagent/nicotine, 2)

datum/reagent/tobacco/coffee
	name = "tobacco with coffee"
	description = "tobacco leaves that have been mixed with coffee powder"
	taste_description = "you can taste sweet tobacco and energetic coffee."
	reagent_state = SOLID
	color = "#684b3c"
	scannable = 1
	value = 3
	scent = "sweet tobacco and energy tobacco"
	scent_descriptor = SCENT_DESC_ODOR
	scent_range = 4

datum/reagent/tobacco/coffee/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.reagents.add_reagent(/datum/reagent/nicotine, 3)
