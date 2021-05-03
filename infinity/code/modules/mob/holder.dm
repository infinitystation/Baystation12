/mob/living/simple_animal/lizard
	holder_type = /obj/item/weapon/holder/lizard

/obj/item/weapon/holder/lizard
	slot_flags = SLOT_HOLSTER // | SLOT_HEAD Currently we don't have on head icons for lizards :(
	w_class = ITEM_SIZE_TINY

/mob/living/proc/get_scooped_self()

	if(!holder_type || buckled || pinned.len)
		return

	var/obj/item/weapon/holder/H = new holder_type(get_turf(src))

	src.forceMove(H)

	H.sync(src)
	return H

/obj/item/weapon/holder/afterattack(var/turf/T, var/mob/user, var/adjacent)
	if(Adjacent(T) && (istype(T, /turf/simulated/floor) || istype(T, /turf/unsimulated/floor)))
		user.drop_from_inventory(src, T)
		src.Destroy()
		return
	..()

/obj/item/weapon/holder/equipped(mob/user)
	..()
	for(var/mob/victim in src.contents)
		if(victim.mob_size >= user.mob_size)
			user.drop_from_inventory(src)
