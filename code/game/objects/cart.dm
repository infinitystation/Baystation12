/obj/cart
	name = "Cargo cart."
	desc = "Simple cart for heavy things.\n<font size=1px>(Ctrl+Alt+LMB to change wheels state)</font>"
	icon = 'icons/obj/cart.dmi'
	icon_state = "cart"
	w_class = ITEM_SIZE_LARGE
	var/haswheels = FALSE
	var/cargoweight = 0
	var/atom/movable/load = null

/obj/cart/Move()
	. = ..()
	if(load && !istype(load, /datum/vehicle_dummy_load))
		load.set_glide_size(src.glide_size)
		load.forceMove(src.loc)
		var/todir = src.dir
		if(istype(load, /obj/structure/closet/crate))
			todir = turn(src.dir, 90)
		load.set_dir(todir)

	var/sound
	if(haswheels)
		sound = pick(list(
			'sound/effects/cart1.ogg',
			'sound/effects/cart2.ogg',
			'sound/effects/cart3.ogg'
		))
	else
		sound = pick(list(
			'sound/effects/metalscrape1.ogg',
			'sound/effects/metalscrape2.ogg',
			'sound/effects/metalscrape3.ogg'
		))

	playsound(src, sound, 50, 1, 10)


/obj/cart/MouseDrop_T(var/atom/movable/cargo, mob/user as mob)
	if(!CanPhysicallyInteract(user) || !user.Adjacent(cargo) || !istype(cargo) || (user == cargo))
		return

	if(haswheels)
		to_chat(user, SPAN_WARNING("You cant place somethink on cart before you has folded the wheels!"))
		return

	if(do_after(user, 5 SECONDS, src, DO_DEFAULT | DO_TARGET_UNIQUE_ACT | DO_PUBLIC_PROGRESS))
		if(!load(cargo))
			to_chat(user, "<span class='warning'>You were unable to load [cargo] on [src].</span>")
			return

/obj/cart/attack_hand(mob/user as mob)
	if(user.stat || user.restrained() || !Adjacent(user))
		return FALSE

	if(!load)
		return FALSE

	if(haswheels)
		to_chat(user, SPAN_WARNING("You take off cart somethink before you has folded the wheels!"))
		return

	if(do_after(user, 5 SECONDS, src, DO_DEFAULT | DO_TARGET_UNIQUE_ACT | DO_PUBLIC_PROGRESS))
		unload(user)

	return ..()

/obj/cart/verb/turn_wheels()
	set src in view(1)
	set name = "Release wheels"
	set category = "Object"
	usr.visible_message(SPAN_NOTICE("You have [haswheels ? "folded" : "released"] wheels."), SPAN_NOTICE("[usr] [haswheels ? "folded" : "released"] wheels on [src]"))
	haswheels = !haswheels

/obj/cart/CtrlAltClick(mob/user)
	. = ..()
	turn_wheels()

/obj/cart/proc/load(var/atom/movable/cargo)
	if(ismob(cargo))
		return FALSE
	if(!(istype(cargo,/obj/machinery) || istype(cargo,/obj/structure/closet) || istype(cargo,/obj/structure/largecrate) || istype(cargo,/obj/structure/ore_box)))
		return FALSE

	//if there are any items you don't want to be able to interact with, add them to this check
	// ~no more shielded, emitter armed death trains
	if(!isturf(cargo.loc)) //To prevent loading things from someone's inventory, which wouldn't get handled properly.
		return FALSE
	if(load || cargo.anchored)
		return FALSE

	if(istype(cargo, /obj/machinery))
		load_object(cargo)
	else
		// if a create/closet, close before loading
		var/obj/structure/closet/crate = cargo
		if(istype(crate) && crate.opened && !crate.close())
			return FALSE

		cargo.forceMove(loc)
		cargo.anchored = TRUE

		load = cargo

		cargo.plane = plane
		cargo.layer = VEHICLE_LOAD_LAYER		//so it sits above the vehicle

		if(!istype(cargo, /obj/structure/closet/crate))
			cargo.pixel_y += 6
			cargo.set_dir(dir)
		else
			cargo.set_dir(turn(dir, 90))

	if(load)
		var/obj/O = load
		cargoweight = between(0, O.w_class, ITEM_SIZE_GARGANTUAN)
		return TRUE
	return FALSE

/obj/cart/proc/load_object(var/atom/movable/cargo)
	var/datum/vehicle_dummy_load/dummy_load = new()
	load = dummy_load

	if(!load)
		return
	dummy_load.actual_load = cargo
	cargo.forceMove(src)

	cargo.pixel_y += 6
	cargo.plane = plane
	cargo.layer = VEHICLE_LOAD_LAYER

	overlays += cargo

	//we can set these back now since we have already cloned the icon into the overlay
	cargo.pixel_y = initial(cargo.pixel_y)
	cargo.reset_plane_and_layer()

/obj/cart/proc/unload(var/mob/user, var/direction)
	if(istype(load, /datum/vehicle_dummy_load))
		var/datum/vehicle_dummy_load/dummy_load = load
		load = dummy_load.actual_load
		dummy_load.actual_load = null
		qdel(dummy_load)
		overlays.Cut()

	if(!load)
		return

	var/turf/dest = null

	//find a turf to unload to
	if(direction)	//if direction specified, unload in that direction
		dest = get_step(src, direction)
	else if(user)	//if a user has unloaded the vehicle, unload at their feet
		dest = get_turf(user)

	if(!dest)
		dest = get_step_to(src, get_step(src, turn(dir, 90))) //try unloading to the side of the vehicle first if neither of the above are present

	//if these all result in the same turf as the vehicle or nullspace, pick a new turf with open space
	if(!dest || dest == get_turf(src))
		var/list/options = list()
		for(var/test_dir in GLOB.alldirs)
			var/possible_turf = get_step_to(src, get_step(src, test_dir))
			if(!possible_turf)
				continue
			options += possible_turf
		if(options.len)
			dest = pick(options)
		else
			dest = get_turf(src)	//otherwise just dump it on the same turf as the vehicle

	if(!isturf(dest))	//if there still is nowhere to unload, cancel out since the vehicle is probably in nullspace
		return FALSE

	load.forceMove(dest)
	load.set_dir(get_dir(loc, dest))
	load.anchored = FALSE		//we can only load non-anchored items, so it makes sense to set this to false
	load.pixel_y = initial(load.pixel_y)
	load.reset_plane_and_layer()

	cargoweight = 0
	load = null
	update_icon()

	return TRUE

/obj/cart/get_additional_speed_decrease()
	return haswheels ? 0.1 : between(0, cargoweight + w_class, ITEM_SIZE_GARGANTUAN) / 5
