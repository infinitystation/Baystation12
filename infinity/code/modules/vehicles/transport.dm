
//NOT bitflags, just global constant values
#define HDPT_PRIMARY "primary"
#define HDPT_WHEELS "wheels"

//Percentages of what hardpoints take what damage, e.g. armor takes 37.5% of the damage
var/list/apc_dmg_distributions = list(
	HDPT_PRIMARY = 0.65,
	HDPT_WHEELS = 0.35)

/client/proc/remove_players_from_apc()
	set name = "Eject ALL from APC (emergency only)"
	set category = "Admin"

	for(var/obj/vehicle_infinity/multitile/root/transport/CT in view())
		CT.remove_all_players()
		log_admin("[src] forcibly removed all players from [CT]")
		message_admins("[src] forcibly removed all players from [CT]")

//The main object, should be an abstract class
/obj/vehicle_infinity/multitile/root/transport
	name = "Armored Vehicle"
	desc = "Get inside to operate the vehicle."
	hitbox_type = /obj/vehicle_infinity/multitile/hitbox/transport //Used for emergencies and respawning hitboxes

	//What slots the vehicle can have
	var/list/hardpoints = list(HDPT_PRIMARY)

	//The next world.time when the APC can move
	var/next_move = 0

	//Below are vars that can be affected by hardpoints, generally used as ratios or decisecond timers

	move_delay = 50 //no or broken wheels speed delay will be 30, otherwise -
	unacidable = 1
	var/active_hp

	//list of damag distribution among all installed AND not broken hardpoint modules
	var/list/dmg_distribs = list(
		HDPT_PRIMARY = 0.65,
		HDPT_WHEELS = 0.35)

	//Changes cooldowns and accuracies
	var/list/misc_ratios = list(
		"prim_acc" = 1.0,
		"prim_cool" = 1.0)

	//Percentage accuracies for slot
	var/list/accuracies = list(
		"primary" = 0.97)

	//Changes how much damage the APC takes. Since APC has no armor module, it has some basic resistances
	var/list/dmg_multipliers = list(
		"all" = 1.0,	//for when you want to make it invincible
		"acid" = 0.8,
		"slash" = 0.7,
		"bullet" = 0.5,
		"explosive" = 0.9,
		"blunt" = 0.6,
		"abstract" = 1.0) //abstract for when you just want to hurt it

	//Decisecond cooldowns for the slots
	var/list/cooldowns = list(
		"primary" = 300)

	//Which hardpoints need to be repaired before the module can be replaced
	var/list/damaged_hps = list()

	//Placeholders
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "cargo_engine"
/obj/vehicle_infinity/multitile/root/transport/Destroy()
	for(var/i in linked_objs)
		var/obj/O = linked_objs[i]
		if(O == src) continue
		qdel(O, 1) //Delete all of the hitboxes etc

	. = ..()

//What to do if all ofthe installed modules have been broken
/obj/vehicle_infinity/multitile/root/transport/proc/handle_all_modules_broken()
	return

/obj/vehicle_infinity/multitile/root/transport/proc/deactivate_all_hardpoints()
	var/list/slots = get_activatable_hardpoints()
	for(var/slot in slots)
		var/obj/item/hardpoint/apc/HP = hardpoints[slot]
		if(!HP) continue
		HP.deactivate()

/obj/vehicle_infinity/multitile/root/transport/proc/remove_all_players()
	return


//The basic vehicle code that moves the APC, with movement delay implemented

/obj/vehicle_infinity/multitile/root/transport/relaymove(mob/user, direction)
	if(world.time < next_move) return

	next_move = world.time + move_delay

	return ..()

//Same thing but for rotations
/obj/vehicle_infinity/multitile/root/transport/try_rotate(deg, mob/user, force = 0)
	if(world.time < next_move && !force) return

	next_move = world.time + move_delay * (force ? 2 : 3)

	return ..()

/obj/vehicle_infinity/multitile/root/transport/proc/can_use_hp(mob/M)
	return 1

//No one but the gunner can gun
//And other checks to make sure you aren't breaking the law
/obj/vehicle_infinity/multitile/root/transport/apc/handle_click(mob/living/carbon/human/user, atom/A, list/params)

	if(usr.in_throw_mode)
		usr.drop_item()
		return
	
	var/list/mods = params2list(params)
	if (mods["shift"])		//finally fixed shift-clicking in apc.
		A.examine(user)
		return

	if(!can_use_hp(user)) return

	if(!hardpoints.Find(active_hp))
		to_chat(user, "<span class='warning'>Please select an active hardpoint first.</span>")
		return

	var/obj/item/hardpoint/apc/HP = hardpoints[active_hp]

	if(!HP)
		return

	if(!HP.is_ready())
		return

	if(!HP.firing_arc(A))
		to_chat(user, "<span class='warning'>The target is not within your firing arc.</span>")
		return

	HP.active_effect(get_turf(A))

