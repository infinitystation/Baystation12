/obj/aura/speed
	name = "speed aura"
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
		for(var/obj/item/organ/external/foot/O in H.organs)
			legs++
			if(!(O.status & ORGAN_ROBOTIC))
				if((O.status & ORGAN_BROKEN)      ||\
					(O.status & ORGAN_TENDON_CUT) ||\
					(O.status & ORGAN_ARTERY_CUT) ||\
					(O.status & ORGAN_MUTATED)    ||\
					(O.status & ORGAN_DEAD)       ||\
					(O.status & ORGAN_CUT_AWAY))
					to_chat(user, SPAN_WARNING("Your legs are too damaged, you cannot sprint!"))
					return
			else
				to_chat(user, SPAN_NOTICE("Your natural legs were removed. Robotic one don't gives you that ability."))
				return

		for(var/obj/item/organ/external/leg/O in H.organs)
			legs++
			if(!(O.status & ORGAN_ROBOTIC))
				if((O.status & ORGAN_BROKEN)      ||\
					(O.status & ORGAN_TENDON_CUT) ||\
					(O.status & ORGAN_ARTERY_CUT) ||\
					(O.status & ORGAN_MUTATED)    ||\
					(O.status & ORGAN_DEAD)       ||\
					(O.status & ORGAN_CUT_AWAY))
					to_chat(user, SPAN_WARNING("Your feets are too damaged, you cannot sprint!"))
					return
			else
				to_chat(user, SPAN_NOTICE("Your natural feets were removed. Robotic one don't gives you that ability."))
				return

		if(legs != 4)
			to_chat(user, SPAN_WARNING("You lose some parts of your legs, you cannot sprint!"))
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
	if(H.nutrition > consument) //if((H.nutrition > consument) && (deactivation + 1 MINUTE  > world.time))
		H.nutrition -= consument
		H.reagents.add_reagent(/datum/reagent/torvicent, 0.201)
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

/obj/aura/speed/bio/tajaran
	name = "action mode"
	consument = 1.5
	var/minimal_nutrition = 100

/obj/aura/speed/bio/tajaran/toggle()
	if(!checks()) return
	if(!toggled)
		to_chat(user, SPAN_NOTICE("It is time to do something, you run a bit faster."))
	else
		to_chat(user, SPAN_NOTICE("It is time for resting..."))
	toggled = !toggled

/obj/aura/speed/bio/tajaran/life_tick()
	var/mob/living/carbon/human/H = user
	if(!toggled)
		return
	if(H.stat == DEAD)
		return
	if(H.nutrition > minimal_nutrition)
		H.nutrition -= consument
		H.reagents.add_reagent(/datum/reagent/torvicent, 0.201)
		if(!checks())
			to_chat(user, SPAN_DANGER("Your legs are too damaged, you cannot run faster!"))
			toggled = 0
			return
	else
		to_chat(user, SPAN_NOTICE("You are too exhausted..."))
		toggled = 0
		return

/obj/aura/speed/mech
	name = "motion overload"

/*
	setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	var/legs = 0
	for(var/obj/item/organ/external/leg/L in external_organs)
		legs++
		if(!L.status)
			to_chat(src, SPAN_NOTICE("You cannot sprint without legs."))
			return
		if(robotic)
			if(ORGAN_ROBOTIC)
				if(ORGAN_BROKEN || ORGAN_SABOTAGED || ORGAN_BRITTLE)
					to_chat(src, SPAN_WARNING("Your robotic legs were too damaged to sprint!"))
					return
			else
				to_chat(src, SPAN_NOTICE("Your robotic legs were removed. You cannot sprint."))
				return

		else if(!ORGAN_ROBOTIC)
			if(ORGAN_BROKEN || ORGAN_TENDON_CUT || ORGAN_ARTERY_CUT || ORGAN_MUTATED || ORGAN_DEAD || ORGAN_CUT_AWAY)
				to_chat(src, SPAN_WARNING("Your legs are too damaged, you cannot sprint!"))
				return
		else
			to_chat(src, SPAN_NOTICE("Your natural legs was removed. Robotic one don't gives you that ability."))
			return

	switch(legs)
		if(<=0)
			to_chat(src, SPAN_NOTICE("You cannot sprint without legs."))
			return
		if(1)
			to_chat(src, SPAN_NOTICE("You cannot sprint with just one leg."))
			return

	if(robotic)
		for(var/obj/item/organ/internal/cell/C in internal_organs)
			if(C.charge < 700)
				to_chat(src, SPAN_NOTICE("Internal power charge is too low. You cannot sprint."))
				return
	else if(nutrition < 200)
		var/confirm = alert("You are too tired! Are you sure? That will cause damage in future.", "Emergency sprint", "Yes", "No")
		switch(confirm)
			if("No") return
			if("Yes")
				for(var/obj/item/organ/internal/heart/H in internal_organs)
					H.damage += prob(1,3)
				M.adjustToxLoss(prob(5,10)
				nutrition = 0

	to_chat(src, SPAN_NOTICE("Internal reserves of your body were realised! It's time for action!"))
	speed -= 0.4
	add_chemical_effect(CE_PULSE, 4)
	sleep(500) //50 seconds of fun
	speed += 0.4
	add_chemical_effect(CE_PULSE, -4)
	to_chat(src, SPAN_NOTICE("You feel yourself a bit tired after sprint."))
*/
