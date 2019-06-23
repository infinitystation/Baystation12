/datum/reagent/torvicent //tajaran sprint, speed_aura.dm
	name = "Torvicent"
	description = "Biological tajaran muscle stimulant, gifted from ancients."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#862a51"
	metabolism = REM * 50 // 10.0 per tick
	value = 4.3

/datum/reagent/torvicent/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(!M.stat) //don't do that as dead person, please
		if(prob(2))
			to_chat(M, pick(SPAN_NOTICE("Нужно действовать!"), SPAN_NOTICE("Бежать, бежать!")))
		if(prob(2))
			M.custom_emote(VISIBLE_MESSAGE, pick("глубоко дышит", "озираетс&#255; по сторонам"))
		if(prob(4))
			to_chat(M, SPAN_WARNING("My heart hurts me!"))
			M.stun_effect_act(0, 10, BP_CHEST, "heart damage")
		for(var/obj/item/organ/internal/heart/H in M.internal_organs)
			H.damage += 0.175 //heart regens itself until 4.5 with 0.1, so it gives 0.075.\
			After 60 ticks (540 nutrition, 120 energy from 180) they'll have actual heart damage.
		M.add_chemical_effect(CE_SLOWDOWN, -0.5)
		M.add_chemical_effect(CE_PULSE, 2)
