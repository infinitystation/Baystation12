//Bitflag defines are in setup.dm. Referenced here.

#define AMMO_EXPLOSIVE 		1
#define AMMO_XENO_ACID 		2
#define AMMO_XENO_TOX		4
#define AMMO_ENERGY 		8
#define AMMO_ROCKET			16
#define AMMO_SNIPER			32
#define AMMO_INCENDIARY		64
#define AMMO_SKIPS_HUMANS	128
#define AMMO_SKIPS_ALIENS 	256
#define AMMO_IS_SILENCED 	512
#define AMMO_IGNORE_ARMOR	1024
#define AMMO_IGNORE_RESIST	2048
#define AMMO_BALLISTIC		4096


#define DEBUG_STAGGER_SLOWDOWN	0

/datum/ammo
	var/name 		= "generic bullet"
	var/icon 		= 'infinity/icons/obj/items/projectiles.dmi'
	var/icon_state 	= "bullet"
	var/hud_state   = "unknown"  //Bullet type on the Ammo HUD
	var/hud_state_empty = "unknown"
	var/ping 		= "ping_b" //The icon that is displayed when the bullet bounces off something.
	var/sound_hit //When it deals damage.
	var/sound_armor //When it's blocked by human armor.
	var/sound_miss //When it misses someone.
	var/sound_bounce //When it bounces off something.

	var/iff_signal					= 0 		// PLACEHOLDER. Bullets that can skip friendlies will call for this
	var/accuracy 					= 0 		// This is added to the bullet's base accuracy
	var/accuracy_var_low			= 0 		// How much the accuracy varies when fired
	var/accuracy_var_high			= 0
	var/accurate_range 				= 0 		// For most guns, this is where the bullet dramatically looses accuracy. Not for snipers though
	var/accurate_range_min 			= 0			// Snipers use this to simulate poor accuracy at close ranges
	var/point_blank_range			= 0			// Weapons will get a large accuracy buff at this short range
	var/max_range 					= 0 		// This will de-increment a counter on the bullet
	var/scatter  					= 0 		// How much the ammo scatters when burst fired, added to gun scatter, along with other mods
	var/damage 						= 0 		// This is the base damage of the bullet as it is fired
	var/damage_var_low				= 0 		// Same as with accuracy variance
	var/damage_var_high				= 0
	var/damage_falloff 				= 0 		// How much damage the bullet loses per turf traveled
	var/damage_type 				= BRUTE 	// BRUTE, BURN, TOX, OXY, CLONE are the only things that should be in here
	var/penetration					= 0 		// How much armor it ignores before calculations take place
	var/shrapnel_chance 			= 0 		// The % chance it will imbed in a human
	var/shell_speed 				= 0 		// How fast the projectile moves
	var/bonus_projectiles_type 					// Type path of the extra projectiles
	var/bonus_projectiles_amount 	= 0 		// How many extra projectiles it shoots out. Works kind of like firing on burst, but all of the projectiles travel together
	var/debilitate[]				= null 		// Stun,knockdown,knockout,irradiate,stutter,eyeblur,drowsy,agony
	var/list/ammo_reagents			= null		// Type of reagent transmitted by the projectile on hit.
	var/barricade_clear_distance	= 1			// How far the bullet can travel before incurring a chance of hitting barricades; normally 1.
	var/armor_type					= "bullet"	// Does this have an override for the armor type the ammo should test? Bullet by default
	var/flags_ammo_behavior = 0

/datum/ammo/New()
		accuracy 			= config.min_hit_accuracy 	// This is added to the bullet's base accuracy.
		accuracy_var_low	= config.min_proj_variance	// How much the accuracy varies when fired.
		accuracy_var_high	= config.min_proj_variance
		accurate_range 		= config.close_shell_range	// For most guns, this is where the bullet dramatically looses accuracy. Not for snipers though.
		max_range 			= config.norm_shell_range	// This will de-increment a counter on the bullet.
		damage_var_low		= config.min_proj_variance  // Same as with accuracy variance.
		damage_var_high		= config.min_proj_variance
		damage_falloff 		= config.reg_damage_falloff 	// How much damage the bullet loses per turf traveled.
		shell_speed 		= config.slow_shell_speed 	// How fast the projectile moves.

/datum/ammo/proc/do_at_half_range(obj/item/projectile/P)
	return

/datum/ammo/proc/do_at_max_range(obj/item/projectile/P)
	return

/datum/ammo/proc/on_shield_block(mob/M, obj/item/projectile/P) //Does it do something special when shield blocked? Ie. a flare or grenade that still blows up.
	return

/datum/ammo/proc/on_hit_turf(turf/T, obj/item/projectile/P) //Special effects when hitting dense turfs.
	return

