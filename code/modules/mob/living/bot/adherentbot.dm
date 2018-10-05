/mob/living/bot/adherent
	name = "standart adherent bot"
	desc = "It looks like a robot and you never saw anything the same before. Better don't mess with it."
	icon = 'icons/mob/human_races/species/adherent/body.dmi'
	icon_state = "full"
	density = 1
	req_one_access = list(999)	//You should never unlock him.
	botcard_access = list(999)
	RequiresAccessToToggle = 1
	will_patrol = 1
	health = 40
	maxHealth = 40
	var/target_types

/mob/living/bot/adherent/New()
	..()
	name = regex("\[A-Z\]{2}-\[A-Z\]{1} \[0-9\]{4}")
	get_targets()

/mob/living/bot/adherent/explode()		//In death Adherent-bot will loose other parts.
	on = 0
	visible_message("<span class='danger'>[src] blows apart!</span>")
	var/turf/Tsec = get_turf(src)

	new /obj/item/organ/external/arm/crystal(Tsec)
	new /obj/item/organ/external/tendril(Tsec)
	new /obj/effect/decal/cleanable/blood/gibs/robot(Tsec)
	if (prob(50))
		new /obj/item/organ/external/head/crystal(Tsec)
	if (prob(50))
		new /obj/item/organ/internal/cell/adherent(Tsec)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/bot/adherent/lookForTargets()
	for(var/obj/machinery/M in range(20, src)) // Finding machinery through the walls
		if(confirmTarget(M))
			target = M
			return

/mob/living/bot/adherent/confirmTarget(var/obj/machinery/M)
	if(!..())
		return 0
	for(var/T in target_types)
		if(istype(M, T))
			return 1
	return 0

/mob/living/bot/adherent/handleAdjacentTarget()
	UnarmedAttack(target)

/mob/living/bot/adherent/UnarmedAttack(var/obj/machinery/M, var/proximity)
	if(!..())
		return
	if(!on)
		return
	if(!istype(M))
		return
	busy = 1
	visible_message("[src] быстро нажимает несколько кнопок и переключателей на [M].")
	ignore_list += M		//Ignore this machine for a while
	sleep(300)
	ignore_list -= M

/mob/living/bot/adherent/proc/get_targets()
	target_types = list()

	target_types += /obj/machinery/computer
	target_types += /obj/machinery/power
	target_types += /obj/machinery/vending
	target_types += /obj/machinery/optable
	target_types += /obj/machinery/space_heater
	target_types += /obj/machinery/robotic_fabricator
	target_types += /obj/machinery/autolathe
	target_types += /obj/machinery/recharger
	target_types += /obj/machinery/field_generator
	target_types += /obj/machinery/atmospherics/binary/oxyregenerator
	target_types += /obj/machinery/giga_drill
	target_types += /obj/machinery/organ_printer/robot

//-----------------
//ADHERENT CLEANBOT
//-----------------

/mob/living/bot/cleanbot/adherent
	name = "adherent cleanbot"
	desc = "It looks like a robot and you never saw anything the same before. Better don't mess with it."
	icon = 'icons/mob/human_races/species/adherent/body.dmi'
	icon_state = "full"
	density = 1
	req_one_access = list(999)	//You should never unlock him.
	botcard_access = list(999)
	RequiresAccessToToggle = 1
	will_patrol = 1
	health = 40
	maxHealth = 40

/mob/living/bot/cleanbot/adherent/New()
	..()
	var/number = regex("\[A-Z\]{2}-\[A-Z\]{1} \[0-9\]{4}")
	name = number

/mob/living/bot/cleanbot/adherent/explode()		//In death Adherent-bot will loose other parts.
	on = 0
	visible_message("<span class='danger'>[src] blows apart!</span>")
	var/turf/Tsec = get_turf(src)

	new /obj/item/organ/external/arm/crystal(Tsec)
	new /obj/item/organ/external/tendril(Tsec)
	new /obj/effect/decal/cleanable/blood/gibs/robot(Tsec)
	if (prob(50))
		new /obj/item/organ/external/head/crystal(Tsec)
	if (prob(50))
		new /obj/item/organ/internal/cell/adherent(Tsec)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/bot/cleanbot/adherent/update_icons()
	return

/*
//ADHERENT MEDBOT - Currently li'l bugged because it takes icon of medibot when injecting
/mob/living/bot/medbot/adherent
	name = "adherent medbot "
	desc = "Huge octopus-like robot with syringes, saws, scalpels and other horrible torture tools."
	icon = 'icons/mob/human_races/species/adherent/body.dmi'
	icon_state = "full"
	density = 1
	req_one_access = list(999)	//You should not unlock him.
	botcard_access = null
	RequiresAccessToToggle = 1
	will_patrol = 1
	health = 40
	maxHealth = 40

/mob/living/bot/medbot/adherent/New()
	..()
	name = regex("\[A-Z\]{2}-\[A-Z\]{1} \[0-9\]{4}")

/mob/living/bot/medbot/adherent/handleIdle()
	if(vocal && prob(1))
		var/message = pick("Look for your health status, good sir.", "Checking your mental status... You're absolutely fine, sir!", "Your weight is too low, sir. Please, eat a bit more proteins and nutriments.", "Today is a good day. Almost no suicides.", "Maybe I should add a bit more sweet sugar to my drugs...")
		say(message)

/mob/living/bot/medbot/adherent/explode()		//In dearh Adherent-bot will loose other parts.
	on = 0
	visible_message("<span class='danger'>[src] blows apart!</span>")
	var/turf/Tsec = get_turf(src)

	new /obj/item/organ/external/arm/crystal(Tsec)
	new /obj/item/organ/external/tendril(Tsec)
	new /obj/effect/decal/cleanable/blood/gibs/robot(Tsec)
	if (prob(50))
		new /obj/item/organ/external/head/crystal(Tsec)
	if (prob(50))
		new /obj/item/organ/internal/cell/adherent(Tsec)

	if(reagent_glass)
		reagent_glass.loc = Tsec
		reagent_glass = null

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/bot/medbot/adherent/update_icons()
	return
*/