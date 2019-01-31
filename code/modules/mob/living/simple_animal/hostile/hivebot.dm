/obj/item/projectile/hivebotbullet
	damage = 25
	damage_type = BRUTE

/mob/living/simple_animal/hostile/hivebot
	name = "Hivebot"
	desc = "A small robot."
	icon = 'icons/mob/hivebot.dmi'
	icon_state = "bot"
	icon_living = "bot"
	icon_dead = "bot"
	gender = NEUTER
	health = 50
	maxHealth = 50
	harm_intent_damage = 15
	melee_damage_lower = 10
	melee_damage_upper = 20
	attacktext = "clawed"
	projectilesound = 'sound/weapons/gunshot/gunshot_pistol.ogg'
	projectiletype = /obj/item/projectile/hivebotbullet
	faction = "hivebot"
	min_gas = null
	max_gas = null
	minbodytemp = 0
	speed = 2
	break_stuff_probability = 30
	attack_delay = 4

	universal_speak = 1
	universal_understand = 1
	see_in_dark = 6
	bleed_colour = SYNTH_BLOOD_COLOUR


/mob/living/simple_animal/hostile/hivebot/New()
	..()

	verbs += /mob/living/proc/ventcrawl

/mob/living/simple_animal/hostile/hivebot/emp_act(severity)
	health -= rand(10,25) * (severity + 1)
	Life()

/mob/living/simple_animal/hostile/hivebot/range
	name = "Hivebot"
	desc = "A smallish robot, this one is armed!"
	icon_state = "smallbot"
	icon_living = "smallbot"
	icon_dead = "smallbot"
	harm_intent_damage = 4
	melee_damage_lower = 3
	melee_damage_upper = 5
	ranged = 1
	attack_delay = 6

/mob/living/simple_animal/hostile/hivebot/rapid
	icon_state = "smallbot"
	icon_living = "smallbot"
	icon_dead = "smallbot"
	harm_intent_damage = 4
	melee_damage_lower = 3
	melee_damage_upper = 5
	ranged = 1
	rapid = 1
	attack_delay = 6

///mob/living/simple_animal/hostile/hivebot/replicator
//	name = "Hivebot"
//	desc = "A strange robot, but it is not armed. Strange."
//	icon_state = "Repbot"
//	icon_living = "Repbot"
//	icon_dead = "Repbot"
//	health = 100
//	harm_intent_damage = 7
//	melee_damage_lower = 5
//	melee_damage_upper = 10
//	var/junk = 0
//	var/signal = 1

///mob/living/simple_animal/hostile/hivebot/proc/add_glow()
//	var/image/eye_glow = image(icon,"glow-bot")
//	eye_glow.plane = EFFECTS_ABOVE_LIGHTING_PLANE
//	eye_glow.layer = EYE_GLOW_LAYER
//	overlays += eye_glow
//	set_light(-10, 0.1, 3, l_color = "#ffffff")

/mob/living/simple_animal/hostile/hivebot/strong
	name = "Strong Hivebot"
	desc = "A bad robot, this one is armed and looks tough!"
	icon_state = "bigbot"
	icon_living = "bigbot"
	icon_dead = "bigbot"
	health = 200
	maxHealth = 200
	harm_intent_damage = 35
	melee_damage_lower = 30
	melee_damage_upper = 40
	ranged = 1
	can_escape = 1

	break_stuff_probability = 60
	attack_delay = 7
	speed = 2
//	holder_type = /obj/item/weapon/holder/hivebot

//obj/item/weapon/holder/hivebot
//	w_class = ITEM_SIZE_TINY

//mob/living/simple_animal/hostile/hivebot/storng/proc/add_glow()
//	image/eye_glow = image(icon,"glow-strong")
//	eye_glow.plane = EFFECTS_ABOVE_LIGHTING_PLANE
//	eye_glow.layer = EYE_GLOW_LAYER
//	overlays += eye_glow
//	set_light(-10, 0.1, 3, l_color = "#ffffff")


//mob/living/simple_animal/hostile/hivebot/strong/Life()
//	..()
//	if(healths)
//		switch(health)
//			if(250 to INFINITY)		healths.icon_state = "health0"
//			if(208 to 249)			healths.icon_state = "health1"
//			if(167 to 207)			healths.icon_state = "health2"
//			if(125 to 166)			healths.icon_state = "health3"
//			if(84 to 124)			healths.icon_state = "health4"
//			if(42 to 83)			healths.icon_state = "health5"
//			if(1 to 41)				healths.icon_state = "health6"
//			else					healths.icon_state = "health7"

/mob/living/simple_animal/hostile/hivebot/strong/mind_initialize()
	..()
	speed = -1
//mob/living/simple_animal/hostile/hivebot/strong/proc/shootAt(var/atom/movable/target)
//	var/turf/T = get_turf(src)
//	var/turf/U = get_turf(target)
//	if(!T || !U)
//		return
//	var/obj/item/projectile/hivebotbullet/A = new /obj/item/projectile/hivebotbullet(loc)
//	playsound(src.loc, 'sound/weapons/gunshot/gunshot_pistol.ogg', 75, 1)
//	A.launch(T, U)
//	return

/mob/living/simple_animal/hostile/hivebot/CanPass(atom/movable/O)
	if(istype(O, /obj/item/projectile/hivebotbullet))//Allows for swarmers to fight as a group without wasting their shots hitting each other
		return 1
	if(istype(O, /mob/living/simple_animal/hostile/hivebot))
		return 1
	..()


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
				//new /mob/living/simple_animal/hostile/hivebot/replicator(get_turf(src))
				new /mob/living/simple_animal/hostile/hivebot/strong(get_turf(src))
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
		if(do_mob(src, src, 30))
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
/mob/living/simple_animal/hostile/hivebot/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"speaks from a broken speaker:EX7erm1N47E!")

//mob/living/simple_animal/hostile/hivebot/replicator/AttackingTarget(var/atom/target)
//	if(istype(target, /obj/effect/decal/cleanable/blood/gibs/robot))
//		custom_emote(1,"speaks from a broken speaker:4221M1l473D!")
//		qdel(target)
//		junk = junk + 1

///mob/living/simple_animal/hostile/hivebot/replicator/Life()
//	. = ..()
//	while(junk < 0)
//		new /mob/living/simple_animal/hostile/hivebot/tele(get_turf(src))
//	spawn(30)
//		visible_message("<span class='boldannounce'>The [src] gathered in the beacon!</span>")
//		playsound(src.loc, 'sound/effects/EMPulse.ogg', 25, 1)
//		qdel(src)
//		new /mob/living/simple_animal/hostile/hivebot/tele(src.loc)
//mob/living/simple_animal/hostile/hivebot/replicator/proc/createbots()
//	visible_message("<span class='danger'>The [src] building something!</span>")
//	while(signal > 0)
//		signal--
//		new /mob/living/simple_animal/hostile/hivebot/tele(get_turf(src))
//		new /mob/living/simple_animal/hostile/hivebot(get_turf(src))
//		new /mob/living/simple_animal/hostile/hivebot(get_turf(src))
//	spawn(30)
//		visible_message("<span class='boldannounce'>The [src] gathered in the beacon!</span>")
//		playsound(src.loc, 'sound/effects/EMPulse.ogg', 25, 1)
//		qdel(src)
//		return