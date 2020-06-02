/datum/disease/flu
	name = "The Flu"
	desc = "If left untreated the subject will feel quite unwell."
	agent = "H13N1 flu virion"
	cure_text = "Rest and Spaceacillin"

	max_stages = 3
	cures = list(/datum/reagent/spaceacillin)
	viable_mobtypes = list(/mob/living/carbon/human)
	permeability_mod = 0.75

	genekey = "common_fluaaaaaa"

/datum/disease/flu/stage_act()
	. = ..()
	if(host.resting && prob(0.6 - 0.1 * stage))
		to_chat(host, SPAN_NOTICE("You feel better"))
		stage = min(stage - 1, 1)
		return

	if(stage > 1)

		host.bodytemperature = min(T0C + 40 + (rand(-5, 5) / 100), host.bodytemperature + 0.005)

		if(prob(0.25))
			host.emote("cough")
			spread_airborne(3)
			return

		if(prob(0.25))
			host.emote("sneeze")
			spread_airborne()
			return

		if(prob(0.25))
			to_chat(host, SPAN_WARNING("Your muscles ache."))
			return

	if(stage > 2)
		if(prob(0.25))
			to_chat(host, SPAN_WARNING("Your stomach hurts."))
			if(ishuman(host))
				var/mob/living/carbon/human/hostie = host
				hostie.vomit(1)
			return

		if(prob(0.25))
			host.custom_pain("Your head hurts.", 5, affecting = BP_HEAD)
			return

		if(prob(0.25))
			to_chat(host, SPAN_WARNING("You feel really tired."))
			host.drowsyness += 39