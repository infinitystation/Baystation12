/mob/living/proc/toggle_pass_table()
	set category = "Abilities"
	set name = "Toggle Agility" //Dunno a better name for this. You have to be pretty agile to hop over stuff!!!
	set desc = "Allows you to start/stop hopping over things such as hydroponics trays, tables, and railings."
	pass_flags ^= PASS_FLAG_TABLE //I dunno what this fancy ^= is but Aronai gave it to me.
	to_chat(src, "You [pass_flags&PASS_FLAG_TABLE ? "will" : "will NOT"] move over tables/railings/trays!")

/mob/living/carbon/human/proc/toggle_sprint()
	set category = "Abilities"
	set name = "Sprint"
	set desc = "Gives temporary acceleration at the expense of nutrients. Dangerous for health, especials for heart."

	var/obj/aura/speed/bio/aura = locate() in auras
	if(!aura)
		to_chat(src, SPAN_WARNING("You don't possess a sprint ability."))
		return
	if(aura.toggled) //switches off itself overtime
		to_chat(src, SPAN_WARNING("You're too excited to stop! DO SOMETHING!"))
		return
	if(!(aura.deactivation + 4 MINUTE < world.time))
		to_chat(src, SPAN_WARNING("You're a bit tired after sprint, you cannot do again."))
		return
	aura.toggle()

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