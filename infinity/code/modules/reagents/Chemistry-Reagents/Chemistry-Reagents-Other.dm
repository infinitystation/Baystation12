/datum/reagent/torvicent //tajaran sprint, speed_aura.dm
	name = "Torvicent"
	description = "Biological tajaran muscle stimulant, gifted from ancients."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#862a51"
	metabolism = REM // 0.2 per tick
	value = 4.3

/datum/reagent/torvicent/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.add_chemical_effect(CE_SLOWDOWN, -0.5) //with CE_SPEEDUP they will have accuracy debuff
	M.add_chemical_effect(CE_PULSE, 1)
