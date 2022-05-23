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
	possible_natural_weapon = list(/obj/item/natural_weapon/bite, /obj/item/natural_weapon/claws)
	can_escape = TRUE

	max_gas = list(GAS_PHORON = 10, GAS_CO2 = 10)

	response_help = "pets"
	response_harm = "bites"
	response_disarm = "pushes"

	known_commands = list("stay", "stop", "attack", "follow", "guard", "forget master", "obey", "forget target")
	ai_holder_type = /datum/ai_holder/simple_animal/melee/commanded

/mob/living/simple_animal/hostile/commanded/rex/get_natural_weapon()
	if(natural_weapon)
		qdel(natural_weapon)
	natural_weapon = pick(possible_natural_weapon)
	return ..()

/mob/living/simple_animal/hostile/commanded/rex/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol)

	if(!master && istype(speaker, /mob/living/carbon/human))
		var/mob/living/carbon/human/S = speaker
		if ("ACCESS_HEAD_OF_SECURITY" in S.GetAccess())
			master = S
			ai_holder.leader = S
			friends |= weakref(S)
			allowed_targets -= S
			S.guards += src
	..()
	
/mob/living/simple_animal/hostile/commanded/rex/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/reagent_containers/food/snacks/meat) && stat != DEAD)
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

/mob/living/simple_animal/hostile/commanded/rex/attack_hand(mob/living/carbon/human/target)		
	if(target.a_intent != I_HELP && retribution) //assume he wants to hurt us.
		var/dealt_damage = harm_intent_damage
		var/harm_verb = response_harm
		if(ishuman(target) && target.species)
			var/datum/unarmed_attack/attack = target.get_unarmed_attack(src)
			dealt_damage = max(dealt_damage, attack.damage)
			harm_verb = pick(attack.attack_verb)
			if(attack.sharp || attack.edge)
				adjustBleedTicks(dealt_damage)

		adjustBruteLoss(dealt_damage)
		target.visible_message(SPAN_WARNING("[target] [harm_verb] \the [src]!"))
		target.do_attack_animation(src)

		if((target == master) && prob(80))
			visible_message(SPAN_WARNING("The [src]  whines"))
			return TRUE

		target_mob = target
		allowed_targets |= target
		stance = STANCE_ATTACK
		friends |= weakref(target)
		set_AI_busy(FALSE)
		ai_holder.react_to_attack(target)
		return TRUE
		

	else if(target.a_intent == I_HELP)
		if((target == master) || (weakref(target) in friends))
			visible_message("<span class='notice'>The [src] wags its tail")
			if(prob(20))
				say("Wuff!")
			return TRUE

		visible_message(SPAN_WARNING("\The [src] started to growl"))
		if(prob(10))
			attack_target(target)
	
	. = ..()
