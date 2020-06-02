/datum/disease/fungal_tb
	name = "Fungal tuberculosis"
	desc = "A rare highly transmissible virulent fungus. Few samples exist, rumoured to be carefully grown and cultured by clandestine bio-weapon specialists. Causes fever, blood vomiting, lung damage, weight loss, and fatigue."
	form = "Fungus"
	agent = "Fungal Tubercle bacillus Cosmosis"
	spread_text = "Airborne"
	cure_text = "Spaceacillin and Oxycodone"

	max_stages = 5

	viable_mobtypes = list(/mob/living/carbon/human)
	cures = list(/datum/reagent/spaceacillin, /datum/reagent/tramadol/oxycodone)
	infectivity = 85
	cure_chance = 4 //You won't escape from hell

	severity = DISEASE_SEVERITY_BIOHAZARD
	required_organs = list(/obj/item/organ/internal/lungs, /obj/item/organ/internal/heart)

	mutation_prob = 0.0001
	bypasses_immunity = TRUE //It is a fungus, it doesn't care about immunity
	permeability_mod = 1.75

	genekey = "fungal_tbaaaaaaa"

	stats = list("Stealth" = 1, "Resistance" = 4, "Speed" = 3, "Transmittability" = 5) //You will need like 45 units of spacecillin to cure it without oxycodone :)

	var/coughing = 0 //Multiple coughs
	var/maxcough = 3

/datum/disease/fungal_tb/stage_act()
	. = ..()

	var/obj/item/organ/internal/lungs/lungs = host.internal_organs_by_name[BP_LUNGS]
	var/obj/item/organ/internal/heart/heart = host.internal_organs_by_name[BP_HEART]

	if(coughing)
		if(coughing > maxcough)
			coughing = 0
			return

		if(prob(0.75 - 0.4 * (maxcough > 4)))
			host.emote("cough")
			spread_airborne(6)
			coughing += 1
			if(maxcough > 4)
				lungs.damage += rand(1, 3)
			return

	if(stage > 1)
		host.bodytemperature = min(T0C + 40 + (rand(-5, 5) / 100), host.bodytemperature + 0.005)

		if(prob(0.25 * stage))
			host.emote("cough")
			spread_airborne(6)
			if(prob(2.5))
				to_chat(host, SPAN_WARNING("Your chest hurts."))
				lungs.damage += rand(1, 3)
			return

		if(prob(0.1))
			to_chat(host, SPAN_WARNING("You feel a cold sweat."))
			return

	if(stage > 2)
		if(prob(0.25))
			host.emote("cough")
			spread_airborne(6)
			if(prob(5))
				to_chat(host, SPAN_WARNING("You feel air escape from your lungs painfully."))
				lungs.damage += rand(1, 3)
			return

		if(prob(0.1))
			to_chat(host, SPAN_WARNING("You feel a sharp pain in your chest!"))
			lungs.damage += rand(1, 3)
			host.emote("gasp")
			spread_airborne(2)
			host.adjustOxyLoss(10)
			return

	if(stage > 3)
		if(prob(0.05)) //Dangerous as fuck
			heart.pulse = pick(PULSE_NONE, PULSE_SLOW)
			heart.damage += rand(1, 5)
			if(prob(25) || heart.pulse == PULSE_NONE)
				to_chat(host, SPAN_WARNING("You feel a sharp pain in your chest!"))
			return

		if(prob(0.25))
			coughing = 1
			host.emote("cough")
			spread_airborne(6)
			maxcough = rand(2, 4)
			if(prob(2.5))
				to_chat(host, SPAN_WARNING("Your chest hurts."))
				lungs.damage += rand(1, 3)
			return

		if(prob(0.25))
			if(ishuman(host))
				var/mob/living/carbon/human/hostie = host
				hostie.vomit(2)
				if(stage == 5 || prob(10))
					hostie.drip(5)
			return

	if(stage == 5) //Bye bye!
		if(prob(0.25))
			to_chat(host, SPAN_WARNING("You see four of everything!"))
			host.make_dizzy(5)
			return

		if(prob(0.25))
			host.visible_message(SPAN_WARNING("[host] suddenly falls on the ground!"), SPAN_WARNING("You suddenly fall asleep..."))
			host.sleeping += 100
			return

		if(prob(0.25)) //No lungs will survive this
			coughing = 1
			host.emote("cough")
			spread_airborne(6)
			maxcough = rand(4, 6)

		if(prob(0.25)) //Dangerous as fuck 2
			heart.pulse = pick(PULSE_NONE, PULSE_SLOW)
			heart.damage += rand(1, 5)
			if(prob(25) || heart.pulse == PULSE_NONE)
				to_chat(host, SPAN_WARNING("You feel a sharp pain in your chest!"))
			return

/obj/item/fungal
	name = "Fungal Shit"
	icon_state = "gift"

/obj/item/fungal/attack_self(var/mob/living/carbon/human/user)
	var/datum/disease/assblast_usa/f = new
	f.infect(user)

/datum/disease/assblast_usa
	symptomes = list(new /datum/simptom/deadly/organ,
					 new /datum/simptom/sneeze,
					 new /datum/simptom/stomach)