/mob/living/simple_animal/friendly/lizard
	holder_type = /obj/item/holder/lizard

/obj/item/holder/lizard
	slot_flags = SLOT_HOLSTER // | SLOT_HEAD Currently we don't have on head icons for lizards :(
	w_class = ITEM_SIZE_TINY

/mob/living/proc/get_scooped_self()

	if(!holder_type || buckled || pinned.len)
		return

	var/obj/item/holder/H = new holder_type(get_turf(src))

	src.forceMove(H)

	H.sync(src)
	return H

/obj/item/holder/afterattack(var/turf/T, var/mob/user, var/adjacent)
	if(Adjacent(T) && (istype(T, /turf/simulated/floor) || istype(T, /turf/unsimulated/floor)))
		user.drop_from_inventory(src, T)
		src.Destroy()
		return
	..()

/obj/item/holder/equipped(mob/user)
	..()
	for(var/mob/victim in src.contents)
		if(victim.mob_size >= user.mob_size)
			user.drop_from_inventory(src)

// Для нужд лоадаута и не только ~bear1ake | TODO: Спрайты...
/mob/living/simple_animal/friendly/crab
	holder_type = /obj/item/holder/crab

/obj/item/holder/crab
	slot_flags = null
	icon = 'icons/mob/simple_animal/animal.dmi'
	icon_state = "crab"

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi'
	)

	item_state_slots = list(
		slot_l_hand_str = "crab_l",
		slot_r_hand_str = "crab_r"
	)

/mob/living/simple_animal/crow
	holder_type = /obj/item/holder/crow

/obj/item/holder/crow
	slot_flags = SLOT_HEAD // У нас нет плеч, так что пусть сидит на голове
	w_class = ITEM_SIZE_LARGE // Большая ворона
	icon = 'icons/mob/simple_animal/crow.dmi'
	icon_state = "crow"

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
		slot_head_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi'
	)

	item_state_slots = list(
		slot_l_hand_str = "crow_l",
		slot_r_hand_str = "crow_r",
		slot_head_str = "crow_u"
	)

/mob/living/simple_animal/rabbit
	holder_type = /obj/item/holder/rabbit

/obj/item/holder/rabbit
	slot_flags = null
	icon = 'icons/mob/Easter.dmi'
	icon_state = "rabbit_white"

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
	)

	item_state_slots = list(
		slot_l_hand_str = "rabbit_l",
		slot_r_hand_str = "rabbit_r",
	)

/mob/living/simple_animal/friendly/fox
	holder_type = /obj/item/holder/fox

/obj/item/holder/fox
	slot_flags = null
	w_class = ITEM_SIZE_LARGE // Лису в рюкзак? Неее...
	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "fox"

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/mob_holder.dmi',
	)

	item_state_slots = list(
		slot_l_hand_str = "fox_l",
		slot_r_hand_str = "fox_r",
	)

/mob/living/simple_animal/friendly/cat/kitten
	holder_type = /obj/item/holder/kitten

/obj/item/holder/kitten
	slot_flags = null
	icon = 'infinity/icons/mob/mobs.dmi'
	icon_state = "kitten"
