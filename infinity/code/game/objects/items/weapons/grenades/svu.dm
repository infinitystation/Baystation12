/obj/item/weapon/grenade/frag/ied
	icon = 'infinity/icons/obj/grenades.dmi'
	name = "pipe bomb"
	desc = "An improvised explosive device, probably. It looks like in movies about Gilgamesh terrorists."
	icon_state = "sied4"

	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment=1,/obj/item/projectile/bullet/pellet/fragment/strong=3)
	num_fragments = 60
	explosion_size = 1

/obj/item/weapon/reagent_containers/food/drinks/cans
	var/buildstate = 0

/obj/item/weapon/reagent_containers/food/drinks/cans/on_update_icon()
	icon_state = "sied[buildstate]"

/obj/item/weapon/reagent_containers/food/drinks/cans/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	add_fingerprint(user)
	if(loc == user.loc)
		to_chat(user, SPAN_NOTICE("You cannot interact with [src] while it in your hands."))
		return
	if(reagents.has_reagent(/datum/reagent/fuel, 40))
		switch(buildstate)
			if(0)
				if(istype(W,/obj/item/stack/material) && W.get_material_name() == MATERIAL_STEEL)
					var/obj/item/stack/material/M = W
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
				if(istype(W,/obj/item/device/assembly/igniter))
					to_chat(user, SPAN_NOTICE("You install [W]."))
					buildstate++
					qdel(W)
			if(3)
				if(istype(W,/obj/item/weapon/tape_roll))
					to_chat(user, SPAN_NOTICE("You secure everything with [W]."))
					new /obj/item/weapon/grenade/frag/ied(get_turf(src))
					qdel(src)
				return
		update_icon()
		..()
