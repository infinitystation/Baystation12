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

/datum/reagent/nanopsi
	name = "PsiBuster"
	description = "A substance containing nanomachines programmed for point delivery to certain parts of the body of a psi substance that provokes an increase in the psionic potential of the organism."
	taste_description = "slimy mint"
	reagent_state = LIQUID
	color = "#ffa800"
	overdose = REAGENTS_OVERDOSE
	scannable = 0
	flags = IGNORE_MOB_SIZE
	value = 2.9
	metabolism = 100

/datum/reagent/nanopsi/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.set_psi_rank(PSI_REDACTION, 1,     defer_update = TRUE)
		M.set_psi_rank(PSI_COERCION, 1,      defer_update = TRUE)
		M.set_psi_rank(PSI_PSYCHOKINESIS, 1, defer_update = TRUE)
		M.set_psi_rank(PSI_ENERGISTICS, 1,   defer_update = TRUE)
