/obj/structure/barrier
	name = "defensive barrier"
	desc = "A portable barrier — usually, you can see it on defensive positions or in storages in important areas. \
	You can deploy it with a screwdriver for maximum protection, or keep it in mobile position. \
	Also, demontage can be done with a crowbar.In case of structural damage, can be repaired with welding tool."
	icon = 'icons/obj/infinity_barrier.dmi'
	icon_state = "barrier_rised"
	density = 1
	throwpass = 1
	anchored = 1
	atom_flags = ATOM_FLAG_CLIMBABLE | ATOM_FLAG_CHECKS_BORDER
	var/health = 200
	var/maxhealth = 200
	var/deployed = 0
	var/basic_chance = 50

/obj/structure/barrier/New()
	..()
	update_layers()
	update_icon()

/obj/structure/barrier/examine(var/user)
	..()
	if(health>=200)
		to_chat(user, "<span class='notice'>It looks undamaged.</span>")
	if(health>=140 && health<200)
		to_chat(user, "<span class='warning'>It has small dents.</span>")
	if(health>=80 && health<140)
		to_chat(user, "<span class='warning'>It has medium dents.</span>")
	if(health<80)
		to_chat(user, "<span class='danger'>It will break apart soon!</span>")

/obj/structure/barrier/Destroy()
	if(health <= 0)
		visible_message("<span class='danger'>[src] was destroyed!</span>")
		playsound(src, 'sound/effects/clang.ogg', 100, 1)
		new /obj/item/stack/material/steel(src.loc)
		new /obj/item/stack/material/steel(src.loc)
	return ..()

/obj/structure/barrier/proc/update_layers()
	if(dir != SOUTH)
		layer = initial(layer) + 0.1
		plane = initial(plane)
	else if(dir == SOUTH && density)
		layer = ABOVE_OBJ_LAYER + 0.1
		plane = ABOVE_HUMAN_PLANE
	else
		layer = initial(layer) + 0.1
		plane = initial(plane)

/obj/structure/barrier/on_update_icon()
	if(density && !deployed)
		icon_state = "barrier_rised"
	if(!density && !deployed)
		icon_state = "barrier_downed"
	if(deployed)
		icon_state = "barrier_deployed"

/obj/structure/barrier/set_dir()
	..()
	update_layers()

/obj/structure/barrier/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(!density)
		return 1

	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover

		if(proj.firer && Adjacent(proj.firer))
			return 1

		if(dir==1) //sorry my
			if(mover.dir!=2)
				return 1
		if(dir==2)
			if(mover.dir!=1)
				return 1
		if(dir==4)
			if(mover.dir!=8)
				return 1
		if(dir==8)
			if(mover.dir!=4)
				return 1

		if(get_dist(proj.starting, loc) <= 1)//allows to fire from 1 tile away of barrier
			return 1

		return check_cover(mover, target)

	if(get_dir(get_turf(src), target) == dir && density)//turned in front of barrier
		return 0
	else
		return 1
	return 1

/obj/structure/barrier/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASS_FLAG_TABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1
	return 1

/obj/structure/barrier/attack_hand(mob/living/carbon/human/user as mob)
	if(user.species.can_shred(user) || user.get_species() == SPECIES_XENO)
		take_damage(user.species.)
		return
	if(deployed)
		to_chat(user, "<span class='notice'>[src] is already deployed. You can't move it.</span>")
	else
		playsound(src, 'sound/effects/extout.ogg', 100, 1)
		if(do_after(user, 5, src))
			density = !density
			to_chat(user, "<span class='notice'>You're getting [density ? "up" : "down"] [src].</span>")
			update_layers()
			update_icon()

/obj/structure/barrier/attackby(obj/item/W as obj, mob/user as mob)
	if(isWelder(W))
		var/obj/item/weapon/weldingtool/WT = W
		if(health == maxhealth)
			to_chat(user, "<span class='notice'>[src] is fully repaired.</span>")
			return
		if(!WT.isOn())
			to_chat(user, "<span class='notice'>[W] should be turned on firstly.</span>")
			return
		if(WT.remove_fuel(0,user))
			visible_message("<span class='warning'>\The [user] is repairing [src]...</span>")
			playsound(src, 'sound/items/Welder.ogg', 100, 1)
			if(do_after(user, max(5, health / 5), src) && WT && WT.isOn())
				to_chat(user, "<span class='notice'>You finish repairing the damage to [src].</span>")
				playsound(src, 'sound/items/Welder2.ogg', 100, 1)
				health = maxhealth
		else
			to_chat(user, "<span class='notice'>You need more welding fuel to complete this task.</span>")
		update_icon()
		return
	if(isScrewdriver(W))
		if(density)
			visible_message("<span class='danger'>The [user] begins to [deployed ? "un" : ""]deploy [src]...</span>")
			playsound(src, 'sound/items/Screwdriver.ogg', 100, 1)
			if(do_after(user, 30, src))
				visible_message("<span class='notice'>[src] was [deployed ? "un" : ""]deployed by [user].</span>")
				deployed = !deployed
				if(deployed)
					basic_chance = 70
				else
					basic_chance = 50
		update_icon()
		return
	if(isCrowbar(W))
		if(!deployed && !density)
			visible_message("<span class='danger'>\The [user] is begins disassembling [src]...</span>")
			playsound(src, 'sound/items/Crowbar.ogg', 100, 1)
			if(do_after(user, 60, src))
				var/obj/item/weapon/barrier/B = new /obj/item/weapon/barrier(get_turf(user))
				visible_message("<span class='notice'>[usr] dismantled \the [src].</span>")
				playsound(src, 'sound/items/Deconstruct.ogg', 100, 1)
				B.health = health
				B.add_fingerprint(user)
				qdel(src)
		else
			to_chat(user, "<span class='notice'>You should unsecure [src] firstly. Use a screwdriver.</span>")
		update_icon()
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		take_damage(W.force)
		..()

/obj/structure/barrier/bullet_act(var/obj/item/projectile/P)
	..()
	take_damage(P.get_structure_damage())

/obj/structure/barrier/attack_generic(var/mob/user, var/damage, var/attack_verb)
	take_damage(damage)
	attack_animation(user)
	if(damage >=1)
		user.visible_message("<span class='danger'>[user] [attack_verb] \the [src]!</span>")
	else
		user.visible_message("<span class='danger'>[user] [attack_verb] \the [src] harmlessly!</span>")
	return 1

/obj/structure/barrier/take_damage(damage)
	health -= damage * 0.5
	if(health <= 0)
		Destroy()
	else
		playsound(src.loc, 'sound/effects/bang.ogg', 75, 1)

/obj/structure/barrier/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_turf(src)
	var/chance = basic_chance

	if(!cover)
		return 1

	var/mob/living/carbon/human/M = locate(src.loc)
	if(M)
		chance += 30

		if(M.lying)
			chance += 20

	if(get_dir(loc, from) == dir)
		chance += 10

	if(prob(chance))
		visible_message("<span class='warning'>[P] hits \the [src]!</span>")
		bullet_act(P)
		return 0

	return 1

/obj/structure/barrier/MouseDrop_T(mob/user as mob)
	if(src.loc != user.loc)
		to_chat(user, "You start climbing onto [src]...")
		step(src, get_dir(src, src.dir))

/obj/structure/barrier/ex_act(severity)
	switch(severity)
		if(1.0)
			new /obj/item/stack/material/steel(src.loc)
			new /obj/item/stack/material/steel(src.loc)
			if(prob(50))
				new /obj/item/stack/material/steel(src.loc)
			qdel(src)
			return
		if(2.0)
			new /obj/item/stack/material/steel(src.loc)
			if(prob(50))
				new /obj/item/stack/material/steel(src.loc)
			qdel(src)
			return
		else
	return

/obj/item/weapon/barrier
	name = "portable barrier"
	desc = "A portable barrier — usually, you can see it on defensive positions or in storages at important areas. \
	You can deploy it with a screwdriver for maximum protection, or keep it in mobile position. \
	Also, demontage can be done with a crowbar.In case of structural damage, can be repaired with welding tool."
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "barrier_hand"
	w_class = 4
	health = 200

/obj/item/weapon/barrier/proc/turf_check(mob/user as mob)
	for(var/obj/structure/barrier/D in user.loc.contents)
		if((D.dir == user.dir))
			to_chat(user, "<span class='warning'>There is no more space.</span>")
			return 1
	return 0

/obj/item/weapon/barrier/attack_self(mob/user as mob)
	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>You can't place it here.</span>")
		return
	if(turf_check(user))
		return

	var/obj/structure/barrier/B = new(user.loc)
	B.set_dir(user.dir)
	B.health = health
	user.drop_item()
	qdel(src)

/obj/item/weapon/barrier/attackby(obj/item/W as obj, mob/user as mob)
	if(health != 200 && isWelder(W))
		var/obj/item/weapon/weldingtool/WT = W
		if(!WT.isOn())
			to_chat(user, "<span class='notice'>The [W] should be turned on firstly.</span>")
			return
		if(WT.remove_fuel(0,user))
			to_chat(user, "<span class='notice'>You start repairing the damage to [src].</span>")
			playsound(src, 'sound/items/Welder.ogg', 100, 1)
			if(do_after(user, max(5, health / 5), src) && WT && WT.isOn())
				to_chat(user, "<span class='notice'>You finish repairing the damage to [src].</span>")
				playsound(src, 'sound/items/Welder2.ogg', 100, 1)
				health = 200
		else
			to_chat(user, "<span class='notice'>You need more welding fuel to complete this task.</span>")
			return
	return