/*
CONTAINS:

Deployable items
Barricades

for reference:

	access_security = 1
	access_brig = 2
	access_armory = 3
	access_forensics_lockers= 4
	access_medical = 5
	access_morgue = 6
	access_tox = 7
	access_tox_storage = 8
	access_genetics = 9
	access_engine = 10
	access_engine_equip= 11
	access_maint_tunnels = 12
	access_external_airlocks = 13
	access_emergency_storage = 14
	access_change_ids = 15
	access_ai_upload = 16
	access_teleporter = 17
	access_eva = 18
	access_heads = 19
	access_captain = 20
	access_all_personal_lockers = 21
	access_chapel_office = 22
	access_tech_storage = 23
	access_atmospherics = 24
	access_bar = 25
	access_janitor = 26
	access_crematorium = 27
	access_kitchen = 28
	access_robotics = 29
	access_rd = 30
	access_cargo = 31
	access_construction = 32
	access_chemistry = 33
	access_cargo_bot = 34
	access_hydroponics = 35
	access_manufacturing = 36
	access_library = 37
	access_lawyer = 38
	access_virology = 39
	access_cmo = 40
	access_qm = 41
	access_court = 42
	access_clown = 43
	access_mime = 44

*/

//Barricades!
/obj/structure/barricade
	name = "barricade"
	desc = "This space is blocked off by a barricade."
	icon = 'icons/obj/structures.dmi'
	icon_state = "barricade"
	anchored = 1.0
	density = 1
	var/health = 100
	var/maxhealth = 100
	var/material/material
	atom_flags = ATOM_FLAG_CLIMBABLE

/obj/structure/barricade/New(var/newloc, var/material_name)
	..(newloc)
	if(!material_name)
		material_name = "wood"
	material = get_material_by_name("[material_name]")
	if(!material)
		qdel(src)
		return
	name = "[material.display_name] barricade"
	desc = "This space is blocked off by a barricade made of [material.display_name]."
	color = material.icon_colour
	maxhealth = material.integrity
	health = maxhealth

/obj/structure/barricade/get_material()
	return material

/obj/structure/barricade/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/stack))
		var/obj/item/stack/D = W
		if(D.get_material_name() != material.name)
			return //hitting things with the wrong type of stack usually doesn't produce messages, and probably doesn't need to.
		if (health < maxhealth)
			if (D.get_amount() < 1)
				to_chat(user, "<span class='warning'>You need one sheet of [material.display_name] to repair \the [src].</span>")
				return
			visible_message("<span class='notice'>[user] begins to repair \the [src].</span>")
			if(do_after(user,20,src) && health < maxhealth)
				if (D.use(1))
					health = maxhealth
					visible_message("<span class='notice'>[user] repairs \the [src].</span>")
				return
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		switch(W.damtype)
			if("fire")
				src.health -= W.force * 1
			if("brute")
				src.health -= W.force * 0.75
			else
		if (src.health <= 0)
			visible_message("<span class='danger'>The barricade is smashed apart!</span>")
			dismantle()
			qdel(src)
			return
		..()

/obj/structure/barricade/proc/dismantle()
	material.place_dismantled_product(get_turf(src))
	qdel(src)
	return

/obj/structure/barricade/ex_act(severity)
	switch(severity)
		if(1.0)
			visible_message("<span class='danger'>\The [src] is blown apart!</span>")
			qdel(src)
			return
		if(2.0)
			src.health -= 25
			if (src.health <= 0)
				visible_message("<span class='danger'>\The [src] is blown apart!</span>")
				dismantle()
			return

/obj/structure/barricade/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if(air_group || (height==0))
		return 1
	if(istype(mover) && mover.checkpass(PASS_FLAG_TABLE))
		return 1
	else
		return 0

//Actual Deployable machinery stuff
/obj/machinery/deployable
	name = "deployable"
	desc = "Deployable."
	icon = 'icons/obj/objects.dmi'
	req_access = list(access_security)//I'm changing this until these are properly tested./N

/obj/machinery/deployable/barrier
	name = "deployable barrier"
	desc = "A deployable barrier. Swipe your ID card to lock/unlock it."
	icon = 'icons/obj/objects.dmi'
	anchored = 0.0
	density = 1
	icon_state = "barrier0"
	var/health = 100.0
	var/maxhealth = 100.0
	var/locked = 0.0
//	req_access = list(access_maint_tunnels)

	New()
		..()

		src.icon_state = "barrier[src.locked]"

	attackby(obj/item/weapon/W as obj, mob/user as mob)
		if (istype(W, /obj/item/weapon/card/id/))
			if (src.allowed(user))
				if	(src.emagged < 2.0)
					src.locked = !src.locked
					src.anchored = !src.anchored
					src.icon_state = "barrier[src.locked]"
					if ((src.locked == 1.0) && (src.emagged < 2.0))
						to_chat(user, "Barrier lock toggled on.")
						return
					else if ((src.locked == 0.0) && (src.emagged < 2.0))
						to_chat(user, "Barrier lock toggled off.")
						return
				else
					var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
					s.set_up(2, 1, src)
					s.start()
					visible_message("<span class='warning'>BZZzZZzZZzZT</span>")
					return
			return
		else if(isWrench(W))
			if (src.health < src.maxhealth)
				src.health = src.maxhealth
				src.emagged = 0
				src.req_access = list(access_security)
				visible_message("<span class='warning'>[user] repairs \the [src]!</span>")
				return
			else if (src.emagged > 0)
				src.emagged = 0
				src.req_access = list(access_security)
				visible_message("<span class='warning'>[user] repairs \the [src]!</span>")
				return
			return
		else
			switch(W.damtype)
				if("fire")
					src.health -= W.force * 0.75
				if("brute")
					src.health -= W.force * 0.5
				else
			if (src.health <= 0)
				src.explode()
			..()

	ex_act(severity)
		switch(severity)
			if(1.0)
				src.explode()
				return
			if(2.0)
				src.health -= 25
				if (src.health <= 0)
					src.explode()
				return
	emp_act(severity)
		if(stat & (BROKEN|NOPOWER))
			return
		if(prob(50/severity))
			locked = !locked
			anchored = !anchored
			icon_state = "barrier[src.locked]"

	CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
		if(air_group || (height==0))
			return 1
		if(istype(mover) && mover.checkpass(PASS_FLAG_TABLE))
			return 1
		else
			return 0

	proc/explode()

		visible_message("<span class='danger'>[src] blows apart!</span>")
		var/turf/Tsec = get_turf(src)
		new /obj/item/stack/rods(Tsec)

		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()

		explosion(src.loc,-1,-1,0)
		if(src)
			qdel(src)


