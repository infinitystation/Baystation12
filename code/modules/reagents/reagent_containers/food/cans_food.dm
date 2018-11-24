#define HARD 1
#define EASY 0

/obj/item/weapon/reagent_containers/food/snacks/can
	name = "canned stew"
	desc = "With You Since 20 century! This can has mix of meat, rice and some spice."
	icon = 'icons/obj/infinity_food.dmi'
	icon_state = "can1"
	obj_flags = 0
	trash = /obj/item/trash/canfood
	nutriment_desc = list("rice" = 4, "meat" = 3)
	nutriment_amt = 25
	var/diff = HARD
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/can/two
	name = "canned stew"
	desc = "With You Since 20 century! This can has mix of meat and meat broth."
	icon_state = "can2"
	nutriment_desc = list("meat" = 7)
	nutriment_amt = 25


/obj/item/weapon/reagent_containers/food/snacks/can/three
	name = "canned jelly"
	desc = "With You Since 20 century! This can has jelly."
	icon_state = "can3"
	nutriment_amt = 10
	New()
		..()
		reagents.add_reagent(/datum/reagent/nutriment/cherryjelly, 8)

/obj/item/weapon/reagent_containers/food/snacks/can/four
	name = "canned strange stew"
	desc = "With You Since 20 century! This can has... Something strange - you can't recognize, but it has meat..."
	icon_state = "can4"
	nutriment_desc = list("meat" = 5)
	nutriment_amt = 22

/obj/item/weapon/reagent_containers/food/snacks/can/five
	name = "canned vegetables"
	desc = "With You Since 20 century! This can has mix of vegetables, vines, water... You really want it?"
	icon_state = "can5"
	nutriment_desc = list("rice" = 4)
	nutriment_amt = 16
	New()
		..()
		reagents.add_reagent(/datum/reagent/water, 3)
		reagents.add_reagent(/datum/reagent/tricordrazine, 1)
		reagents.add_reagent(/datum/reagent/nutriment/soysauce, 1)
		reagents.add_reagent(/datum/reagent/drink/juice/carrot, 1)
		reagents.add_reagent(/datum/reagent/drink/juice/orange, 1)

/obj/item/trash/canfood
	name = "empty can"
	desc = "With You Since 20 century! This can has mix of air, bacteries and food parts."
	icon = 'icons/obj/infinity_food.dmi'
	icon_state = "can1_empty"

/obj/item/trash/canfood/Initialize()
	. = ..()
	icon_state = "can[(rand(1,5))]_empty"

/obj/item/weapon/material/canknife
	name = "can-opener"
	desc = "Simple can-opener"
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "opener"

/obj/item/weapon/reagent_containers/food/snacks/can/attack_self(mob/user as mob)
	if(!is_open_container() && !diff)
		open(user)

/obj/item/weapon/reagent_containers/food/snacks/can/on_update_icon()
	if(!reagents.total_volume)
		icon_state = "[initial(icon_state)]_empty"
		return

/obj/item/weapon/reagent_containers/food/snacks/can/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/material/knife))
		to_chat(user, "<span class='notice'>You're starting open the [src]!</span>")
		user.visible_message("<span class='warning'>\The [user] is trying to open /the [src] with [W]!/</span>")
		if(do_after(user, 150, src))
			open(user)
			return
	else if(istype(W,/obj/item/weapon/material/canknife) || istype(W, /obj/item/weapon/material/kitchen/utensil/knife))
		to_chat(user, "<span class='notice'>You're starting open the [src]!</span>")
		user.visible_message("<span class='warning'>The [user] is trying to open the [src] with [W]!</span>")
		if(do_after(user, 50, src))
			open(user)
			return
	else if(istype(W,/obj/item/weapon/material/kitchen/utensil))
		if(src.obj_flags |= ATOM_FLAG_OPEN_CONTAINER)
			..()
		else
			to_chat(user, "<span class='warning'>You need can-opener to open this!</span>")
	return

/obj/item/weapon/reagent_containers/food/snacks/can/proc/open(mob/user)
	playsound(loc,'sound/effects/canopen.ogg', rand(10,50), 1)
	to_chat(user, "<span class='notice'>You open the [src]!</span>")
	obj_flags |= ATOM_FLAG_OPEN_CONTAINER
	icon_state = "[initial(icon_state)]_opened"

/obj/item/weapon/reagent_containers/food/snacks/can/attack(mob/M as mob, mob/user as mob, def_zone)
	if(force && !(obj_flags & ITEM_FLAG_NO_BLUDGEON) && user.a_intent == I_HURT)
		return ..()
	if(standard_feed_mob(user, M))
		update_icon(src)
		return
	return 0

/obj/item/weapon/reagent_containers/food/snacks/can/standard_feed_mob(var/mob/user, var/mob/target)
	if(!is_open_container())
		to_chat(user, "<span class='notice'>You need to open the [src]!</span>")
		return 1
	return ..()

#undef HARD
#undef EASY