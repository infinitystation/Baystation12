/obj/aura/speed
	name = "speed aura"
	var/speedbuff = 0.4
	var/consument = 14 //consumes nutrtiments every tick
	var/toggled = FALSE

/obj/aura/speed/life_tick(mob/user)
	var/mob/living/carbon/human/H = user
	H.nutrition -= consument

/obj/aura/speed/proc/toggle()
	toggled = !toggled

/obj/aura/speed/bio
	name = "sprint"
	var/deactivation
	var/announced_deact = 1

/obj/aura/speed/bio/New()
	..()
	deactivation = world.time - 4 MINUTE

/obj/aura/speed/bio/proc/checks()
	var/mob/living/carbon/human/H = user
	var/legs = 0
	if(!toggled)
		for(var/obj/item/organ/external/leg/L in H.organs)
			legs++
			if(!(L.status & ORGAN_ROBOTIC))
				if((L.status & ORGAN_BROKEN)      ||\
					(L.status & ORGAN_TENDON_CUT) ||\
					(L.status & ORGAN_ARTERY_CUT) ||\
					(L.status & ORGAN_MUTATED)    ||\
					(L.status & ORGAN_DEAD)       ||\
					(L.status & ORGAN_CUT_AWAY))
					to_chat(user, SPAN_WARNING("Your legs are too damaged, you cannot sprint!"))
					return
			else
				to_chat(user, SPAN_NOTICE("Your natural legs was removed. Robotic one don't gives you that ability."))
				return

		switch(legs)
			if(0)
				to_chat(user, SPAN_NOTICE("You cannot sprint without legs."))
				return
			if(1)
				to_chat(user, SPAN_NOTICE("You cannot sprint with just one leg."))
				return

		if(H.nutrition < consument)
			to_chat(user, SPAN_NOTICE("You are too exhausted..."))
			return
	return 1

/obj/aura/speed/bio/toggle()
	if(!checks()) return
	if(!toggled)
		to_chat(user, SPAN_NOTICE("Internal reserves of your body were realised! It's time for action!"))
	deactivation = world.time
	announced_deact = 0
	toggled = 1

/obj/aura/speed/bio/life_tick()
	var/mob/living/carbon/H = user
	if((deactivation + 4 MINUTE < world.time) && announced_deact == 0)
		to_chat(user, SPAN_NOTICE("You would sprint again."))
		announced_deact = 1
	if(!toggled || H.stat == DEAD)
		return
	if((H.nutrition > consument) && (deactivation + 1 MINUTE  > world.time))
		H.nutrition -= consument
		H.reagents.add_reagent(/datum/reagent/torvicent, 1.1)
		if(!checks())
			to_chat(user, SPAN_DANGER("Your legs are too damaged, you cannot sprint!"))
			announced_deact = 0
			toggled = 0
			return
	else
		to_chat(user, SPAN_NOTICE("You are too exhausted..."))
		announced_deact = 0
		toggled = 0
		return

/datum/reagent/torvicent //technically, hyperzine, but weaker
	name = "Torvicent"
	description = "Biological tajaran muscle stimulant, gifted from ancients."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#862a51"
	metabolism = REM * 5 // 1(!) per tick
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
			M.stun_effect_act(0, 5, BP_CHEST, "heart damage")
		M.add_chemical_effect(CE_SLOWDOWN, -0.45)
		M.add_chemical_effect(CE_PULSE, 2)

/obj/aura/speed/mech
	name = "motion overload"
