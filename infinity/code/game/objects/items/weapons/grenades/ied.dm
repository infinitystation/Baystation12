/obj/item/weapon/grenade/frag/ied
	name = "pipe bomb"
	desc = "An improvised explosive device, probably. It looks like in movies about Gilgamesh terrorists."
	icon = 'infinity/icons/obj/grenades.dmi'
	icon_state = "sied4"
	var/datum/wires/explosive/frag/wires = null
	var/open_panel = 0

	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment=1, /obj/item/projectile/bullet/pellet/fragment/strong=4)
	num_fragments = 70
	explosion_size = 1

/obj/item/weapon/grenade/frag/ied/New()
	wires = new(src)
	..()

/obj/item/weapon/grenade/frag/ied/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/item/weapon/grenade/frag/ied/attackby(var/obj/item/I, var/mob/user)
	if(isWrench(I))
		open_panel = !open_panel
		to_chat(user, "<span class='notice'>You [open_panel ? "open" : "close"] the wire panel.</span>")
	else if(isWirecutter(I) || isMultitool(I) || istype(I, /obj/item/device/assembly/signaler ))
		wires.Interact(user)
	else
		..()

/obj/item/weapon/reagent_containers/food/drinks/cans
	var/buildstate = 0

/obj/item/weapon/reagent_containers/food/drinks/cans/on_update_icon()
	overlays.Cut()
	. = ..()
	if(buildstate)
		overlays += image(icon = 'infinity/icons/obj/grenades.dmi', icon_state = "sied[buildstate]")

/obj/item/weapon/reagent_containers/food/drinks/cans/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	add_fingerprint(user)
	if(loc == user.loc)
		to_chat(user, SPAN_NOTICE("You cannot interact with [src] while it in your hands."))
		return
	if(reagents.has_reagent(/datum/reagent/fuel, 40))
		switch(buildstate)
			if(0)
				if(istype(W, /obj/item/stack/material) && W.get_material_name())
					var/obj/item/stack/material/M = W
					if(!(M.material.integrity >= 50 && M.material.hardness >= MATERIAL_FLEXIBLE + 10))
						to_chat(user, SPAN_NOTICE("It's soft as plasticine. Do you need a grenade or a candle?"))
						return
					if(M.use(5))
						to_chat(user, SPAN_NOTICE("You created and installed a shrapnel hull."))
						buildstate++
					else
						to_chat(user, SPAN_NOTICE("You need at least 5 metal sheets to complete this task."))
			if(1)
				if(isCoil(W))
					var/obj/item/stack/cable_coil/C = W
					if(C.use(5))
						to_chat(user, SPAN_NOTICE("You installed the wiring inside."))
						buildstate++
					else
						to_chat(user, SPAN_NOTICE("You need at least 5 segments of [W] to complete this task."))
			if(2)
				if(istype(W, /obj/item/device/assembly/igniter))
					to_chat(user, SPAN_NOTICE("You install [W]."))
					buildstate++
					qdel(W)
			if(3)
				if(istype(W, /obj/item/weapon/tape_roll))
					to_chat(user, SPAN_NOTICE("You secure everything with [W]."))
					new /obj/item/weapon/grenade/frag/ied(get_turf(src))
					qdel(src)
				return
		update_icon()
	..()

/obj/item/projectile/bullet/pellet/fragment/large
	damage = 25
	armor_penetration = 15

/obj/item/projectile/bullet/pellet/fragment/sharp
	armor_penetration = 45

/obj/item/weapon/grenade/frag/high_yield/belt
	name = "belt-bomb"
	desc = "Belt with explosive. Looks like a religious item."
	icon = 'infinity/icons/obj/grenades.dmi'
	item_icons = list(slot_belt_str = 'infinity/icons/obj/grenades.dmi')
	item_state_slots = list(slot_belt_str = "bombbeltmob")
	icon_state = "bombbelt"
	slot_flags = SLOT_BELT
	var/datum/wires/explosive/belt/wires = null
	var/open_panel = 0

	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment=2, /obj/item/projectile/bullet/pellet/fragment/strong=4, /obj/item/projectile/bullet/pellet/fragment/large = 1, /obj/item/projectile/bullet/pellet/fragment/sharp = 1)
	num_fragments = 300
	explosion_size = 6

/obj/item/weapon/grenade/frag/high_yield/belt/New()
	wires = new(src)
	..()

/obj/item/weapon/grenade/frag/high_yield/belt/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/item/weapon/grenade/frag/high_yield/belt/attackby(var/obj/item/I, var/mob/user)
	if(isWrench(I))
		open_panel = !open_panel
		to_chat(user, "<span class='notice'>You [open_panel ? "open" : "close"] the wire panel.</span>")
	else if(isWirecutter(I) || isMultitool(I) || istype(I, /obj/item/device/assembly/signaler ))
		wires.Interact(user)
	else
		..()

/obj/item/weapon/grenade/frag/high_yield/ied
	name = "double pipe bomb"
	desc = "An double improvised explosive device, probably. It looks like in movies about Gilgamesh terrorists."
	icon = 'infinity/icons/obj/grenades.dmi'
	icon_state = "lied4"
	var/datum/wires/explosive/lfrag/wires = null
	var/open_panel = 0

	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/sharp=1, /obj/item/projectile/bullet/pellet/fragment/large=4)
	num_fragments = 120

/obj/item/weapon/grenade/frag/high_yield/ied/New()
	wires = new(src)
	..()

/obj/item/weapon/grenade/frag/high_yield/ied/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/item/weapon/grenade/frag/high_yield/ied/attackby(var/obj/item/I, var/mob/user)
	if(isWrench(I))
		open_panel = !open_panel
		to_chat(user, "<span class='notice'>You [open_panel ? "open" : "close"] the wire panel.</span>")
	else if(isWirecutter(I) || isMultitool(I) || istype(I, /obj/item/device/assembly/signaler ))
		wires.Interact(user)
	else
		..()

/obj/item/weapon/grenade/frag/ied
	var/buildstate = 0

/obj/item/weapon/grenade/frag/ied/on_update_icon()
	overlays.Cut()
	. = ..()
	if(buildstate)
		overlays += image(icon = 'infinity/icons/obj/grenades.dmi', icon_state = "lied[buildstate]")

/obj/item/weapon/grenade/frag/ied/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	add_fingerprint(user)
	if(loc == user.loc)
		to_chat(user, SPAN_NOTICE("You cannot interact with [src] while it in your hands."))
		return
		switch(buildstate)
			if(0)
				if(isCoil(W))
					var/obj/item/stack/cable_coil/C = W
					if(C.use(5))
						to_chat(user, SPAN_NOTICE("You add additional cables."))
						buildstate++
					else
						to_chat(user, SPAN_NOTICE("You need at least 5 segments of [W] to complete this task."))
			if(1)
				if(istype(W, /obj/item/weapon/grenade/frag/ied))
					to_chat(user, SPAN_NOTICE("You attached the second bomb to the first."))
					buildstate++
					qdel(W)
			if(2)
				if(isCoil(W))
					var/obj/item/stack/cable_coil/C = W
					if(C.use(5))
						to_chat(user, SPAN_NOTICE("You synced both bombs with wires and linked them together."))
						buildstate++
					else
						to_chat(user, SPAN_NOTICE("You need at least 5 segments of [W] to complete this task."))
			if(3)
				if(istype(W, /obj/item/weapon/tape_roll))
					to_chat(user, SPAN_NOTICE("You secure everything with [W]."))
					new /obj/item/weapon/grenade/frag/high_yield/ied(get_turf(src))
					qdel(src)
				return
		update_icon()
	..()