/datum/ammo/proc/on_hit_mob(mob/M, obj/item/projectile/P) //Special effects when hitting mobs.
	return

/datum/ammo/proc/on_hit_obj(obj/O, obj/item/projectile/P) //Special effects when hitting objects.
	return

/datum/ammo/proc/knockback(mob/M, obj/item/projectile/P, var/max_range = 2)
	if(!M || M == P.firer)
		return
	if(P.distance_travelled > max_range || M.lying) shake_camera(M, 2, 1) //Three tiles away or more, basically.

	else //Two tiles away or less.
		shake_camera(M, 3, 4)
		if(isliving(M)) //This is pretty ugly, but what can you do.
			var/mob/living/target = M
			target.apply_effects(1,2) //Humans get stunned a bit.
			to_chat(target, "<span class='highdanger'>The blast knocks you off your feet!</span>")
		step_away(M,P)

/datum/ammo/proc/staggerstun(mob/M, obj/item/projectile/P, var/max_range = 2, var/stun = 0, var/weaken = 1, var/stagger = 2, var/slowdown = 1, var/knockback = 1, var/shake = 1, var/soft_size_threshold = 3, var/hard_size_threshold = 2)
	if(!M || M == P.firer)
		return
	if(shake && (P.distance_travelled > max_range || M.lying))
		shake_camera(M, shake+1, shake)
		return
	if(!isliving(M))
		return
	var/impact_message = ""
	if(shake)
		shake_camera(M, shake+2, shake+3)
		impact_message += "<span class='warning'>You are shaken by the sudden impact!</span>"

	//Check for and apply hard CC.
	if(ishuman(M) && hard_size_threshold > 0)
		var/mob/living/L = M
		if(!L.stunned && !L.weakened) //Prevent chain stunning.
			L.apply_effects(stun,weaken)
		if(knockback)
			impact_message += "<span class='highdanger'>The blast knocks you off your feet!</span>"
			for(var/i=0, i<knockback, i++)
				step_away(M,P)
	to_chat(M, "[impact_message]") //Summarize all the bad shit that happened
/datum/ammo/proc/area_stagger_burst(turf/Center, obj/item/projectile/P, var/max_range = 2, var/stun = 0, var/weaken = 1, var/stagger = 2, var/slowdown = 1, var/knockback = 1, var/shake = 1, var/soft_size_threshold = 3, var/hard_size_threshold = 2)	//by Jeser specifically for autocannon. Mix of Burst() and Stagger(): Deals damage in area + applies stagger to mobs in area
	if(!Center || !P)
		return
	for(var/mob/living/carbon/M in range(1,Center))
		M.visible_message("<span class='danger'>[M] got a concussion from \a [P.name]!</span>","<span class='highdanger'>You are concussed from \a </b>[P.name] explosion</b>!</span>")
		M.apply_damage(rand(10,P.damage/2))
		staggerstun(M, P, max_range, stun, weaken, stagger, slowdown, knockback, shake, soft_size_threshold, hard_size_threshold)

/datum/ammo/proc/burst(atom/target, obj/item/projectile/P, damage_type = BRUTE, radius = 1, modifier = 0.5, attack_type = "bullet", apply_armor = TRUE)
	if(!target || !P)
		return
	for(var/mob/living/carbon/M in orange(radius,target))
		if(P.firer == M)
			continue
		M.visible_message("<span class='danger'>[M] is hit by backlash from \a [P.name]!</span>","<span class='highdanger'>You are hit by backlash from \a </b>[P.name]</b>!</span>")
		if(apply_armor)
			var/armor_block = M.run_armor_check(M, attack_type)
			M.apply_damage(rand(P.damage * modifier * 0.1,P.damage * modifier),damage_type, null, armor_block)
		else
			M.apply_damage(rand(P.damage * modifier * 0.1,P.damage * modifier),damage_type)


/datum/ammo/proc/fire_bonus_projectiles(obj/item/projectile/original_P)
	set waitfor = 0
	var/i
	for(i = 1 to bonus_projectiles_amount) //Want to run this for the number of bonus projectiles.
		var/obj/item/projectile/P = new /obj/item/projectile(original_P.shot_from)
		P.generate_bullet(GLOB.ammo_list[bonus_projectiles_type]) //No bonus damage or anything.
		var/turf/new_target = null

		P.scatter = round(P.scatter - (initial(original_P.scatter) - original_P.scatter) ) //if the gun changes the scatter of the main projectile, it also affects the bonus ones.

		if(prob(P.scatter))
			var/scatter_x = rand(-1,1)
			var/scatter_y = rand(-1,1)
			new_target = locate(original_P.target_turf.x + round(scatter_x),original_P.target_turf.y + round(scatter_y),original_P.target_turf.z)
			if(!istype(new_target) || isnull(new_target))
				continue	//If we didn't find anything, make another pass.
			P.original = new_target

		P.accuracy = round(P.accuracy * original_P.accuracy/initial(original_P.accuracy)) //if the gun changes the accuracy of the main projectile, it also affects the bonus ones.

		if(!new_target)
			new_target = original_P.target_turf
		P.fire_at(new_target,original_P.firer,original_P.shot_from,P.ammo.max_range,P.ammo.shell_speed) //Fire!

	//This is sort of a workaround for now. There are better ways of doing this ~N.
