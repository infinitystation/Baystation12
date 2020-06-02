/datum/simptom/deadly/organ
	name = "Organ Shutdown Syndrome"
	desc = "Patient's organs will become intoxicated and then will be vomited out."

/datum/simptom/deadly/organ/activate(var/mob/living/carbon/host, var/datum/disease/D)
	var/obj/item/organ/internal/organ = host.internal_organs_by_name[pick(host.internal_organs_by_name)]

	if(organ.loc != host)
		return

	if(organ.parent_organ == BP_CHEST || organ.parent_organ == BP_GROIN)
		organ.damage += rand(0.05, 0.1)
		if(organ.max_damage <= organ.damage && prob(0.25))
			host.visible_message(SPAN_DANGER("In shower of blood, [host] vomits their [organ] out!"))
			organ.forceMove(get_turf(host))
			new /obj/effect/decal/cleanable/vomit(get_turf(host))
			playsound(host.loc, 'sound/effects/splat.ogg', 50, 1)
			if(ishuman(host))
				var/mob/living/carbon/human/hostie = host
				hostie.drip(25)


/datum/simptom/deadly/DNA
	name = "Albert-Braune Syndrome"
	desc = "Forces patient to degradate, dealing lots of genetical damage."

/datum/simptom/deadly/DNA/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	host.adjustCloneLoss(rand(0.25, 0.75))

	if(prob(0.5))
		to_chat(host, SPAN_WARNING("You feel like your skin is melting!"))


/datum/simptom/deadly/monkey
	name = "Reverce Pattern Syndrome"
	desc = "Turns victim into monkey."

/datum/simptom/deadly/monkey/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(ishuman(host))
		var/mob/living/carbon/human/hostie = host
		hostie.monkeyize()
	D.stage = -1


/datum/simptom/deadly/gib
	name = "Gibbingtons Syndrome"
	desc = "Gibs the patient."

/datum/simptom/deadly/gib/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.5))
		host.gib()


/datum/simptom/deadly/toxin
	name = "Toxification Syndrome"
	desc = "Patient will be hardly intoxicated."

/datum/simptom/deadly/toxin/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.5))
		host.reagents.add_reagent(/datum/reagent/toxin, 3)


/datum/simptom/deadly/siliconosis
	name = "Siliconosis"
	desc = "Patient's prothesis and implants will be damaged."

	needed_biotype = DISEASE_BIOTYPE_ROBOTIC

/datum/simptom/deadly/siliconosis/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(5))
		for(var/obj/item/organ/internal/organ in host.internal_organs_by_name)
			if(BP_IS_ROBOTIC(organ))
				organ.damage += rand(0.25, 0.5)

		for(var/obj/item/organ/external/organ in host.organs)
			if(BP_IS_ROBOTIC(organ))
				organ.damage += rand(0.25, 0.5)