//Used by the gunner to swap which module they are using
//e.g. from the minigun to the smoke launcher
//Only the active hardpoint module can be used
/obj/vehicle_infinity/multitile/root/transport/verb/switch_active_hp()
	set name = "W Change Active Weapon"
	set category = "Vehicle"	//changed verb category to new one, because Object category is bad.
	set src = usr.loc

	if(!can_use_hp(usr))
		return

	var/mob/living/carbon/human/M = usr
	var/obj/item/weapon/card/id/I = M.wear_id
	if(I && I.rank == "Synthetic" && I.registered_name == M.real_name)
		to_chat(usr, "<span class='notice'>Your programm doesn't allow operating [src] weapons.</span>")
		return

	var/list/slots = get_activatable_hardpoints()

	if(!slots.len)
		to_chat(usr, "<span class='warning'>All of the modules can't be activated or are broken.</span>")
		return

	var/slot = input("Select a slot.") in slots

	var/obj/item/hardpoint/apc/HP = hardpoints[slot]
	if(!HP)
		to_chat(usr, "<span class='warning'>There's nothing installed on that hardpoint.</span>")

	deactivate_binos(usr)
	active_hp = slot
	to_chat(usr, "<span class='notice'>You select the [HP.name].</span>")
	if(isliving(usr))
		M.set_interaction(src)

//anti-binoculars exploit fix
/obj/vehicle_infinity/multitile/root/transport/proc/deactivate_binos(var/mob/user)
	for(var/obj/item/device/binoculars/BN in user.contents)
		if(BN.zoom)
			to_chat(usr, "<span class='warning'>You realize using [BN.name] and operating APC weapons at the same time is impossible!</span>")
			BN.zoom(user)


//verb shows only to TCs status update on their APC including: ammo and backup clips in weapons and combined health of all modules showed in %
/obj/vehicle_infinity/multitile/root/transport/verb/apc_status()
	set name = "G Check Vehicle Status"
	set category = "Vehicle"	//changed verb category to new one, because Object category is bad.
	set src = usr.loc

	var/obj/item/hardpoint/apc/HP1 = hardpoints[HDPT_WHEELS]
	var/obj/item/hardpoint/apc/HP4 = hardpoints[HDPT_PRIMARY]
	var divider = 0
	var apc_health = 0
	//if(HP1 != null && HP2 != null && HP3 != null && HP4 != null && HP5 != null))
	//	apc_health = round((HP1.health + HP2.health + HP3.health + HP4.health + HP5.health) * 100 / (HP1.maxhealth + HP2.maxhealth + HP3.maxhealth + HP4.maxhealth + HP5.maxhealth))
	//First version of formula. Doesn't work if any of modules is absent or took too much damage (admin magic)
	if (HP1)
		if(HP1.health > 0)
			apc_health += HP1.health
		divider += abs(HP1.maxhealth)
	if (HP4)
		if(HP4.health > 0)
			apc_health += HP4.health
		divider += abs(HP4.maxhealth)

	if(divider == 0)
		apc_health = round(apc_health * 100 / (divider + 1))
	else
		apc_health = round(apc_health * 100 / (divider))

	if(apc_health <= 5)
		to_chat(usr, "<span class='warning'>Warning! Systems failure, eject!</span><br>")
		return

	to_chat(usr, "<span class='warning'>Vehicle Status:</span><br>")
	to_chat(usr, "<span class='warning'>Overall vehicle integrity: [apc_health] percent.</span>")

	if(HP4 == null || HP4.health <= 0)
		to_chat(usr, "<span class='warning'>Primary weapon: Unavailable.</span>")
	else
		if(HP4.clips.len <= 0)
			to_chat(usr, "<span class='warning'>Primary weapon: [HP4.name]. Ammo: 0/0. 0/0 spare magazines available.</span>")
		else
			to_chat(usr, "<span class='warning'>Primary weapon: [HP4.name]. Ammo: [HP4.clips[1].current_rounds]/[HP4.clips[1].max_ammo]. [HP4.clips.len - 1]/[HP4.max_clips - 1] spare magazines available.</span>")

