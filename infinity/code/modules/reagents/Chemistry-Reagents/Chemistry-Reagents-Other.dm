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

/datum/reagent/nitritozadole
	name = "Nitritozadole"
	description = "Nitritozadole is a very dangerous mix, which can increase your speed temporarly."
	taste_description = "metal"
	reagent_state = LIQUID
	color = "#ff2681"
	metabolism = REM * 0.20
	overdose = REAGENTS_OVERDOSE / 3
	value = 4.5

/datum/reagent/nitritozadole/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	if(prob(2))
		to_chat(M, SPAN_DANGER("My heart gonna break out from the chest!"))
		M.stun_effect_act(0, 15, BP_CHEST, "heart damage") //a small pain without damage
		if(prob(15))
			for(var/obj/item/organ/internal/heart/H in M.internal_organs)
				H.damage += 1

	if(prob(5))
		M.emote(pick("twitch", "blink_r", "shiver"))
	M.add_chemical_effect(CE_SPEEDBOOST, 1.5)
	M.add_chemical_effect(CE_PULSE, 3)
