/obj/structure/torpedo // Physical ammo.
	name = "torpedo"
	icon_state = "torpedo"
	icon  ='icons/obj/ship_misc.dmi'
	density = 1
	anchored = 0
	var/payload_type = /obj/item/projectile/ship_munition/torpedo

/obj/item/projectile/ship_munition/torpedo
	name = "torpedo"
	icon_state = "torpedo_moving"
	icon  ='icons/obj/ship_misc.dmi'
	fire_sound = 'sound/effects/torpedo.ogg'
	penetrating = 2
	kill_count = 400
	damage = 200

/obj/item/projectile/ship_munition/torpedo/on_hit(var/atom/target, var/blocked = 0)
	if(!penetrating)
		explosion(get_turf(target), 3, 4, 5)

/obj/structure/torpedo/bullet_act(var/obj/item/projectile/Proj)
	if(Proj.get_structure_damage())
		if(istype(Proj.firer))
			var/turf/turf = get_turf(src)
			if(turf)
				var/area/area = turf.loc || "*unknown area*"
				message_admins("[key_name_admin(Proj.firer)] shot a torpedo in \the [area] ([turf.x],[turf.y],[turf.z]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[turf.x];Y=[turf.y];Z=[turf.z]'>JMP</a>).")
				log_game("[key_name(Proj.firer)] shot a torpedo in \the [area] ([turf.x],[turf.y],[turf.z]).")
			else
				message_admins("[key_name_admin(Proj.firer)] shot a torpedo outside the world.")
				log_game("[key_name(Proj.firer)] shot a torpedo outside the world.")

		if(!istype(Proj ,/obj/item/projectile/beam/lastertag) && !istype(Proj ,/obj/item/projectile/beam/practice) )
			explode()

/obj/structure/torpedo/ex_act()
	explode()

/obj/structure/torpedo/proc/explode()
	if(src)
		explosion(src.loc,3,4,5)
		qdel(src)