/datum/ammo/proc/stun_living(mob/living/target, obj/item/projectile/P) //Taser proc to stun folks.
	if(istype(target))
		target.apply_effects(12,20)
	
/datum/ammo/proc/set_smoke()
	return

/datum/ammo/proc/drop_nade(turf/T)
	return


/*
//================================================
					Default Ammo
//================================================
*/
//Only when things screw up do we use this as a placeholder.

/datum/ammo/bullet
	name = "default bullet"
	icon_state = "bullet"
	flags_ammo_behavior = AMMO_BALLISTIC
	sound_hit 	 = "ballistic_hit"
	sound_armor  = "ballistic_armor"
	sound_miss	 = "ballistic_miss"
	sound_bounce = "ballistic_bounce"
	point_blank_range = 2
	accurate_range_min = 0

/datum/ammo/bullet/New()
	..()
	damage = config.base_hit_damage
	shrapnel_chance = config.low_shrapnel_chance
	shell_speed = config.super_shell_speed

/*
//================================================
					Rocket Ammo
//================================================
*/

/datum/ammo/rocket
	name = "high explosive rocket"
	icon_state = "missile"
	hud_state = "rocket_he"
	hud_state_empty = "rocket_empty"
	ping = null //no bounce off.
	sound_bounce	= "rocket_bounce"
	damage_falloff = 0
	flags_ammo_behavior = AMMO_EXPLOSIVE|AMMO_ROCKET
	armor_type = "bomb"

/datum/ammo/rocket/New()
	. = ..()
	accuracy = config.max_hit_accuracy
	accurate_range = config.norm_shell_range
	max_range = config.long_shell_range
	damage = config.med_hit_damage
	penetration = config.max_armor_penetration
	shell_speed = config.slow_shell_speed

/datum/ammo/rocket/drop_nade(turf/T)
	explosion(T, -1, 2, 4, 5)

/datum/ammo/rocket/on_hit_mob(mob/M, obj/item/projectile/P)
	drop_nade(get_turf(M))

/datum/ammo/rocket/on_hit_obj(obj/O, obj/item/projectile/P)
	drop_nade(get_turf(O))

/datum/ammo/rocket/on_hit_turf(turf/T, obj/item/projectile/P)
	drop_nade(T)

/datum/ammo/rocket/do_at_max_range(obj/item/projectile/P)
	drop_nade(get_turf(P))

/datum/ammo/rocket/autocannon
	name = "autocannon round"
	icon_state = "autocannon_ap"
	iff_signal = 1
	flags_ammo_behavior = AMMO_EXPLOSIVE|AMMO_ROCKET|AMMO_SKIPS_HUMANS

/datum/ammo/rocket/autocannon/New()
	..()
	accuracy = config.med_hit_accuracy
	accurate_range = config.long_shell_range
	max_range = config.max_shell_range
	damage = config.hlow_hit_damage
	penetration = config.mlow_armor_penetration
	shell_speed = config.fast_shell_speed

/datum/ammo/rocket/autocannon/scr
	name = "autocannon round"
	icon_state = "autocannon_scr"

/datum/ammo/rocket/autocannon/scr/on_hit_mob(mob/M, obj/item/projectile/P)
	staggerstun(M, P, config.max_shell_range, 0, 0, 3, 7, 0, 1, 3, 2)

/datum/ammo/rocket/autocannon/scr/on_hit_obj(obj/O, obj/item/projectile/P)
	area_stagger_burst(get_turf(P), P, 0, 0, 3, 5, 0, 1, 3, 2)

/datum/ammo/rocket/autocannon/scr/on_hit_turf(turf/T, obj/item/projectile/P)
	area_stagger_burst(get_turf(P), P, 0, 0, 3, 5, 0, 1, 3, 2)

/datum/ammo/rocket/autocannon/scr/do_at_max_range(obj/item/projectile/P)
	area_stagger_burst(get_turf(P), P, 0, 0, 3, 5, 0, 1, 3, 2)

/datum/ammo/rocket/autocannon/scr/apc
	name = "autocannon round"
	icon_state = "autocannon_scr_apc"