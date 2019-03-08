/obj/item/weapon/melee/energy/toothpick
	name = "myknife"
	desc = "You can watch a knife of a very interesting design. It is conveniently located for the human hand. It has a slight vibration when activated. Its blade glows orange. It looks very hot. On the handle, in small print, it is written - my knife."
	
	hitsound = 'sound/weapons/blade1.ogg'

	icon = 'icons/obj/infinity_items/toothpick.dmi'
	icon_state = "toothpick"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi'
	)
	armor_penetration = 5
	active_force = 10
	force = 0
	throwforce = 0
	active_throwforce = 0
	throw_speed = 1
	throw_range = 10
	w_class = ITEM_SIZE_SMALL
	base_parry_chance = 0
	var/tick_cost = 1
	var/obj/item/weapon/cell/bcell = /obj/item/weapon/cell/device/high

/obj/item/weapon/melee/energy/toothpick/New()
	if(ispath(bcell))
		bcell = new bcell(src)
	..()

/obj/item/weapon/melee/energy/toothpick/Destroy()
	if (active)
		STOP_PROCESSING(SSobj, src)
	if(bcell)
		qdel(bcell)
		bcell = null
	..()

/obj/item/weapon/melee/energy/toothpick/Process()
	if (!active)
		return
	if(bcell)
		if(!bcell.checked_use(tick_cost))
			deactivate()
	else
		deactivate()
	return 1

/obj/item/weapon/melee/energy/toothpick/activate(mob/living/user)
	if(active)
		return
	if (!bcell.checked_use(tick_cost))
		return
	active = 1
	force = active_force
	throwforce = active_throwforce
	sharp = 1
	edge = 1
	slot_flags |= SLOT_DENYPOCKET
	playsound(user, 'sound/weapons/saberon.ogg', 50, 1)
	icon_state = "toothpick_on"
	START_PROCESSING(SSobj, src)

/obj/item/weapon/melee/energy/toothpick/deactivate(mob/living/user)
	if(!active)
		return
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)
	active = 0
	force = initial(force)
	throwforce = initial(throwforce)
	sharp = initial(sharp)
	edge = initial(edge)
	slot_flags = initial(slot_flags)
	icon_state = "toothpick"
	STOP_PROCESSING(SSobj, src)

/obj/item/weapon/melee/energy/toothpick/attack_self(mob/living/user as mob)
	if (active)
		deactivate(user)
	else
		activate(user)

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	add_fingerprint(user)

/obj/item/weapon/melee/energy/toothpick/examine(mob/user)
	if(!..(user, 1))
		return 0
	if (bcell)
		to_chat(user, "<span class='notice'>The cell is [round(bcell.percent())]% charged.</span>")
	return 1

/obj/item/weapon/melee/energy/toothpick/get_cell()
	return bcell