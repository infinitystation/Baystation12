/datum/reagent/toxin/mint
	name = "Mint Toxin"
	description = "Useful for dealing with undesirable customers."
	color = "#cf3600" // rgb: 207, 54, 0
	strength = 0
	taste_description = "mint"

/datum/reagent/toxin/mint/on_mob_life(mob/living/carbon/M)
	switch(M.nutrition)
		if(450 to INFINITY)
			addtimer(CALLBACK(M, /mob/proc/gib), 3 SECONDS)
	return ..()