/obj/vehicle_infinity/multitile/root/transport/verb/reload_hp()
	set name = "W Reload Weapon"
	set category = "Vehicle"	//changed verb category to new one, because Object category is bad.
	set src = usr.loc

	if(!can_use_hp(usr)) return

	//TODO: make this a proc so I don't keep repeating this code
	var/list/slots = get_activatable_hardpoints()

	if(!slots.len)
		to_chat(usr, "<span class='warning'>All of the modules can't be reloaded or are broken.</span>")
		return

	var/answer = alert(usr, "Are you sure you want to reload?", , "Yes", "No") // added confirmation window, because you can't cancel reload once list of modules shows up
	if(answer == "No")
		return

	var/slot = input("Select a slot.") in slots

	var/obj/item/hardpoint/apc/HP = hardpoints[slot]
	if(HP.clips.len < 1)
		to_chat(usr, "<span class='warning'>[HP.name] has no clips left in it!</span>")
		return

	to_chat(usr, "<span class='notice'>You begin emptying [HP.name].</span>")

	sleep(20)
	var/obj/item/ammo_magazine/A = HP.clips[1]
	HP.clips[1].Move(entrance.loc)	//LISTS START AT 1 REEEEEEEEEEEE
	HP.clips[1].update_icon()
	HP.clips.Remove(A)
	if(HP.clips.len > 0)
		to_chat(usr, "<span class='notice'>You reload the [HP.name].</span>")
	else
		to_chat(usr, "<span class='notice'>You empty the [HP.name].</span>")
	//(src, 'sound/weapons/gun_mortar_unpack.ogg', 40, 1)

/obj/vehicle_infinity/multitile/root/transport/proc/get_activatable_hardpoints()
	var/list/slots = list()
	if(hardpoints.len)
		for(var/slot in hardpoints)
			var/obj/item/hardpoint/apc/HP = hardpoints[slot]
			if(!HP) continue
			if(HP.health <= 0) continue
			if(!HP.is_activatable) continue
			slots += slot
	return slots

//Specialness for armored vics
/obj/vehicle_infinity/multitile/root/transport/load_hitboxes(datum/coords/dimensions, datum/coords/root_pos)

	var/start_x = -1 * root_pos.x_pos
	var/start_y = -1 * root_pos.x_pos
	var/end_x = start_x + dimensions.x_pos - 1
	var/end_y = start_y + dimensions.y_pos - 1

	for(var/i = start_x to end_x)

		for(var/j = start_y to end_y)

			if(i == 0 && j == 0)
				continue

			var/datum/coords/C = new
			C.x_pos = i
			C.y_pos = j
			C.z_pos = 0

			var/obj/vehicle_infinity/multitile/hitbox/transport/H = new(locate(src.x + C.x_pos, src.y + C.y_pos, src.z))
			H.dir = dir
			H.root = src
			linked_objs[C] = H

/obj/vehicle_infinity/multitile/root/transport/load_entrance_marker(datum/coords/rel_pos)
	
	entrance = new(locate(src.x + rel_pos.x_pos, src.y + rel_pos.y_pos, src.z))
	entrance.master = src
	linked_objs[rel_pos] = entrance

//Returns 1 or 0 if the slot in question has a broken installed hardpoint or not
/obj/vehicle_infinity/multitile/root/transport/proc/is_slot_damaged(slot)
	var/obj/item/hardpoint/apc/HP = hardpoints[slot]

	if(!HP) return 0

	if(HP.health <= 0) return 1

//Normal examine() but tells the player what is installed and if it's broken
/obj/vehicle_infinity/multitile/root/transport/examine(mob/user)
	..()
	for(var/i in hardpoints)
		var/obj/item/hardpoint/apc/HP = hardpoints[i]
		if(!HP)
			to_chat(user, "There is nothing installed on the [i] hardpoint slot.")
		else
			if(HP.health <= 0)
				to_chat(user, "There is a broken [HP] installed on [i] hardpoint slot.")
			if(HP.health > 0 && (HP.health < (HP.maxhealth / 3)))
				to_chat(user, "There is a heavily damaged [HP] installed on [i] hardpoint slot.")
			if((HP.health > (HP.maxhealth / 3)) && (HP.health < (HP.maxhealth * (2/3))))
				to_chat(user, "There is a damaged [HP] installed on [i] hardpoint slot.")			//removed skills check, because any baldie PFC can tell if module is unscratched or will fall apart from touching it
			if((HP.health > (HP.maxhealth * (2/3))) && (HP.health < HP.maxhealth))
				to_chat(user, "There is a lightly damaged [HP] installed on [i] hardpoint slot.")
			if(HP.health == HP.maxhealth)
				to_chat(user, "There is a non-damaged [HP] installed on [i] hardpoint slot.")

