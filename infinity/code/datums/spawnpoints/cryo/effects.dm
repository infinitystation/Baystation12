/datum/spawnpoint/cryo/proc/give_effect(mob/living/carbon/human/H)
	var/message = ""
/* bad ideas
	if(prob(5))
		H.make_dizzy(200) //sea sick, it would make you mad very fast
	if(prob(10)) //hallucinations
		message += SPAN_WARNING("В ушках звон, в голове белый шум... ")
		H.hallucination(100, 120)
	if(prob(5)) //cryo malfunction
		message += SPAN_DANGER("Вы чувствуете ужасающий холод во всём теле! Крио всё ещё охлаждает! ")
		H.bodytemperature = victim.species.cold_level_3
	if(prob(5)) //sleepy crewman syndrome
		message += SPAN_WARNING("Вы долго не могли уснуть, не смотря на все усилия этой машины. \
		Так не хочется вставать... Ноги ватные, руки тяжелые... ")
		H.drowsyness += 39 //59 seconds with high chance to fall asleep
*/
	if(prob(20)) //starvation
		message += SPAN_WARNING("Кажется, вы забыли поесть перед тем, как уйти в сон. Горло пересохло, а \
		живот скрутило в спазме. ")
		H.nutrition = rand(0,200)
		H.hydration = rand(0,200)
		if(H.species.name == SPECIES_UNATHI)
			H.nutrition = rand(100,200)
	if(prob(10)) //stutterting and jittering (because of cold?)
		message += SPAN_WARNING("Трясет от холода. ")
		H.make_jittery(120)
		H.stuttering = 20
	if(prob(5)) //side medical effect. Stealth
		H.add_side_effect(pick(GLOB.all_medical_side_effects))
	if(prob(5)) //vomit
		message += SPAN_WARNING("Тошнит... ")
		H.vomit()
	if(!message)
		message += SPAN_NOTICE("Кажется, в этот раз без осложнений... Правда, выспаться в саркофаге всё равно не удалось.")
	else
		message += SPAN_WARNING("Не удалось даже нормально выспаться в этом гробу...")
	to_chat(H, message)
	return TRUE
