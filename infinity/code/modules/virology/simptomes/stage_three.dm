/datum/simptom/major/ards
	name = "ARDS"
	desc = "Patient will suffocate, unable to breathe"

/datum/simptom/major/ards/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	var/obj/item/organ/internal/lungs/lungs = host.internal_organs_by_name[BP_LUNGS]

	if(!lungs)
		return

	if(prob(0.5))
		to_chat(host, SPAN_WARNING(pick("You feel a sharp pain in your chest!", "You can't breathe in, gasping!")))
		lungs.damage += rand(1, 3)
		host.emote("gasp")
		host.adjustOxyLoss(10)


/datum/simptom/major/necrosis
	name = "Autophagocytosis Necrosis"
	desc = "Patient's cells will decay rapidly, causing heavy damage."

/datum/simptom/major/necrosis/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(10))
		var/obj/item/organ/external/affecting = pick(host.organs)
		affecting.brute_dam += rand(0.5, 1)

		if(prob(5))
			to_chat(host, SPAN_WARNING("You feel a soothing pain in your [affecting]!"))


/datum/simptom/major/DNA
	name = "DNA Degradation"
	desc = "Causes patient's cells to degradate, dealing genetical damage."

/datum/simptom/major/DNA/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(10))
		host.adjustCloneLoss(rand(0.3, 1))

	if(prob(0.5))
		to_chat(host, SPAN_WARNING("You feel like your skin is burning!"))


/datum/simptom/major/brain
	name = "Brain Rot"
	desc = "Patient's brain will destroy it's neural connections, causing minor brain damage"

/datum/simptom/major/brain/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		host.adjustBrainLoss(5)
		to_chat(host, SPAN_WARNING("Something in your head hurts a bit."))


/datum/simptom/major/vision
	name = "Hyphema"
	desc = "The virus causes inflammation of the retina, leading to eye damage and eventually blindness."

/datum/simptom/major/vision/activate(var/mob/living/carbon/host, var/datum/disease/D)
	var/obj/item/organ/internal/eyes/eyes = host.internal_organs_by_name[BP_EYES]

	if(!eyes)
		return

	if(prob(0.5))
		if(prob(50))
			to_chat(host, SPAN_WARNING("Your eyes burn a bit."))
			eyes.damage = min(eyes.damage + 2, eyes.max_damage)
		else if(prob(50))
			to_chat(host, SPAN_WARNING("Your eyes burn badly."))
			eyes.damage = min(eyes.damage + 4, eyes.max_damage)
		else
			to_chat(host, SPAN_WARNING("Your eyes burn horrifically!"))
			eyes.damage = min(eyes.damage + 6, eyes.max_damage)