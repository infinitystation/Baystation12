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

// Для нужд лоадаута и не только ~bear1ake | TODO: Спрайты...
/mob/living/simple_animal/crab
	holder_type = /obj/item/weapon/holder/crab

/obj/item/weapon/holder/crab
	slot_flags = null
	icon = 'icons/mob/simple_animal/animal.dmi'
	icon_state = "crab"

/mob/living/simple_animal/crow
	holder_type = /obj/item/weapon/holder/crow

/obj/item/weapon/holder/crow
	slot_flags = SLOT_HEAD // У нас нет плеч, так что пусть сидит на голове
	w_class = ITEM_SIZE_LARGE // Большая ворона
	icon = 'icons/mob/simple_animal/crow.dmi'
	icon_state = "crow"

/mob/living/simple_animal/rabbit
	holder_type = /obj/item/weapon/holder/rabbit

/obj/item/weapon/holder/rabbit
	slot_flags = null
	icon = 'icons/mob/Easter.dmi'
	icon_state = "rabbit_white"

/mob/living/simple_animal/fox
	holder_type = /obj/item/weapon/holder/fox

/obj/item/weapon/holder/fox
	slot_flags = null
	w_class = ITEM_SIZE_LARGE // Лису в рюкзак? Неее...
	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "fox"