//Special armored vic healthcheck that mainly updates the hardpoint states
/obj/vehicle_infinity/multitile/root/transport/healthcheck()
	health = maxhealth //The APC itself doesn't take damage
	var/i
	var/remove_person = 1 //Whether or not to call handle_all_modules_broken()
	for(i in hardpoints)
		var/obj/item/hardpoint/apc/H = hardpoints[i]
		if(!H) continue
		if(H.health <= 0)
			H.remove_buff()
			if(H.slot != HDPT_WHEELS) damaged_hps |= H.slot //Not treads since their broken module overlay is the same as the broken hardpoint overlay
		else remove_person = 0 //if something exists but isnt broken

	if(remove_person)
		handle_all_modules_broken()
	else
		if(!luminosity)
			set_light(7)

	update_icon()


//Since the vics are 3x4 we need to swap between the two files with different dimensions
//Also need to offset to center the APC about the root object
/obj/vehicle_infinity/multitile/root/transport/update_icon()

	overlays.Cut()

	//Assuming 3x3 with half block overlaps in the APC's direction
	if(dir in list(NORTH, SOUTH))
		pixel_x = -32
		pixel_y = -48
		icon = 'infinity/icons/obj/apcarrier_NS.dmi'

	else if(dir in list(EAST, WEST))
		pixel_x = -48
		pixel_y = -32
		icon = 'infinity/icons/obj/apcarrier_EW.dmi'

	//Basic iteration that snags the overlay from the hardpoint module object
	var/i
	for(i in hardpoints)
		var/obj/item/hardpoint/apc/H = hardpoints[i]

		if(i == HDPT_WHEELS && (!H || H.health <= 0)) //Treads not installed or broken
			var/image/I = image(icon, icon_state = "damaged_hardpt_[i]")
			overlays += I
			continue

		if(H)
			var/image/I = H.get_icon_image(0, 0, dir)
			overlays += I

		if(damaged_hps.Find(i))
			var/image/I = image(icon, icon_state = "damaged_hardpt_[i]")
			overlays += I

//Hitboxes but with new names
/obj/vehicle_infinity/multitile/hitbox/transport
	name = "Armored Vehicle"
	desc = "Get inside to operate the vehicle."
	luminosity = 1
	throwpass = 1 //You can lob nades over APCs, and there's some dumb check somewhere that requires this
	var/lastsound = 0

//If something want to delete this, it's probably either an admin or the shuttle
//If it's an admin, they want to disable this
//If it's the shuttle, it should do damage
//If fully repaired and moves at least once, the broken hitboxes will respawn according to multitile.dm
/obj/vehicle_infinity/multitile/hitbox/transport/Destroy()
	var/obj/vehicle_infinity/multitile/root/transport/C = root
	if(C) C.take_damage_type(1000000, "abstract")
	..()

//Tramplin' time, but other than that identical
/obj/vehicle_infinity/multitile/hitbox/transport/Bump(atom/A)
	. = ..()
	var/facing = get_dir(src, A)
	var/turf/temp = loc
	var/turf/T = loc
	A.apc_collision(src, facing, T, temp)
	if(isliving(A))
		log_attack("[get_driver()] drove over [A] with [root]")

/obj/vehicle_infinity/multitile/hitbox/transport/proc/get_driver()
	return "Someone"

/atom/proc/apc_collision(obj/vehicle_infinity/multitile/hitbox/transport/C, facing, turf/T, turf/temp)
	return