/obj/machinery/deployable/barrier/emag_act(var/remaining_charges, var/mob/user)
	if (src.emagged == 0)
		src.emagged = 1
		src.req_access.Cut()
		src.req_one_access.Cut()
		to_chat(user, "You break the ID authentication lock on \the [src].")
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message("<span class='warning'>BZZzZZzZZzZT</span>")
		return 1
	else if (src.emagged == 1)
		src.emagged = 2
		to_chat(user, "You short out the anchoring mechanism on \the [src].")
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message("<span class='warning'>BZZzZZzZZzZT</span>")
		return 1

/* //TODO INFINITY

/obj/structure/m_barricade
	name = "metal barricade"
	desc = "A solid barricade made of reinforced metal. Use a welding tool and/or plasteel to repair it if damaged."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "barricade"
	density = 1
	anchored = 1.0
	layer = 2.9
	throwpass = 1	//You can throw objects over this, despite its density.
	flags = OBJ_CLIMBABLE|ON_BORDER
	var/health = 300 //Pretty tough. Changes sprites at 300 and 150.
	unacidable = 0 //Who the fuck though unacidable barricades with 500 health was a good idea?


/obj/structure/m_barricade/update_icon()
	if(health < 220 && health > 80)
		icon_state = "barricade_dmg1"
	else if(health <= 80)
		icon_state = "barricade_dmg2"
	else
		icon_state = initial(icon_state)

/obj/structure/m_barricade/proc/update_health()
	if(health < 0)
		visible_message("<span class='danger'>[src] collapses!</span>")
		new /obj/item/stack/material/plasteel(src.loc, 4)
		qdel(src)
		return

	if(health > 300) health = 300
	update_icon()
	return

/obj/structure/m_barricade/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/table) in get_turf(mover)) //Tables let you climb on barricades.
		return 1
	if(get_dir(loc, target) == dir)
		return 0
	else
		return 1

/obj/structure/m_barricade/proc/check_cover(obj/effect/projectile/P, turf/from)
	var/turf/cover
	cover = get_step(loc, get_dir(from, loc))
	if(!cover)
		return 1
	if(get_dist(src.turf, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

	var/chance = 50
	if(ismob(P.original) && get_turf(P.original) == cover)
		var/mob/M = P.original
		if (M.lying)
			chance += 20

	if(prob(chance))
		return 0 //blocked
	return 1

/obj/structure/m_barricade/bullet_act(obj/item/projectile/P)
	if(!(P.damage_type == BRUTE || P.damage_type == BURN))
		return 0

	if(take_damage(P.damage/1.5))
		//prevent tables with 1 health left from stopping bullets outright
		return PROJECTILE_CONTINUE //the projectile destroyed the table, so it gets to keep going

	visible_message("<span class='warning'>\The [P] hits [src]!</span>")
	return 0

/obj/structure/m_barricade/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/table) in get_turf(O)) //Tables let you climb on barricades.
		return 1
	if (get_dir(loc, target) == dir)
		return 0
	else
		return 1

/obj/structure/m_barricade/attackby(obj/item/W as obj, mob/user as mob)
	if(!W) return

	if(istype(W, /obj/item/weapon/weldingtool))
		var/obj/item/weapon/weldingtool/WT = W
		if(health < 80)
			to_chat(user, "It's too damaged for that. Better just to build a new one.")
			return

		if(health >= 300)
			to_chat(user, "It's already in perfect condition.")
			return

		if(WT.remove_fuel(0, user))
			user.visible_message("<span class='notice'>[user] begins repairing damage to the [src].</span>","<span class='notice'>You begin repairing the damage to the [src].</span>")
			if(do_after(user,50))
				user.visible_message("<span class='notice'>[user] repairs the damaged [src].</span>","<span class='notice'>Your repair the [src]'s damage."</span>)
				health += 150
				if(health > 300) health = 300
				update_health()
				playsound(src.loc, 'sound/items/Welder2.ogg', 75, 1)
				return
		return

	//Otherwise, just hit it.
	if(W.force > 20)
		..()
		health -= W.force / 2
		update_health()
		return

	return

/obj/structure/m_barricade/attackby(mob/user, istype(mob/living/carbon/human/xdrone, /mob/living/carbon/human/xhunter, /mob/living/carbon/human/xsentinel, /mob/living/carbon/human/xqueen) as mob)
	src.health -= rand(15,20)
	playsound(src, 'sound/effects/metalhit.ogg', 100, 1)
	visible_message("<span class='danger'>[M] slashes at the [src]!</span>")
	update_health()*/
