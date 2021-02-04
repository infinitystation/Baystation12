//This is ported from /vg/ and isn't entirely functional. If it sees a threat, it moves towards it, and then activates it's animation.
//At that point while it sees threats, it will remain in it's attack stage. It's a bug, but I figured it nerfs it enough to not be impossible to deal with
/mob/living/simple_animal/hostile/hive_alien/defender
	name = "hive defender"
	desc = "A terrifying monster resembling a massive, bloated tick in shape. Hundreds of blades are hidden underneath its rough shell."
	icon = 'maps/away/blueriver/blueriver.dmi'
	icon_state = "hive_executioner_move"
	icon_living = "hive_executioner_move"
	icon_dead = "hive_executioner_dead"
	move_to_delay = 5
	speed = -1
	health = 280
	maxHealth = 280
	can_escape = 1

	harm_intent_damage = 8
	melee_damage_lower = 30
	melee_damage_upper = 35
	attacktext = "evisceratds"
	attack_sound = 'sound/weapons/slash.ogg'
	var/attack_mode = FALSE

	var/transformation_delay_min = 4
	var/transformation_delay_max = 8

/mob/living/simple_animal/hostile/hive_alien/defender/proc/mode_movement() //Slightly broken, but it's alien and unpredictable so w/e
	set waitfor = 0
	icon_state = "hive_executioner_move"
	flick("hive_executioner_movemode", src)
	sleep(rand(transformation_delay_min, transformation_delay_max))
	anchored = FALSE
	speed = -1
	move_to_delay = 8
	attack_mode = FALSE

	//Immediately find a target so that we're not useless for 1 Life() tick!
	FindTarget()

/mob/living/simple_animal/hostile/hive_alien/defender/proc/mode_attack()
	set waitfor = 0
	icon_state = "hive_executioner_attack"
	flick("hive_executioner_attackmode", src)
	sleep(rand(transformation_delay_min, transformation_delay_max))
	anchored = TRUE
	speed = 0
	attack_mode = TRUE
	walk(src, 0)

/mob/living/simple_animal/hostile/hive_alien/defender/LostTarget()
	if(attack_mode && !FindTarget()) //If we don't immediately find another target, switch to movement mode
		mode_movement()

	return ..()

/mob/living/simple_animal/hostile/hive_alien/defender/LoseTarget()
	if(attack_mode && !FindTarget()) //If we don't immediately find another target, switch to movement mode
		mode_movement()

	return ..()

/mob/living/simple_animal/hostile/hive_alien/defender/AttackingTarget()
	if(!attack_mode)
		return mode_attack()

	flick("hive_executioner_attacking", src)

	return ..()

/mob/living/simple_animal/hostile/hive_alien/defender/wounded
	name = "wounded hive defender"
	health = 80
	can_escape = 0