/mob/living/apc_collision(obj/vehicle_infinity/multitile/hitbox/transport/C, facing, turf/T, turf/temp)
	if(stat == DEAD) //We don't care about the dead
		return
	if(loc == C.loc) // treaded over.
		if(!weakened)
			Weaken(1)
		var/target_dir = turn(C.dir, 180)
		temp = get_step(C.loc, target_dir)
		T = temp
		target_dir = turn(C.dir, 180)
		T = get_step(T, target_dir)
		face_atom(T)
		throw_at(T, 3, 2, C, 1)
		apply_damage(rand(5, 7.5), BRUTE)
		return
	if(!lying)
		temp = get_step(T, facing)
		T = temp
		T = get_step(T, pick(GLOB.cardinal))
		if(mob_size == MOB_LARGE)
			throw_at(T, 3, 2, C, 0)
		else
			throw_at(T, 3, 2, C, 1)
		if(!weakened)
			Weaken(1)
		apply_damage(rand(10, 15), BRUTE)
		visible_message("<span class='danger'>[C] bumps into [src], throwing them away!</span>", "<span class='danger'>[C] violently bumps into you!</span>")
	var/obj/vehicle_infinity/multitile/root/transport/CA = C.root
	var/list/slots = CA.get_activatable_hardpoints()
	for(var/slot in slots)
		var/obj/item/hardpoint/H = CA.hardpoints[slot]
		H?.livingmob_interact(src)

/turf/simulated/wall/apc_collision(obj/vehicle_infinity/multitile/hitbox/transport/C, facing, turf/T, turf/temp)
	var/obj/vehicle_infinity/multitile/root/transport/apc/CA = C.root
	var/damage = 30
	var/apc_damage = 2

	take_damage(damage)
	CA.take_damage_type(apc_damage, "blunt", src)
	if(world.time > C.lastsound + 1 SECONDS)
		playsound(src, 'infinity/sound/effects/metal_crash.ogg', 35)
		C.lastsound = world.time

/obj/machinery/apc_collision(obj/vehicle_infinity/multitile/hitbox/transport/C, facing, turf/T, turf/temp)
	var/obj/vehicle_infinity/multitile/root/transport/apc/CA = C.root
	var/apc_damage = 20

	Destroy()
	CA.take_damage_type(apc_damage, "blunt", src)
	if(world.time > C.lastsound + 1 SECONDS)
		visible_message("<span class='danger'>[CA] rams into \the [src]!</span>")
		playsound(src, 'infinity/sound/effects/metal_crash.ogg', 35)
		C.lastsound = world.time

/obj/structure/apc_collision(obj/vehicle_infinity/multitile/hitbox/transport/C, facing, turf/T, turf/temp)
	var/obj/vehicle_infinity/multitile/root/transport/apc/CA = C.root
	var/damage = 30
	var/tank_damage = 2

	take_damage(damage)
	CA.take_damage_type(tank_damage, "blunt", src)
	if(world.time > C.lastsound + 1 SECONDS)
		visible_message("<span class='danger'>[CA] crushes \the [src]!</span>")
		playsound(src, 'infinity/sound/effects/metal_crash.ogg', 35)
		C.lastsound = world.time


/obj/vehicle_infinity/multitile/hitbox/transport/Move(atom/A, direction)
	for(var/mob/living/M in get_turf(src))
		M.apc_collision(src)

	. = ..()

	if(.)
		for(var/mob/living/M in get_turf(A))
			M.apc_collision(src)

//Can't hit yourself with your own bullet
/obj/vehicle_infinity/multitile/hitbox/transport/get_projectile_hit_chance(obj/item/projectile/P)
	if(P.firer == root) //Don't hit our own hitboxes
		return FALSE
	return ..()

/obj/vehicle_infinity/multitile/root/transport/get_projectile_hit_chance(obj/item/projectile/P)
	if(P.firer == src) //Don't hit ourself.
		return FALSE

	return ..()

/obj/vehicle_infinity/multitile/hitbox/transport/Uncrossed(atom/movable/A)
	if(isliving(A))
		var/mob/living/M = A
		M.sleeping = 1

	return ..()
//For the next few, we're just tossing the handling up to the root object
/obj/vehicle_infinity/multitile/hitbox/transport/bullet_act(obj/item/projectile/P)
	return root.bullet_act(P)

/obj/vehicle_infinity/multitile/hitbox/transport/ex_act(severity)
	return root.ex_act(severity)

/obj/vehicle_infinity/multitile/hitbox/transport/attackby(obj/item/O, mob/user)
	return root.attackby(O, user)

//A bit icky, but basically if you're adjacent to the APC hitbox, you are then adjacent to the root object
/obj/vehicle_infinity/multitile/root/transport/Adjacent(atom/A)
	for(var/i in linked_objs)
		var/obj/vehicle_infinity/multitile/hitbox/transport/H = linked_objs[i]
		if(!H) continue
		if(get_dist(H, A) <= 1) return 1 //Using get_dist() to avoid hidden code that recurs infinitely here
	. = ..()

