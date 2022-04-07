/mob/living/simple_animal/hostile/commanded/rex
	name = "Rex"
	desc = "A large.... dog?"

	icon_state = "lavadog"
	icon_living = "lavadog"
	icon_dead = "lavadog_dead"
	

	health = 45
	maxHealth = 45
	speed = 8
	
	density = TRUE

	natural_weapon = /obj/item/natural_weapon/bite
	can_escape = TRUE

	max_gas = list(GAS_PHORON = 10, GAS_CO2 = 10)

	response_help = "pets"
	response_harm = "bites"
	response_disarm = "pushes"

	known_commands = list("stay", "stop", "attack", "follow", "guard", "forget master", "obey")
	ai_holder_type = /datum/ai_holder/simple_animal/melee/commanded

/mob/living/simple_animal/hostile/commanded/rex/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol)

	if(!master && istype(speaker, /mob/living/carbon/human))
		var/mob/living/carbon/human/S = speaker
		if ("ACCESS_HEAD_OF_SECURITY" in S.GetAccess())
			master = S
//			ai_holder.faction_friends += S
			ai_holder.leader = S
			allowed_targets -= S
			S.guards += src
	..()
	
/mob/living/simple_animal/hostile/commanded/rex/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/reagent_containers/food/snacks/meat))
		if(user != master)
			visible_message(SPAN_WARNING("\The [src] started to growl"))
		else
			visible_message(SPAN_NOTICE("\The [user] start feeding the [src] [O]"))
			if(do_after(user, 30, src))
				var/prev_AI_busy = ai_holder.busy
				set_AI_busy(FALSE)
				heal_overall_damage(10, 10)
				qdel(O)
				visible_message(SPAN_NOTICE("\The [src] ate [O]"))
				set_AI_busy(prev_AI_busy)
	else
		..()