/datum/disease/cold
	name = "The Cold"
	desc = "If left untreated the subject will contract the flu."
	agent = "XY-rhinovirus"
	cure_text = "Rest or Spaceacillin"

	max_stages = 3
	cures = list(/datum/reagent/spaceacillin)
	viable_mobtypes = list(/mob/living/carbon/human)
	permeability_mod = 0.5

	genekey = "common_coldaaaaa"

/datum/disease/cold/stage_act()
	. = ..()
	if(host.resting && prob(0.6 - 0.1 * stage))
		to_chat(host, SPAN_NOTICE("You feel better"))
		cure()
		return

	if(stage > 1)
		if(prob(0.01))
			to_chat(host, SPAN_NOTICE("You feel better"))
			cure()
			return

		if(prob(0.25))
			host.emote("cough")
			spread_airborne()
			return

		if(prob(0.25))
			host.emote("sneeze")
			spread_airborne()
			return

		if(prob(0.25))
			to_chat(host, SPAN_WARNING("Your throat feels sore."))
			return

	if(stage > 2)
		if(prob(0.25))
			to_chat(host, SPAN_WARNING("Mucous runs down the back of your throat."))
			return

		if(prob(0.25))
			host.custom_pain("Your head hurts.", 5, affecting = BP_HEAD)
			return

		if(prob(0.05))
			var/datum/disease/flu/D = new
			D.try_infect(host)
			cure()