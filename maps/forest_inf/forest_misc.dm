//////////////////////////////////////////////////////
// Structures
//////////////////////////////////////////////////////

/obj/structure/flora/tree/pine/dense
	opacity = TRUE

/obj/structure/flora/tree/dead/firewood

/obj/structure/flora/tree/dead/firewood/attackby(obj/item/O, mob/user)
	. = ..()
	if(istype(O, /obj/item/material/twohanded/fireaxe) || /obj/item/material/hatchet)
		usr.visible_message("<span class='notice'>\The [usr] starts chopping \the [src]</span>", "<span class='notice'>You start chopping \the [src]</span>", "You hear the sound of a hatchet hitting the wood.")
		if(do_after(user,50))
			to_chat(usr, "<span class='notice'>You chopped down the [src]</span>")
			var/obj/item/stack/material/wood/W = new(src.loc)
			W.amount = 5
			qdel(src)

//**************************************************************
// Nests from /VG/
//**************************************************************
//Breeds monsters in area if pop_min of them presents.
/obj/effect/nest
	name = "start"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	anchored = TRUE
	invisibility = 101
	var/mob_type = /mob/living/simple_animal/hostile/russian
	var/breed_time = 9000
	var/breed_chance = 100
	var/pop = 10
	var/pop_min = 2
	var/pop_max = 30

/obj/effect/nest/New()
	for(var/i = 1, i <= pop, i++)
		new mob_type(loc)

	spawn()
		ticker()

/obj/effect/nest/proc/ticker()
	while(src)
		for(var/mob/M in get_area(src))
			if(istype(M, mob_type))
				pop++
			else
				pop-- //It's harder with an audience, you understand bb
		if(pop in pop_min to pop_max) //When enough simple animals...
			if(prob(breed_chance)) //Love each other very much...
				new mob_type(loc) //Babby formed!!
		sleep(breed_time)

// Subtypes ////////////////////////////////////////////////////

/obj/effect/nest/spider
	name = "spider breeding ground"
	mob_type = /mob/living/simple_animal/hostile/giant_spider
	pop_max = 10

/obj/effect/nest/spider/limited
	name = "spider breeding ground"
	pop = 2
	pop_max = 2

/obj/effect/nest/carp
	name = "carp breeding ground"
	mob_type = /mob/living/simple_animal/hostile/carp
	pop_max = 10

/obj/effect/nest/carp/limited
	name = "limited carp breeding ground"
	pop = 2
	pop_max = 2

/obj/effect/nest/bear
	name = "bear breeding ground"
	mob_type = /mob/living/simple_animal/hostile/bear
	breed_time = 18000
	pop = 1
	pop_max = 2

/obj/effect/nest/scarybat
	name = "bat breeding ground"
	mob_type = /mob/living/simple_animal/hostile/scarybat
	pop = 5
	pop_max = 10
	breed_time = 1800

/obj/effect/nest/hivebot
	name = "hivebot breeding ground"
	mob_type = /mob/living/simple_animal/hostile/hivebot
	pop = 5
	pop_max = 10
	breed_time = 3400

/obj/effect/nest/diyaab
	name = "diyaab breeding ground"
	mob_type = /mob/living/simple_animal/hostile/retaliate/beast/diyaab
	breed_time = 4600
	pop = 5
	pop_max = 10

/obj/effect/nest/samak
	name = "samak breeding ground"
	mob_type = /mob/living/simple_animal/hostile/retaliate/beast/samak
	breed_time = 9000
	pop = 2
	pop_max = 4

/obj/effect/nest/shantak
	name = "shantak breeding ground"
	mob_type = /mob/living/simple_animal/hostile/retaliate/beast/shantak
	breed_time = 9000
	pop = 2
	pop_max = 4

//////////////////////////////////////////////////////
// Items
//////////////////////////////////////////////////////

/obj/item/clothing/suit/unathi/mantle/warm
	name = "warm hides"
	desc = "A rather grisly selection of cured hides and skin, sewn together to form a ragged mantle, capable of keeping you warm."
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/unathi/robe/warm
	name = "warm robes"
	desc = "A warm robes made of animal skins and rough fabric."
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/greatcoat/warm
	name = "warm coat"
	desc = "A warm sheepskin coat.."
	icon_state = "leathercoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE