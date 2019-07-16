
//Some debug variables. Toggle them to 1 in order to see the related debug messages. Helpful when testing out formulas.
#define DEBUG_HIT_CHANCE	0
#define DEBUG_HUMAN_DEFENSE	0
#define DEBUG_XENO_DEFENSE	0
#define DEBUG_CREST_DEFENSE	0

//The actual bullet objects.
/obj/item/projectile
	name = "projectile"
	icon_state = "bullet"
	density = FALSE
	anchored = TRUE //You will not have me, space wind!
	mouse_opacity = 0
	invisibility = 100 // We want this thing to be invisible when it drops on a turf because it will be on the user's turf. We then want to make it visible as it travels.
	layer = FLY_LAYER

	var/datum/ammo/ammo //The ammo data which holds most of the actual info.

	var/turf/target_turf = null

	var/turf/path[]  	 = null

	var/accuracy = 85 //Base projectile accuracy. Can maybe be later taken from the mob if desired.

	var/damage_falloff = 0 //how many damage point the projectile loses per tiles travelled

	var/scatter = 0

	var/distance_travelled = 0
	var/in_flight = 0

	var/projectile_speed = 0
	var/armor_type = null

/obj/item/projectile/New()
	. = ..()
	path = list()
	permutated = list()

/obj/item/projectile/Destroy()
	in_flight = 0
	ammo = null
	shot_from = null
	original = null
	target_turf = null
	starting = null
	permutated = null
	path = null
	return ..()

/obj/item/projectile/Bumped(atom/A as mob|obj|turf|area)
	if(A && !A in permutated)
		scan_a_turf(A.loc)

/obj/item/projectile/Crossed(AM as mob|obj)
	if(AM && !AM in permutated)
		scan_a_turf(get_turf(AM))

/obj/item/projectile/proc/generate_bullet(ammo_datum, bonus_damage = 0, reagent_multiplier = 0)
	ammo 		= ammo_datum
	name 		= ammo.name
	icon_state 	= ammo.icon_state
	damage 		= ammo.damage + bonus_damage //Mainly for emitters.
	scatter		= ammo.scatter
	accuracy   += ammo.accuracy
	accuracy   *= rand(config.proj_variance_low-ammo.accuracy_var_low, config.proj_variance_high)+ammo.accuracy_var_high * config.proj_base_accuracy_mult//Rand only works with integers.
	damage     *= rand(config.proj_variance_low-ammo.damage_var_low, config.proj_variance_high+ammo.damage_var_high) * config.proj_base_damage_mult
	damage_falloff = ammo.damage_falloff
	armor_type = ammo.armor_type

//Target, firer, shot from. Ie the gun
/obj/item/projectile/proc/fire_at(atom/target,atom/F, atom/S, range = 30,speed = 1)
	projectile_speed += speed
	if(!original) original = target
	if(!loc) loc = get_turf(F)
	starting = get_turf(src)
	if(starting != loc) loc = starting //Put us on the turf, if we're not.
	target_turf = get_turf(target)
	if(!target_turf || target_turf == starting) //This shouldn't happen, but it can.
		qdel(src)
		return
	firer = F
	if(F) permutated += F //Don't hit the shooter (firer)
	permutated += src //Don't try to hit self.
	shot_from = S
	in_flight = 1

	set_dir(get_dir(loc, target_turf))

	//If we have the the right kind of ammo, we can fire several projectiles at once.
	if(ammo.bonus_projectiles_amount && ammo.bonus_projectiles_type) ammo.fire_bonus_projectiles(src)

	path = getline(starting,target_turf)

	var/change_x = target_turf.x - starting.x
	var/change_y = target_turf.y - starting.y

	var/angle = round(Get_Angle(starting,target_turf))

	var/matrix/rotate = matrix() //Change the bullet angle.
	rotate.Turn(angle)
	src.transform = rotate

	follow_flightpath(projectile_speed,change_x,change_y,range) //pyew!

/obj/item/projectile/proc/each_turf(speed = 1)
	var/new_speed = speed
	distance_travelled++
	if(invisibility && distance_travelled > 1) invisibility = 0 //Let there be light (visibility).
	if(distance_travelled == round(ammo.max_range / 2) && loc) ammo.do_at_half_range(src)
	if(ammo.flags_ammo_behavior & AMMO_ROCKET) //Just rockets for now. Not all explosive ammo will travel like this.
		switch(speed) //Get more speed the longer it travels. Travels pretty quick at full swing.
			if(1)
				if(distance_travelled > 2) new_speed++
			if(2)
				if(distance_travelled > 8) new_speed++
	return new_speed //Need for speed.

