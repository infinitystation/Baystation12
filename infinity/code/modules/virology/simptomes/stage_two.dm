/datum/simptom/minor/vomit
	name = "Vomit"
	desc = "Patient will pereodically vomit"

/datum/simptom/minor/vomit/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.1)) //It shouldn't be so annoying
		to_chat(host, SPAN_WARNING("Your stomach rumbles badly."))
		if(ishuman(host))
			var/mob/living/carbon/human/hostie = host
			hostie.vomit(1)

/datum/simptom/minor/cough
	name = "Strong Cough"
	desc = "Patient will cough, damaging his lungs a bit."

/datum/simptom/minor/vomit/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	var/obj/item/organ/internal/lungs/lungs = host.internal_organs_by_name[BP_LUNGS]

	if(!lungs)
		return

	if(prob(0.25))
		host.emote("cough")
		D.spread_airborne()
		if(prob(2.5) && lungs)
			to_chat(host, SPAN_WARNING("Your chest hurts."))
			lungs.damage += rand(1, 3)


/datum/simptom/minor/weight
	name = "Weight Loss"
	desc = "Patient's metabolism will be changed and he will lose his weight much faster."

/datum/simptom/minor/weight/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(host.nutrition > 15)
		host.nutrition -= 1


/datum/simptom/minor/shiver
	name = "Shivering"
	desc = "Patient's body temperature will cool down to 5C."

/datum/simptom/minor/shiver/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	host.bodytemperature = min(T0C + 5 + (rand(-5, 5) / 100), host.bodytemperature + 0.005)


/datum/simptom/minor/hallucinations
	name = "Minor hallucinations"
	desc = "Patient will have some hallucinations."

/datum/simptom/minor/hallucinations/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		host.hallucination(100, 120)


/datum/simptom/minor/hair
	name = "Hair loss"
	desc = "Patient's hair will fall off."

/datum/simptom/minor/hair/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		if(ishuman(host))
			var/mob/living/carbon/human/hostie = host
			if(hostie.h_style != "Bald")
				host.visible_message(SPAN_WARNING("[host]'s hair rapidly fails off!"), SPAN_WARNING("Your hair rapidly fails off!"))
			hostie.h_style = "Bald"