//Returns the ratio of damage to take, just a housekeeping thing
/obj/vehicle_infinity/multitile/root/transport/proc/get_dmg_multi(type)
	if(!dmg_multipliers.Find(type)) return 0
	return dmg_multipliers[type] * dmg_multipliers["all"]

//Generic proc for taking damage
//ALWAYS USE THIS WHEN INFLICTING DAMAGE TO THE VEHICLES
/obj/vehicle_infinity/multitile/root/transport/proc/take_damage_type(damage, type, atom/attacker)
	var/i
	for(i in hardpoints)
		var/obj/item/hardpoint/apc/HP = hardpoints[i]
		if(!istype(HP)) continue
		HP.health -= damage * dmg_distribs[i] * get_dmg_multi(type)
	healthcheck()
	if(istype(attacker, /mob))
		var/mob/M = attacker
		log_attack("[src] took [damage] [type] damage from [M] ([M.client ? M.client.ckey : "disconnected"]).")
	else
		log_attack("[src] took [damage] [type] damage from [attacker].")

/obj/vehicle_infinity/multitile/root/transport/proc/interior_concussion(strength)
	return

//Differentiates between damage types from different bullets
//Applies a linear transformation to bullet damage that will generally decrease damage done
/obj/vehicle_infinity/multitile/root/transport/bullet_act(obj/item/projectile/P)

	var/dam_type = "bullet"

	take_damage_type(P.damage * (0.75 + P.armor_penetration/100), dam_type, P.firer)
	playsound(src.loc, pick('infinity/sound/bullets/bullet_ricochet2.ogg', 'infinity/sound/bullets/bullet_ricochet3.ogg', 'infinity/sound/bullets/bullet_ricochet4.ogg', 'infinity/sound/bullets/bullet_ricochet5.ogg'), 25, 1)

	healthcheck()

//severity 1.0 explosions never really happen so we're gonna follow everyone else's example
/obj/vehicle_infinity/multitile/root/transport/ex_act(severity)

	switch(severity)
		if(1.0)
			take_damage_type(rand(100, 150), "explosive")
			take_damage_type(rand(20, 40), "slash")
			interior_concussion(4)

		if(2.0)
			take_damage_type(rand(60,80), "explosive")
			take_damage_type(rand(10, 15), "slash")
			interior_concussion(3)

		if(3.0)
			take_damage_type(rand(20, 25), "explosive")

//checks entrance tile for closed turfs and un-passable objects and returns TRUE if it is so
/obj/vehicle_infinity/multitile/root/transport/proc/tile_blocked_check(turf/Location)
	if(!isturf(Location))
		return TRUE
	var/turf/T = Location
	if(T.density)
		return TRUE
	for(var/atom/A in T.contents)
		if(A.density)
			var/mob/living/carbon/M = A
			if(istype(M))
				return FALSE
			if(istype(A, /obj/structure))
				var/obj/structure/S = A
				if(S.atom_flags && ATOM_FLAG_CLIMBABLE)
					return FALSE
				else
					return TRUE
			return TRUE
	return FALSE

/obj/vehicle_infinity/multitile/root/transport/proc/handle_interior_entrance(mob/M)
	return

//Special case for entering the vehicle without using the verb
/obj/vehicle_infinity/multitile/root/transport/attack_hand(mob/user)

	if(user.loc == entrance.loc)
		handle_interior_entrance(user)
		return

	. = ..()

/obj/vehicle_infinity/multitile/root/transport/Entered(atom/movable/A)
	if(istype(A, /obj) && !istype(A, /obj/item/ammo_magazine/apc))
		A.forceMove(src.loc)
		return

	return ..()

//Need to take damage from crushers, probably too little atm
/obj/vehicle_infinity/multitile/root/transport/Bumped(atom/A)
	..()

//Redistributes damage ratios based off of what things are attached (no armor means the armor doesn't mitigate any damage)
/obj/vehicle_infinity/multitile/root/transport/proc/update_damage_distribs()
	dmg_distribs = apc_dmg_distributions.Copy() //Assume full installs
	for(var/slot in hardpoints)
		var/obj/item/hardpoint/apc/HP = hardpoints[slot]
		if(!HP) dmg_distribs[slot] = 0.0 //Remove empty slots' damage mitigation
	var/acc = 0
	for(var/slot in dmg_distribs)
		var/ratio = dmg_distribs[slot]
		acc += ratio //Get total current ratio applications
	if(acc == 0)
		return
	for(var/slot in dmg_distribs)
		var/ratio = dmg_distribs[slot]
		dmg_distribs[slot] = ratio/acc //Redistribute according to previous ratios for full damage taking, but ignoring empty slots

