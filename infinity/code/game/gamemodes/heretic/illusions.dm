/mob/living/simple_animal/hostile/illusion
	name = "illusion"
	desc = "It's a fake!"
	icon = 'icons/effects/effects.dmi'
	icon_state = "rune_teleport"
	icon_living = "rune_teleport"
	icon_dead = "null"
	gender = NEUTER
	melee_damage_lower = 5
	melee_damage_upper = 5
	a_intent = I_HURT
	attacktext = "smashed"
	maxHealth = 100
	health = 100
	speed = 2
	faction = list("illusion")
	var/life_span = INFINITY //how long until they despawn
	var/mob/living/parent_mob
	var/multiply_chance = 0 //if we multiply on hit


/mob/living/simple_animal/hostile/illusion/Life()
	..()
	if(world.time > life_span)
		death()
/mob/living/simple_animal/hostile/illusion/death()
	visible_message(SPAN_WARNING("[src] vanishes into thin air! It was a fake!"))
	. = ..()
	qdel(src)

/mob/living/simple_animal/hostile/illusion/proc/Copy_Parent(mob/living/original, life = 50, hp = 100, damage = 0, replicate = 0 )
	appearance = original.appearance
	parent_mob = original
	dir = original.dir
	life_span = world.time+life
	health = hp
	melee_damage_lower = damage
	melee_damage_upper = damage
	multiply_chance = replicate
	faction -= "neutral"
	transform = initial(transform)
	pixel_y = initial(pixel_y)
	pixel_x = initial(pixel_x)

/mob/living/simple_animal/hostile/illusion/examine(mob/user)
	if(parent_mob)
		return parent_mob.examine(user)
	else
		return ..()


/mob/living/simple_animal/hostile/illusion/AttackingTarget()
	. = ..()
	if(. && isliving(target_mob) && prob(multiply_chance))
		var/mob/living/L = target_mob
		if(L.stat == DEAD)
			return
		var/mob/living/simple_animal/hostile/illusion/M = new(loc)
		M.faction = faction
		M.Copy_Parent(parent_mob, 80, health/2, melee_damage_upper, multiply_chance/2)
		M.target_mob = L

///////Actual Types/////////

/mob/living/simple_animal/hostile/illusion/escape
	melee_damage_lower = 0
	melee_damage_upper = 0
	speed = -1
	environment_smash = 0


/mob/living/simple_animal/hostile/illusion/escape/AttackingTarget()
	return FALSE

/mob/living/simple_animal/hostile/illusion/escape/MoveToTarget()
	if(!can_act())
		return
	if(confused)
		walk_to(src, pick(orange(2, src)), 1, move_to_delay)
		return
	stop_automated_movement = 1
	if(!target_mob || SA_attackable(target_mob))
		stance = HOSTILE_STANCE_IDLE
	if(target_mob in ListTargets(10))
		walk_to(src, get_edge_target_turf(target_mob, get_dir(src, target_mob)), 1, move_to_delay)
