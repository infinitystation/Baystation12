/obj/item/mine/chem_mine
	name = "mine casing"
	icon = 'infinity/icons/obj/mine.dmi'
	icon_state = "mine"
	desc = "A hand made chemical mine."
	w_class = ITEM_SIZE_SMALL
	force = 2
	unacidable = TRUE
	var/stage = 0
	var/state = 0
	var/path = 0
	var/obj/item/device/assembly/igniter/detonator = null
	var/list/beakers = new/list()
	var/list/allowed_containers = list(/obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/glass/bottle)
	var/affected_area = 3

/obj/item/mine/chem_mine/Initialize()
	..()
	create_reagents(1000)

/obj/item/mine/chem_mine/attack_self(mob/user)
	if(!stage || stage==1)
		if(detonator)
			usr.put_in_hands(detonator)
			detonator=null
			stage=0
			icon_state = initial(icon_state)
		else if(beakers.len)
			for(var/obj/B in beakers)
				if(istype(B))
					beakers -= B
					user.put_in_hands(B)
		SetName("unsecured mine with [beakers.len] containers")
	if (stage > 1)
		add_fingerprint(user)
		to_chat(user, "Planting mine...")

		if(do_after(user, 40))
			activate()
			src.anchored = TRUE
			icon_state = initial(icon_state) +"_act"
			if(!user.unequip_item())
				return
			user.drop_from_inventory(src)
			user.visible_message("<span class='danger'>[user.name] finished planting mine. </span>")
			log_game("[key_name(user)] planted [src.name]")

/obj/item/mine/chem_mine/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/device/assembly/igniter) && (!stage || stage==1) && path != 2)
		var/obj/item/device/assembly/igniter/det = W
		if(!det.secured)
			to_chat(user, "<span class='warning'>Igniter must be secured with screwdriver.</span>")
			return
		if(!user.unEquip(det, src))
			return
		path = 1
		log_and_message_admins("has attached \a [W] to \the [src].")
		to_chat(user, "<span class='notice'>You add [W] to the metal casing.</span>")
		playsound(src.loc, 'sound/items/Screwdriver2.ogg', 25, -3)
		stage = 1
		detonator = det
	else if(isScrewdriver(W) && path != 2)
		if(stage == 1)
			path = 1
			if(beakers.len)
				to_chat(user, "<span class='notice'>You lock the assembly.</span>")
				SetName("mine")
			else
				to_chat(user, "<span class='notice'>You lock the empty assembly.</span>")
				SetName("mine")
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 25, -3)
			icon_state = initial(icon_state) +"_not_act"
			stage = 2
		else if(stage == 2)
			if(active && user.skill_fail_prob(SKILL_DEVICES, 100, SKILL_MAX+1, 0.2))
				to_chat(user, "<span class='warning'>You trigger the assembly!</span>")
				detonate()
				return
			else
				to_chat(user, "<span class='notice'>You unlock the assembly.</span>")
				playsound(src.loc, 'sound/items/Screwdriver.ogg', 25, -3)
				SetName("unsecured mine with [beakers.len] containers")
				icon_state = initial(icon_state) +"_not_act"
				stage = 1
				active = 0
				src.anchored = FALSE
				src.alpha = 255
	else if(is_type_in_list(W, allowed_containers) && (!stage || stage==1) && path != 2)
		path = 1
		if(beakers.len == 2)
			to_chat(user, "<span class='warning'>The mine can not hold more containers.</span>")
			return
		else
			if(W.reagents.total_volume)
				if(!user.unEquip(W, src))
					return
				to_chat(user, "<span class='notice'>You add \the [W] to the assembly.</span>")
				beakers += W
				stage = 1
				SetName("unsecured mine with [beakers.len] containers[detonator?" and detonator":""]")
			else
				to_chat(user, "<span class='warning'>\The [W] is empty.</span>")
	else if(istype(W, /obj/item/device/paint_sprayer))
		if(src.anchored)
			playsound(get_turf(src), 'sound/effects/spray3.ogg', 30, 1, -6)
			src.alpha = 50


/obj/item/mine/chem_mine/activate(mob/user as mob)
	if(active) return

	if(detonator)
		active = 1
	if(active)
		if(user)
			log_and_message_admins("has primed \a [src].")

	return

/obj/item/mine/chem_mine/detonate()
	if(!stage || stage<2) return

	var/has_reagents = 0
	for(var/obj/item/reagent_containers/glass/G in beakers)
		if(G.reagents.total_volume) has_reagents = 1

	active = 0
	if(!has_reagents)
		return

	playsound(src.loc, 'sound/effects/bamf.ogg', 50, 1)

	for(var/obj/item/reagent_containers/glass/G in beakers)
		G.reagents.trans_to_obj(src, G.reagents.total_volume)

	if(src.reagents.total_volume)
		var/datum/effect/effect/system/steam_spread/steam = new /datum/effect/effect/system/steam_spread()
		steam.set_up(10, 0, get_turf(src))
		steam.attach(src)
		steam.start()

		for(var/atom/A in view(affected_area, src.loc))
			if( A == src ) continue
			src.reagents.touch(A)

	set_invisibility(INVISIBILITY_MAXIMUM)
	detonator.activate()
	addtimer(CALLBACK(GLOBAL_PROC, /.proc/qdel, src), 1 SECONDS)


/obj/item/mine/chem_mine/examine(mob/user)
	. = ..()
	if(detonator)
		to_chat(user, "With attached [detonator.name]")
