/obj/item/projectile/hivebotbullet
	damage = 15
	damage_type = BRUTE

/mob/living/simple_animal/hostile/hivebot
	name = "Hivebot"
	desc = "A small robot."
	icon = 'icons/mob/hivebot.dmi'
	icon_state = "bot"
	icon_living = "bot"
	icon_dead = "bot"
	gender = NEUTER
	health = 25
	maxHealth = 25
	harm_intent_damage = 7
	melee_damage_lower = 5
	melee_damage_upper = 7
	attacktext = "clawed"
	projectilesound = 'sound/weapons/gunshot/gunshot_pistol.ogg'
	projectiletype = /obj/item/projectile/hivebotbullet
	faction = "hivebot"
	min_gas = null
	max_gas = null
	minbodytemp = 0
	speed = 2
	break_stuff_probability = 15
	attack_delay = 4

	bleed_colour = SYNTH_BLOOD_COLOUR

/mob/living/simple_animal/hostile/hivebot/emp_act(severity)
	health -= rand(10,25) * (severity + 1)
	Life()

/mob/living/simple_animal/hostile/hivebot/range
	name = "Hivebot"
	desc = "A smallish robot, this one is armed!"
	icon_state = "smallbot"
	icon_living = "smallbot"
	icon_dead = "smallbot"
	melee_damage_lower = 3
	melee_damage_upper = 5
	ranged = 1
	attack_delay = 6

/mob/living/simple_animal/hostile/hivebot/rapid
	icon_state = "smallbot"
	icon_living = "smallbot"
	icon_dead = "smallbot"
	melee_damage_lower = 3
	melee_damage_upper = 5
	ranged = 1
	rapid = 1
	attack_delay = 6

/mob/living/simple_animal/hostile/hivebot/strong
	name = "Strong Hivebot"
	desc = "A robot, this one is armed and looks tough!"
	icon_state = "bigbot"
	icon_living = "bigbot"
	icon_dead = "bigbot"
	health = 150
	maxHealth = 150
	melee_damage_lower = 20
	melee_damage_upper = 25
	ranged = 1
	can_escape = 1

	break_stuff_probability = 30
	attack_delay = 7
	speed = 3
//	var/resources = 0
//	var/max_resources = 10

/mob/living/simple_animal/hostile/hivebot/CanPass(atom/movable/O)
	if(istype(O, /obj/item/projectile/hivebotbullet))//Allows for swarmers to fight as a group without wasting their shots hitting each other
		return 1
	if(istype(O, /mob/living/simple_animal/hostile/hivebot))
		return 1
	..()

//mob/living/simple_animal/hostile/hivebot/strong/AttackingTarget(var/atom/target)
//	if(istype(target, /obj/effect/decal/cleanable/blood/gibs/robot))
//		qdel(target)

/mob/living/simple_animal/hostile/hivebot/death()
	..(null, "blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/simple_animal/hostile/hivebot/tele
	name = "Beacon"
	desc = "Some odd beacon thing"
	icon = 'icons/mob/hivebot.dmi'
	icon_state = "def_radar-off"
	icon_living = "def_radar-off"
	health = 200
	maxHealth = 200
	status_flags = 0
	anchored = 1
	stop_automated_movement = 1
	var/bot_type = "norm"
	var/bot_amt = 2
	var/spawn_delay = 100
	var/spawn_time = 0

/mob/living/simple_animal/hostile/hivebot/tele/New()
	..()
	var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
	smoke.set_up(5, 0, src.loc)
	smoke.start()
	visible_message("<span class='danger'>\The [src] warps in!</span>")
	playsound(src.loc, 'sound/effects/EMPulse.ogg', 25, 1)

/mob/living/simple_animal/hostile/hivebot/tele/FindTarget()
	if(..() && !spawn_time)
		spawn_time = world.time + spawn_delay
		visible_message("<span class='danger'>\The [src] turns on!</span>")
		icon_state = "def_radar"
	return null

/mob/living/simple_animal/hostile/hivebot/tele/Life()
	. = ..()
	if(. && spawn_time && spawn_time <= world.time)
		warpbots()

/mob/living/simple_animal/hostile/hivebot/tele/proc/warpbots()
	icon_state = "def_radar"
	visible_message("<span class='danger'>The [src] turns on!</span>")
	while(bot_amt > 0)
		bot_amt--
		switch(bot_type)
			if("norm")
				new /mob/living/simple_animal/hostile/hivebot(get_turf(src))
				new /mob/living/simple_animal/hostile/hivebot(get_turf(src))
				new /mob/living/simple_animal/hostile/hivebot/range(get_turf(src))
				new /mob/living/simple_animal/hostile/hivebot/rapid(get_turf(src))
	spawn(1 MINUTES)
		visible_message("<span class='boldannounce'>The [src] warps out!</span>")
		playsound(src.loc, 'sound/effects/EMPulse.ogg', 25, 1)
		qdel(src)
		return

/mob/living/simple_animal/hostile/hivebot/verb/RepairSelf()
	set name = "Self Repair"
	set category = "Hivebot"
	set desc = "Attempts to repair damage to our body. You will have to remain motionless until repairs are complete."

	if(!isturf(loc))
		return

	if(health < maxHealth)
		to_chat(src, "<span class='info'>Attempting to repair damage to our body, stand by...</span>")
		if(do_mob(src, src, 1 MINUTES))
			if(prob(60))
				health = min(maxHealth, health + 50)
				to_chat(src, "<span class='notice'>We successfully repaired half of our ourselves. The current value of the system in [health / 2]%.</span>")
			else
				health = maxHealth
				to_chat(src, "<span class='notice'>We successfully repaired ourselves. The current value of the system in [health / 2]%.</span>")
			return
	else
		to_chat(src, "<span class='notice'>We are already in perfect condition, there are no requirements for repair.</span>")
		return
