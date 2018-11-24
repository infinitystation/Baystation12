/obj/item/weapon/towel
	name = "towel"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "towel"
	item_flags = ITEM_FLAG_IS_BELT
	slot_flags = SLOT_HEAD | SLOT_BELT | SLOT_OCLOTHING
	force = 1 //Don't break bones with it, please
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	desc = "A soft cotton towel."
	sprite_sheets = list(
		SPECIES_RESOMI = 'icons/mob/onmob/Resomi/head.dmi'
		)

/obj/item/weapon/towel/attack_self(mob/living/user as mob)
	user.visible_message(text("<span class='notice'>[] uses [] to towel themselves off.</span>", user, src))
	playsound(user, 'sound/weapons/towelwipe.ogg', 25, 1)

/obj/item/weapon/towel/random/New()
	..()
	color = get_random_colour()

/obj/item/weapon/towel/fleece // loot from the king of goats. it's a golden towel
	name = "golden fleece"
	desc = "The legendary Golden Fleece of Jason made real."
	color = "#ffd700"
	force = 1
	attack_verb = list("smote")

/obj/item/rolled_towel
	name = "rolled big towel"
	desc = "A collapsed big towel - looks like you can't use it as a normal one... Try it on a beach."
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "rolled_towel"
	w_class = 2
	var/beach_towel = /obj/structure/towel

/obj/item/rolled_towel/attack_self(mob/living/user as mob)
	var/obj/item/rolled_towel/R = new beach_towel(user.loc)
	R.add_fingerprint(user)
	qdel(src)

/obj/structure/towel
	name = "big towel"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "beach_towel"
	anchored = 0
	var/rolled_towel = /obj/item/rolled_towel

/obj/structure/towel/attack_hand(mob/living/user as mob)
	..()
	if(!ishuman(user))
		return 0
	visible_message("<span class='notice'>[usr] rolled up [src].</span>")
	var/obj/item/rolled_towel/B = new rolled_towel(get_turf(src))
	usr.put_in_hands(B)
	qdel(src)

/obj/item/rolled_towel/black
	name = "black rolled towel"
	icon_state = "black_rolled_towel"
	beach_towel = /obj/structure/towel/black

/obj/structure/towel/black
	name = "black big towel"
	icon_state = "black_beach_towel"
	rolled_towel = /obj/item/rolled_towel/black

/obj/item/rolled_towel/blue_stripped
	name = "blue rolled towel"
	icon_state = "bluestripp_towel"
	beach_towel = /obj/structure/towel/blue_stripped

/obj/structure/towel/blue_stripped
	name = "blue big towel"
	icon_state = "bluestripp_beach"
	rolled_towel = /obj/item/rolled_towel/blue_stripped

/obj/item/rolled_towel/red_stripped
	name = "red rolled towel"
	icon_state = "redstripp_towel"
	beach_towel = /obj/structure/towel/red_stripped

/obj/structure/towel/red_stripped
	name = "red big towel"
	icon_state = "redstripp_beach"
	rolled_towel = /obj/item/rolled_towel/red_stripped

/obj/item/rolled_towel/green_stripped
	name = "green rolled towel"
	icon_state = "greenstripp_towel"
	beach_towel = /obj/structure/towel/green_stripped

/obj/structure/towel/green_stripped
	name = "green big towel"
	icon_state = "greenstripp_beach"
	rolled_towel = /obj/item/rolled_towel/green_stripped

/obj/item/rolled_towel/yellow_stripped
	name = "yellow rolled towel"
	icon_state = "yellowstripp_towel"
	beach_towel = /obj/structure/towel/yellow_stripped

/obj/structure/towel/yellow_stripped
	name = "green big towel"
	icon_state = "yellowstripp_beach"
	rolled_towel = /obj/item/rolled_towel/yellow_stripped

/obj/item/rolled_towel/pink_stripped
	name = "pink rolled towel"
	icon_state = "pinkstripp_towel"
	beach_towel = /obj/structure/towel/pink_stripped

/obj/structure/towel/pink_stripped
	name = "green big towel"
	icon_state = "pinkstripp_beach"
	rolled_towel = /obj/item/rolled_towel/pink_stripped

/obj/item/rolled_towel/ilove
	name = "*i <3 you* rolled towel"
	icon_state = "rolled_towel"
	beach_towel = /obj/structure/towel/ilove

/obj/structure/towel/ilove
	name = "*i <3 you* big towel"
	icon_state = "ilove_beach"
	rolled_towel = /obj/item/rolled_towel/ilove

/obj/item/rolled_towel/fitness
	name = "rolled fitness mat"
	desc = "A fitness mat - place it in a gym for better training.."
	icon_state = "rolled_gym_beach"
	beach_towel = /obj/structure/towel/fitness

/obj/structure/towel/fitness
	name = "fitness mat"
	icon_state = "gym_beach"
	rolled_towel = /obj/item/rolled_towel/fitness

/obj/structure/towel/holo
	name = "big holographic towel"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "beach_towel"
	anchored = 1
	rolled_towel = null

/obj/structure/towel/holo/attack_hand(mob/living/user as mob)
	return

/obj/structure/towel/holo/ilove
	name = "*i <3 you* big towel"
	icon_state = "ilove_beach"

/obj/structure/towel/holo/blue_stripped
	name = "blue big towel"
	icon_state = "bluestripp_beach"
