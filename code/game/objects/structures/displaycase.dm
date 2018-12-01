/obj/structure/displaycase
	name = "display case"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "glassbox"
	desc = "A display case for prized possessions. It taunts you to kick it."
	density = 1
	anchored = 1
	var/locked = 1
	unacidable = 1//Dissolving the case would also delete the gun.
	alpha = 150
	req_access = list()
	var/health = 14
	var/destroyed = 0

/obj/structure/displaycase/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	for(var/atom/movable/AM in T)
		if(AM.simulated && !AM.anchored)
			AM.forceMove(src)
	update_icon()

/obj/structure/displaycase/examine(mob/user)
	. = ..(user)
	if(.)
		if(contents.len)
			to_chat(user, "Inside you see [english_list(contents)].")
		to_chat(user, "It looks [locked ? "locked. You can open it with your ID card" : "unlocked"].")

/obj/structure/displaycase/ex_act(severity)
	switch(severity)
		if (1)
			new /obj/item/weapon/material/shard(loc)
			for(var/atom/movable/AM in src)
				AM.dropInto(loc)
			qdel(src)
		if (2)
			if (prob(50))
				take_damage(15)
		if (3)
			if (prob(50))
				take_damage(5)

/obj/structure/displaycase/bullet_act(var/obj/item/projectile/Proj)
	..()
	take_damage(Proj.get_structure_damage())

/obj/structure/displaycase/take_damage(damage)
	health -= damage
	if(health <= 0)
		if (!destroyed)
			set_density(0)
			destroyed = 1
			new /obj/item/weapon/material/shard(loc)
			for(var/atom/movable/AM in src)
				AM.dropInto(loc)
			playsound(src, "shatter", 70, 1)
			update_icon()
	else
		playsound(src.loc, 'sound/effects/Glasshit.ogg', 75, 1)

/obj/structure/displaycase/on_update_icon()
	if(destroyed)
		icon_state = "glassboxb"
	else
		icon_state = "glassbox"
	underlays.Cut()
	for(var/atom/movable/AM in contents)
		underlays += AM.appearance

/obj/structure/displaycase/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/card/id))
		if(allowed(usr))
			locked = !locked
			to_chat(user, "[src]'s lock was [locked ? "enabled" : "disabled"].")
		else
			to_chat(user, "[src]'s card reader denied you.")
		return
	if(isitem(W))
		if(!locked)
			user.drop_item()
			W.pixel_x = 0
			W.pixel_y = -7
			W.forceMove(get_turf(src))
			Initialize()
			return
	if(user.a_intent == I_HURT)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		take_damage(W.force)
	..()

/obj/structure/displaycase/attack_hand(mob/user as mob)
	add_fingerprint(user)
	if(!locked)
		for(var/atom/movable/AM in src)
			to_chat(user, "You picking up [AM] from the [src].")
			AM.dropInto(loc)
			update_icon()
		return
	if(!destroyed && user.a_intent == I_HURT)
		to_chat(usr, text("<span class='warning'>You kick the display case.</span>"))
		visible_message("<span class='warning'>[usr] kicks the display case.</span>")
		take_damage(2)