/obj/item/projectile/proc/follow_flightpath(speed = 1, change_x, change_y, range) //Everytime we reach the end of the turf list, we slap a new one and keep going.
	set waitfor = 0

	var/dist_since_sleep = 5 //Just so we always see the bullet.

	var/turf/current_turf = get_turf(src)
	var/turf/next_turf
	var/this_iteration = 0
	in_flight = 1
	for(next_turf in path)
		if(!loc || gc_destroyed || !in_flight) return

		if(distance_travelled >= range)
			ammo.do_at_max_range(src)
			qdel(src)
			return

		var/proj_dir = get_dir(current_turf, next_turf)
		if(proj_dir & (proj_dir-1)) //diagonal direction
			if(!current_turf.Adjacent(next_turf)) //we can't reach the next turf
				ammo.on_hit_turf(current_turf,src)
				current_turf.bullet_act(src)
				in_flight = 0
				sleep(0)
				qdel(src)
				return

		if(scan_a_turf(next_turf)) //We hit something! Get out of all of this.
			in_flight = 0
			sleep(0)
			qdel(src)
			return

		loc = next_turf
		speed = each_turf(speed)

		this_iteration++
		if(++dist_since_sleep >= speed)
			//TO DO: Adjust flight position every time we see the projectile.
			//I wonder if I can leave sleep out and just have it stall based on adjustment proc.
			//Might still be too fast though.
			dist_since_sleep = 0
			sleep(1)

		current_turf = get_turf(src)
		if(this_iteration == path.len)
			next_turf = locate(current_turf.x + change_x, current_turf.y + change_y, current_turf.z)
			if(current_turf && next_turf)
				path = getline(current_turf,next_turf) //Build a new flight path.
				if(path.len && src) //TODO look into this. This should always be true, but it can fail, apparently, against DCed people who fall down. Better yet, redo this.
					distance_travelled-- //because the new follow_flightpath() repeats the last step.
					follow_flightpath(speed, change_x, change_y, range) //Onwards!
				else
					qdel(src)
					return
			else //To prevent bullets from getting stuck in maps like WO.
				qdel(src)
				return

/obj/item/projectile/proc/scan_a_turf(turf/T)
	// Not a turf, keep moving
	if(!istype(T))
		return FALSE

	if(T.density) // Handle wall hit
		ammo.on_hit_turf(T,src)

		if(T?.loc)
			T.bullet_act(src)

		return TRUE

	// Firer's turf, keep moving
	if(firer && T == firer.loc)
		return FALSE

	// Explosive ammo always explodes on the turf of the clicked target
	if(!QDELETED(src) && ammo.flags_ammo_behavior & AMMO_EXPLOSIVE && T == target_turf)
		ammo.on_hit_turf(T,src)
		if(T?.loc)
			T.bullet_act(src)
		return TRUE

	// Empty turf, keep moving
	if(!length(T.contents))
		return FALSE

	for(var/a in T)
		var/atom/movable/A = a
		// If we've already handled this atom, don't do it again
		if(A in permutated)
			continue

		permutated += A // Don't want to hit them again, no matter what the outcome

		var/hit_chance = A.get_projectile_hit_chance(src) // Calculated from combination of both ammo accuracy and gun accuracy

		if(!hit_chance)
			continue

		if(isobj(A))
			ammo.on_hit_obj(A,src)
			if(A?.loc)
				A.bullet_act(src)
			return TRUE

		if(!isliving(A))
			continue

		var/mob_is_hit = FALSE
		var/mob/living/L = A

		var/hit_roll
		var/critical_miss = rand(config.critical_chance_low, config.critical_chance_high)
		var/i = 0
		while(++i <= 2 && hit_chance > 0) // This runs twice if necessary
			hit_roll 					= rand(0, 99) //Our randomly generated roll
			#if DEBUG_HIT_CHANCE
			to_chat(world, "DEBUG: Hit Chance 1: [hit_chance], Hit Roll: [hit_roll]")
			#endif
			if(hit_roll < 25)
				if(!shot_from)
					def_zone = pick(base_miss_chance)	// Still hit but now we might hit the wrong body part

			if(shot_from)
				hit_chance -= base_miss_chance[def_zone] // Reduce accuracy based on spot.
				#if DEBUG_HIT_CHANCE
				to_chat(world, "Hit Chance 2: [hit_chance]")
				#endif

			switch(i)
				if(1)
					if(hit_chance > hit_roll)
						mob_is_hit = TRUE
						break //Hit
					if( hit_chance < (hit_roll - 20) )
						break //Outright miss.
					def_zone 	  = pick(base_miss_chance) //We're going to pick a new target and let this run one more time.
					hit_chance   -= 10 //If you missed once, the next go around will be harder to hit.
				if(2)
					if(prob(critical_miss) )
						break //Critical miss on the second go around.
					if(hit_chance > hit_roll)
						mob_is_hit = TRUE
						break
		if(mob_is_hit)
			ammo.on_hit_mob(L,src)
			if(L?.loc)
				L.bullet_act(src)
			return TRUE
		else if (!L.lying)
			animatation_displace_reset(L)
			if(ammo.sound_miss) L.playsound_local(get_turf(L), ammo.sound_miss, 75, 1)
			L.visible_message("<span class='avoidharm'>[src] misses [L]!</span>","<span class='avoidharm'>[src] narrowly misses you!</span>", null, 4)

