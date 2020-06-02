/datum/simptom/cough
	name = "Cough"
	desc = "Patient will cough, spreading disease by air"

/datum/simptom/cough/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		host.emote("cough")
		D.spread_airborne()


/datum/simptom/sneeze
	name = "Sneeze"
	desc = "Patient will sneeze, spreading disease by air"

/datum/simptom/sneeze/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		host.emote("sneeze")
		D.spread_airborne()


/datum/simptom/stomach
	name = "Upset Stomach"
	desc = "Patient's stomach will hurt a bit. Can cause some vomit."

/datum/simptom/stomach/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		to_chat(host, SPAN_WARNING("Your stomach hurts."))
		if(prob(2.5))
			if(ishuman(host))
				var/mob/living/carbon/human/hostie = host
				hostie.vomit(1)


/datum/simptom/headache
	name = "Headache"
	desc = "Patient will feel pain in his head."

/datum/simptom/headache/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		host.custom_pain("Your head hurts.", 5, affecting = BP_HEAD)


/datum/simptom/tired
	name = "Tired Simptom"
	desc = "Patient will feel tired."

/datum/simptom/tired/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		to_chat(host, SPAN_WARNING("You feel really tired."))
		host.drowsyness += 39


/datum/simptom/fever
	name = "Fever"
	desc = "Patient's body temperature will rise up to 40C."

/datum/simptom/fever/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	host.bodytemperature = min(T0C + 40 + (rand(-5, 5) / 100), host.bodytemperature + 0.005)


/datum/simptom/flemmingtons
	name = "Flemmingtons"
	desc = "Patient's throat will secrete flemmingtons."

/datum/simptom/flemmingtons/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		to_chat(host, SPAN_WARNING(pick("Your throat feels sore.", "Mucous runs down the back of your throat.")))
		D.spread_airborne(1)


/datum/simptom/itch
	name = "Itch"
	desc = "Patient will feel itch."

/datum/simptom/headache/activate(var/mob/living/carbon/host, var/datum/disease/D)
	. = ..()
	if(prob(0.25))
		host.custom_pain("You want to scratch your itch.", 15)