/obj/item/toy/ringbell/tajalarm
	name = "Alarm terminal"
	desc = "Very suspicious red button. I really want to click on it."
	icon = 'infinity/icons/obj/toy.dmi'
	icon_state= "terminal"
	anchored = 1

/obj/item/toy/ringbell/tajalarm/attack_hand(mob/user as mob)
	if (user.a_intent == I_GRAB)
		user.visible_message("<span class='notice'>[user] press \the [src] orange button, signalling general gathering.</span>")
		playsound(user.loc, 'infinity/sound/items/sbortj.ogg', 40, extrarange=100)
	else if (user.a_intent == I_HURT)
		user.visible_message("<span class='warning'>[user] hit \the [src] red button, signalling an ALARM!!!</span>")
		playsound(user.loc, 'infinity/sound/items/tajalarm.ogg', 40, extrarange=100)

/obj/item/weapon/grenade/chem_grenade/korsar
	name = "korsar-13"
	desc = "Korsar-13 petard. Made in GCC, could be the cause of fright, minor injury, getting into a prison cell. Keep away from resomi and childrens."
	icon_state = "lightgrenade"

	New()
		..()
		var/obj/item/weapon/reagent_containers/glass/beaker/B1 = new(src)
		var/obj/item/weapon/reagent_containers/glass/beaker/B2 = new(src)

		B1.reagents.add_reagent(/datum/reagent/potassium, 30)
		B2.reagents.add_reagent(/datum/reagent/water, 20)
		B2.reagents.add_reagent(/datum/reagent/sulfur, 10)
		B2.reagents.add_reagent(/datum/reagent/aluminium, 10)

		detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

		beakers += B1
		beakers += B2
	icon_state = "lightgrenade"

/obj/item/weapon/storage/box/korsar
	name = "petard box"
	desc = "Eight wrappers of fun! Ages 21 and up. Not suitable for children and resomi. Made in GCC."
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"
	can_hold = list(/obj/item/weapon/grenade/chem_grenade/korsar)
	startswith = list(/obj/item/weapon/grenade/chem_grenade/korsar = 5)