//Special cases abound, handled below or in subclasses
/obj/vehicle_infinity/multitile/root/transport/attackby(obj/item/O, mob/user)

	if(istype(O, /obj/item/hardpoint/apc)) //Are we trying to install stuff?
		var/obj/item/hardpoint/apc/HP = O
		install_hardpoint(HP, user)
		update_damage_distribs()
		return

	if(istype(O, /obj/item/ammo_magazine/apc)) //Are we trying to reload?
		var/obj/item/ammo_magazine/apc/AM = O
		handle_ammomag_attackby(AM, user)
		return

	if(iswelder(O) || iswrench(O)) //Are we trying to repair stuff?
		handle_hardpoint_repair(O, user)
		update_damage_distribs()
		return

	if(iscrowbar(O)) //Are we trying to remove stuff?
		uninstall_hardpoint(O, user)
		update_damage_distribs()
		return

	if(istype(O, /obj/item/grab) && user.loc == entrance.loc)
		handle_interior_entrance(user)
		return

	take_damage_type(O.force * 0.05, "blunt", user) //Melee weapons from people do very little damage

	. = ..()

/obj/vehicle_infinity/multitile/root/transport/proc/handle_hardpoint_repair(obj/item/O, mob/user)

	//Need to the what the hell you're doing
	if(!user.mind)
		to_chat(user, "<span class='warning'>You don't know what to do with [O] on [src].</span>")
		return

	if(!damaged_hps.len)
		to_chat(user, "<span class='notice'>All of the hardpoints are in working order.</span>")
		return

	//Pick what to repair
	var/slot = input("Select a slot to try and repair") in damaged_hps

	var/obj/item/hardpoint/apc/old = hardpoints[slot] //Is there something there already?

	if(old) //If so, fuck you get it outta here
		to_chat(user, "<span class='warning'>Please remove the attached hardpoint module first.</span>")
		return

	//Determine how many 3 second intervals to wait and if you have the right tool
	var/num_delays = 1
	switch(slot)
		if(HDPT_PRIMARY)
			num_delays = 5
			if(!iswelder(O))
				to_chat(user, "<span class='warning'>That's the wrong tool. Use a welder.</span>")
				return
			var/obj/item/weapon/weldingtool/WT = O
			if(!WT.isOn())
				to_chat(user, "<span class='warning'>You need to light your [WT] first.</span>")
				return
			WT.remove_fuel(num_delays, user)

	user.visible_message("<span class='notice'>[user] starts repairing the [slot] slot on [src].</span>",
		"<span class='notice'>You start repairing the [slot] slot on [src].</span>")

	if(!do_after(user, 30*num_delays))
		user.visible_message("<span class='notice'>[user] stops repairing the [slot] slot on [src].</span>",
			"<span class='notice'>You stop repairing the [slot] slot on [src].</span>")
		return

	if(!Adjacent(user))
		user.visible_message("<span class='notice'>[user] stops repairing the [slot] slot on [src].</span>",
			"<span class='notice'>You stop repairing the [slot] slot on [src].</span>")
		return

	user.visible_message("<span class='notice'>[user] repairs the [slot] slot on [src].</span>",
		"<span class='notice'>You repair the [slot] slot on [src].</span>")

	damaged_hps -= slot //We repaired it, good job

	update_icon()

//Reloading stuff, pretty bare-bones and basic
/obj/vehicle_infinity/multitile/root/transport/proc/handle_ammomag_attackby(obj/item/ammo_magazine/apc/AM, var/mob/user)

	//No skill checks for reloading
	//Maybe I should delineate levels of skill for reloading, installation, and repairs?
	//That would make it easier to differentiate between the two for skills
	//Instead of using MT skills for these procs and AC skills for operation
	//Oh but wait then the MTs would be able to drive fuck that
	var/slot = input("Select a slot to try and refill") in hardpoints
	var/obj/item/hardpoint/apc/HP = hardpoints[slot]

	if(!HP)
		to_chat(user, "<span class='warning'>There is nothing installed on that slot.</span>")
		return

	HP.try_add_clip(AM, user)

/obj/vehicle_infinity/multitile/root/transport/proc/fix_special_module()
	return