//----------------------------------------------------------
			//				    	\\
			//  HITTING THE TARGET  \\
			//						\\
			//						\\
//----------------------------------------------------------


//returns probability for the projectile to hit us.
/atom/movable/proc/get_projectile_hit_chance(obj/item/projectile/P)
	return 0

//obj version just returns true or false.
/obj/get_projectile_hit_chance(obj/item/projectile/P)
	if(!density)
		return FALSE

	if(layer >= OBJ_LAYER || src == P.original)
		return TRUE

/obj/item/projectile/proc/play_damage_effect(mob/M)
	if(ammo.sound_hit) playsound(M, ammo.sound_hit, 50, 1)
	if(M.stat != DEAD) animation_flash_color(M)

//----------------------------------------------------------
				//				    \\
				//    OTHER PROCS	\\
				//					\\
				//					\\
//----------------------------------------------------------

/mob/dead/bullet_act(/obj/item/projectile/P)
	return


//----------------------------------------------------------
					//				    \\
					//    OTHER PROCS	\\
					//					\\
					//					\\
//----------------------------------------------------------


//This is where the bullet bounces off.
/atom/proc/bullet_ping(obj/item/projectile/P)
	if(!P || !P.ammo.ping) return
	if(prob(65))
		if(P.ammo.sound_bounce) playsound(src, P.ammo.sound_bounce, 50, 1)
		var/image/I = image('infinity/icons/obj/items/projectiles.dmi',src,P.ammo.ping,10)
		var/angle = (P.firer && prob(60)) ? round(Get_Angle(P.firer,src)) : round(rand(1,359))
		I.pixel_x += rand(-6,6)
		I.pixel_y += rand(-6,6)

		var/matrix/rotate = matrix()
		rotate.Turn(angle)
		I.transform = rotate
		flick_overlay_view(I, src, 3)

/mob/living/proc/bullet_message(obj/item/projectile/P)
	if(!P) return

	if(P.ammo.flags_ammo_behavior & AMMO_IS_SILENCED)
		to_chat(src, "<span class='highdanger'>You've been shot in the [parse_zone(P.def_zone)] by [P.name]!</span>")
	else
		visible_message("<span class='danger'>[name] is hit by the [P.name] in the [parse_zone(P.def_zone)]!</span>", \
						"<span class='highdanger'>You are hit by the [P.name] in the [parse_zone(P.def_zone)]!</span>", null, 4)

//Abby -- Just check if they're 1 tile horizontal or vertical, no diagonals
/proc/get_adj_simple(atom/Loc1,atom/Loc2)
	var/dx = Loc1.x - Loc2.x
	var/dy = Loc1.y - Loc2.y

	if(dx == 0) //left or down of you
		if(dy == -1 || dy == 1)
			return 1
	if(dy == 0) //above or below you
		if(dx == -1 || dx == 1)
			return 1

#undef DEBUG_HIT_CHANCE
#undef DEBUG_HUMAN_DEFENSE
#undef DEBUG_XENO_DEFENSE
