#define HARD 1
#define EASY 0

/obj/item/weapon/reagent_containers/food/snacks/canfood
	name = "Master Can"
	desc = "Master Can"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "green_lump"
	var/diff = HARD
	flags = 0
	bitecount = 0
	nutriment_amt = 30
	trash = /obj/item/trash/canfood/empty
	nutriment_desc = list("rice" = 20, "meat" = 10)
	var/open_state = "crystal"

/obj/item/weapon/reagent_containers/food/snacks/canfood/New()
	..()
	bitesize = 3

/obj/item/trash/canfood/empty
	name = "Master Can"
	desc = "Master Can"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "crystal2"

/obj/item/weapon/material/canknife
	name = "can-opener"
	desc = "Simple can-opener"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "opener"

/obj/item/weapon/reagent_containers/food/snacks/canfood/attack_self(mob/user as mob)
	if(!is_open_container() && !diff)
		open(user)

/obj/item/weapon/reagent_containers/food/snacks/canfood/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/material/knife))
		if(do_after(user, 150, src))
			open(user)
			return
	else if(istype(W,/obj/item/weapon/material/canknife) || istype(W, /obj/item/weapon/material/kitchen/utensil/knife))
		if(do_after(user, 50, src))
			open(user)
			return
	else
		to_chat(user, "<span class='warning'>You need can-opener to open this!</span>")
	return

/obj/item/weapon/reagent_containers/food/snacks/canfood/proc/open(mob/user)
	playsound(loc,'sound/effects/canopen.ogg', rand(10,50), 1)
	to_chat(user, "<span class='notice'>You open \the [src]!</span>")
	flags |= OPENCONTAINER
	icon_state = open_state

/obj/item/weapon/reagent_containers/food/snacks/canfood/attack(mob/M as mob, mob/user as mob, def_zone)
	if(force && !(flags & NOBLUDGEON) && user.a_intent == I_HURT)
		return ..()
	if(standard_feed_mob(user, M))
		return
	return 0

/obj/item/weapon/reagent_containers/food/snacks/canfood/standard_feed_mob(var/mob/user, var/mob/target)
	if(!is_open_container())
		to_chat(user, "<span class='notice'>You need to open \the [src]!</span>")
		return 1
	return ..()

#undef HARD
#undef EASY