//Putting on hardpoints
//Similar to repairing stuff, down to the time delay
/obj/vehicle_infinity/multitile/root/transport/proc/install_hardpoint(obj/item/hardpoint/apc/HP, mob/user)

	if(!user.mind)
		to_chat(user, "<span class='warning'>You don't know what to do with [HP] on [src].</span>")
		return

	if(HP.slot != HDPT_WHEELS)
		to_chat(user, "<span class='warning'>You only know how to remove, install and field repair wheels.</span>")
		return

	if(damaged_hps.Find(HP.slot))
		to_chat(user, "<span class='warning'>You need to fix the hardpoint first.</span>")
		return

	var/obj/item/hardpoint/apc/old = hardpoints[HP.slot]

	if(old)
		to_chat(user, "<span class='warning'>Remove the previous hardpoint module first.</span>")
		return

	user.visible_message("<span class='notice'>[user] begins installing [HP] on the [HP.slot] hardpoint slot on [src].</span>",
		"<span class='notice'>You begin installing [HP] on the [HP.slot] hardpoint slot on [src].</span>")

	var/num_delays = 1

	switch(HP.slot)
		if(HDPT_PRIMARY) num_delays = 5
		if(HDPT_WHEELS) num_delays = 7

	if(!do_after(user, 30*num_delays))
		user.visible_message("<span class='warning'>[user] stops installing \the [HP] on [src].</span>", "<span class='warning'>You stop installing \the [HP] on [src].</span>")
		return

	user.visible_message("<span class='notice'>[user] installs \the [HP] on [src].</span>", "<span class='notice'>You install \the [HP] on [src].</span>")

	user.drop_from_inventory(HP)
	if(HP.health > 0)
		fix_special_module()


	add_hardpoint(HP)

//User-orientated proc for taking of hardpoints
//Again, similar to the above ones
/obj/vehicle_infinity/multitile/root/transport/proc/uninstall_hardpoint(obj/item/O, mob/user)

	if(!user.mind)
		to_chat(user, "<span class='warning'>You don't know what to do with [O] on [src].</span>")
		return

	var/slot = input("Select a slot to try and remove") in hardpoints

	if(slot != HDPT_WHEELS)
		to_chat(user, "<span class='warning'>You only know how to remove, install and field repair wheels.</span>")
		return

	var/obj/item/hardpoint/apc/old = hardpoints[slot]

	if(!old)
		to_chat(user, "<span class='warning'>There is nothing installed there.</span>")
		return

	user.visible_message("<span class='notice'>[user] begins removing [old] on the [old.slot] hardpoint slot on [src].</span>",
		"<span class='notice'>You begin removing [old] on the [old.slot] hardpoint slot on [src].</span>")

	var/num_delays = 1

	switch(slot)
		if(HDPT_PRIMARY) num_delays = 5
		if(HDPT_WHEELS) num_delays = 7


	if(!do_after(user, 30*num_delays))
		user.visible_message("<span class='warning'>[user] stops removing \the [old] on [src].</span>", "<span class='warning'>You stop removing \the [old] on [src].</span>")
		return

	if(old == hardpoints[HDPT_PRIMARY] && old.health > 0)
		if(old.clips.len > 0)
			var i
			var/obj/item/ammo_magazine/A
			for(i = 0; i <= old.clips.len; i++)
				A = old.clips[1]
				old.clips[1].Move(entrance.loc)
				old.clips[1].update_icon()
				old.clips.Remove(A)
			user.visible_message("<span class='notice'>[user] removes ammunition from \the [old].</span>", "<span class='notice'>You remove ammunition from \the [old].</span>")


	user.visible_message("<span class='notice'>[user] removes \the [old] on [src].</span>", "<span class='notice'>You remove \the [old] on [src].</span>")

	remove_hardpoint(old, user)

//General proc for putting on hardpoints
//ALWAYS CALL THIS WHEN ATTACHING HARDPOINTS
/obj/vehicle_infinity/multitile/root/transport/proc/add_hardpoint(obj/item/hardpoint/apc/HP)

	HP.owner = src
	HP.apply_buff()
	HP.loc = src

	hardpoints[HP.slot] = HP

	update_icon()

//General proc for taking off hardpoints
//ALWAYS CALL THIS WHEN REMOVING HARDPOINTS
/obj/vehicle_infinity/multitile/root/transport/proc/remove_hardpoint(obj/item/hardpoint/apc/old, mob/user)
	if(user)
		old.loc = user.loc
	else
		old.loc = entrance.loc
	old.remove_buff()

	//if(old.health <= 0)
	//	cdel(old)

	hardpoints[old.slot] = null
	update_icon()
