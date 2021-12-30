/mob/living/simple_animal/hostile/statue
	name = "Statue"
	desc = "A statue, constructed from concrete and rebar with traces of Krylon brand spray paint."
	icon = 'infinity/icons/mob/statue.dmi'
	icon_state = "statue"
	universal_understand = 1
	mob_size = 100
	can_bleed = FALSE
	see_in_dark = 8
	var/last_charge = 0
	var/next_shit = 0
	var/obj/machinery/atmospherics/unary/vent_pump/entry_vent
	var/snap_sound = list('infinity/sound/misc/statue/firstpersonsnap.ogg','infinity/sound/misc/statue/firstpersonsnap2.ogg','infinity/sound/misc/statue/firstpersonsnap3.ogg')
	var/scare_sound = list('infinity/sound/misc/statue/scare1.ogg','infinity/sound/misc/statue/scare2.ogg','infinity/sound/misc/statue/scare3.ogg','infinity/sound/misc/statue/scare4.ogg')

/mob/living/simple_animal/hostile/statue/proc/IsBeingWatched()
	// Am I being watched?
	for(var/mob/living/carbon/human/H in view(src, 7))
		if(is_blind(H) || H.eye_blind > 0)
			continue
		if(H.stat != CONSCIOUS)
			continue
		if(H.species.name == SPECIES_NABBER) // 360 viewing angle yo
			continue
		if(InSight(H))
			return TRUE
	for(var/mob/living/silicon/robot/R in view(src, 7))
		var/datum/robot_component/camera/C = R.components["camera"]
		if(!C || !C.toggled || !C.powered || !C.installed)
			continue
		if(InSight(R))
			return TRUE
	return FALSE

/mob/living/simple_animal/hostile/statue/handle_atmos()
	return

/mob/living/simple_animal/hostile/statue/Move()
	return

/mob/living/simple_animal/hostile/statue/Life()
	if (isobj(loc))
		return

	if(IsBeingWatched())
		return

	if(world.time >= next_shit)
		next_shit = world.time+rand(5 MINUTES, 10 MINUTES)
		var/obj/effect/feces = pick(/obj/effect/gibspawner/generic, /obj/effect/gibspawner/human)
		new feces(loc)
		last_charge = world.time
		return

	if(world.time >= last_charge+50)
		var/list/our_view = view(src, 7)
		var/mob/living/carbon/human/target
		var/list/mob/living/carbon/human/possible_targets = list()
		for(var/mob/living/carbon/human/H in our_view)
			if(H.stat == DEAD)
				continue
			if(!AStar(loc, H.loc, /turf/proc/AdjacentTurfs, /turf/proc/Distance, max_nodes=25, max_node_depth=7))
				continue // We can't reach this person anyways
			possible_targets += H
		if(possible_targets.len)
			target = pick(possible_targets)

		if (target)	// NECK SNAP TIME
			var/turf/spot
			var/turf/behind_target = get_step(target.loc, turn(target.dir, 180))
			if(isfloor(behind_target) && get_dist(behind_target, loc) <= 7 && not_turf_contains_dense_objects(behind_target))
				spot = behind_target
			else
				var/list/directions = shuffle(GLOB.cardinal.Copy())
				for(var/D in directions)
					var/turf/T = get_step(target, D)
					if(turf_contains_dense_objects(T))
						continue
					if(isfloor(T) && get_dist(T, loc) <= 7)
						spot = T
						break
			if(!spot)
				return
			forceMove(spot)
			dir = get_dir(src, target)
			if(!IsBeingWatched())
				visible_message("<span class='danger'>[src] snaps [target]'s neck!</span>")
				playsound(get_turf(src), pick(snap_sound), 50, 1)
				target.apply_damage(75, BRUTE, BP_HEAD)
				target.death()
				if(prob(25))
					playsound(get_turf(src), pick(scare_sound), 25, 1)
			else
				playsound(get_turf(src), pick(scare_sound), 25, 1)
			last_charge = world.time
			return

		if(!target && prob(33)) // crush time
			var/obj/object = find_and_destroy_object()
			if(object)
				visible_message("<span class='danger'>[src] breaks \the [object]!</span>")
				dir = get_dir(src, object)
				last_charge = world.time
				return

		if(!target && prob(10)) // sneaky-peaky, let's travel into vents
			for(entry_vent in view(1, src))
				if(entry_vent.welded)
					continue
				last_charge = world.time + 50
				dir = get_dir(src, entry_vent)
				visible_message("<span class='danger'>\The [src] starts trying to slide itself into the vent!</span>")
				sleep(50) //Let's stop SCP-173 for five seconds to do his parking job
				if(entry_vent.network && entry_vent.network.normal_members.len)
					var/list/vents = list()
					for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in entry_vent.network.normal_members)
						vents.Add(temp_vent)
					if(!vents.len)
						entry_vent = null
						return
					if(IsBeingWatched()) //Someone started looking at us
						return
					var/obj/machinery/atmospherics/unary/vent_pump/exit_vent = pick(vents)
					visible_message("<span class='danger'>\The [src] suddenly disappears into the vent!</span>")
					forceMove(entry_vent)
					sleep(rand(10,100))
					if(!exit_vent || exit_vent.welded)
						forceMove(get_turf(entry_vent))
						entry_vent = null
						dir = pick(GLOB.cardinal)
						try_to_scare(100, 0)
						visible_message("<span class='danger'>\The [src] suddenly appears from the vent!</span>")
						last_charge = world.time + 50
						return

					forceMove(get_turf(exit_vent))
					entry_vent = null
					dir = pick(GLOB.cardinal)
					try_to_scare(100, 0)
					visible_message("<span class='danger'>\The [src] suddenly appears from the vent!</span>")
					last_charge = world.time + 50
					return
				else
					entry_vent = null

		if(!target)
			var/list/turfs = list()
			for(var/turf/T in our_view)		//finding a nice position to jump.
				if(is_space_turf(T))	// we don't want to jump into space, m'kay?
					continue
				if(turf_contains_dense_objects(T))		//we don't want to jump into dense objects like lockers
					continue
				if(!AStar(loc, T, /turf/proc/AdjacentTurfs, /turf/proc/Distance, max_nodes=25, max_node_depth=7))	//the proc uses for checking the way from our loc to potential new loc, so if we can't jump - it doesn't happen
					continue
				turfs += T
			if(!turfs.len || IsBeingWatched()) // no turfs to jump :(
				return
			var/turf/chosen_turf = pick(turfs)
			dir = get_dir(src, chosen_turf)
			forceMove(chosen_turf)
			last_charge = world.time
			for(var/obj/machinery/door/airlock/AL in view(src,1))
				if(AL && AL.density && prob(50))	// little chance to bump into the door near us.
					dir = get_dir(src, AL)
					AL.bumpopen(src)
					break
			try_to_scare(25)

/mob/living/simple_animal/hostile/statue/proc/find_and_destroy_object()
	var/list/close_view = shuffle(view(src, 1))
	for(var/obj/structure/window/W in close_view)
		var/safe = 1
		for(var/dir in GLOB.cardinal)
			var/turf/T = get_turf(get_step(W.loc, dir))
			if(IsTurfAtmosUnsafe(T))
				safe = 0
				break
		if(safe && W.init_material != /obj/item/stack/material/glass/phoronrglass)
			W.shatter(0)
			return W
	for(var/obj/structure/grille/G in close_view)
		var/safe = 1
		for(var/dir in GLOB.cardinal)
			var/turf/T = get_turf(get_step(G.loc, dir))
			if(IsTurfAtmosUnsafe(T))
				safe = 0
				break
		if(safe)
			new /obj/item/stack/material/rods(G.loc)
			G.Destroy()
			return G
	for(var/obj/structure/wall_frame/WF in close_view)
		var/safe = 1
		for(var/dir in GLOB.cardinal)
			var/turf/T = get_turf(get_step(WF.loc, dir))
			if(IsTurfAtmosUnsafe(T))
				safe = 0
				break
		if(safe)
			WF.dismantle()
			return WF
	for(var/obj/machinery/light/L in close_view)
		if(L && L.on)
			L.broken()
			return L
	for(var/obj/machinery/door/window/WD in close_view)
		WD.shatter(0)
		return WD
	for(var/obj/structure/closet/CL in close_view)
		CL.ex_act(1)
		return CL
	for(var/obj/structure/table/T in close_view)
		T.Destroy()
		return T

/mob/living/simple_animal/hostile/statue/proc/try_to_scare(var/chance = 25, var/should_see = 1)
	var/scared
	for(var/mob/living/carbon/human/spooked in view(src, 7))
		if(spooked.stat != CONSCIOUS)
			continue
		if(!InSight(spooked) && should_see)
			continue
		if(!prob(chance))
			continue
		shake_camera(spooked, rand(5,20))
		scared = 1
	if(scared)
		playsound(get_turf(src), pick(scare_sound), 50, 1)

/mob/living/simple_animal/hostile/statue/ex_act()
	return

/atom/proc/InSight(atom/center)
	if(!get_dist(center, src))
		return FALSE

	var/x_diff = center.x - src.x
	var/y_diff = center.y - src.y

	if(y_diff != 0) //If we are not on the same vertical plane (up/down), mob is either above or below src
		if(y_diff < 0 && center.dir == NORTH) //Mob is below src and looking up
			return 1
		else if(y_diff > 0 && center.dir == SOUTH) //Mob is above src and looking down
			return 1
	if(x_diff != 0) //If we are not on the same horizontal plane (left/right), mob is either left or right of src
		if(x_diff < 0 && center.dir == EAST) //Mob is left of src and looking right
			return 1
		else if(x_diff > 0 && center.dir == WEST) //Mob is right of src and looking left
			return 1

	return 0

/mob/dead/InSight(mob/center)
	return FALSE

/mob/living/InSight(mob/center)
	. = ..()

	for (var/grab in grabbed_by)
		var/obj/item/grab/G = grab
		if (G.assailant == center)
			return FALSE
	return .

// CAGE //

/obj/structure/statue_cage
	icon = 'infinity/icons/obj/statue_cage.dmi'
	icon_state = "2"
	layer = MOB_LAYER + 0.05
	plane = MOB_PLANE
	name = "cage"
	desc = "An elongated cage with an unusual lever below."
	density = TRUE
	var/contained

/obj/structure/statue_cage/MouseDrop_T(atom/movable/dropping, mob/user)
	if (istype(dropping, /mob/living/simple_animal/hostile/statue))
		visible_message(SPAN_WARNING("[user] starts to put [dropping] into the cage."))
		var/oloc = loc
		if (do_after(user, 5 SECONDS, dropping) && loc == oloc) // shitty but there's no good alternative
			dropping.forceMove(src)
			underlays = list(dropping)
			visible_message(SPAN_NOTICE("[user] puts [dropping] in the cage."))
			contained = dropping
			update_icon()
	else if (isliving(dropping))
		to_chat(user, SPAN_WARNING("\The [dropping] won't fit in the cage."))

/obj/structure/statue_cage/attack_hand(mob/living/carbon/human/H)
	if(contained)
		var/mob/living/simple_animal/hostile/statue/S = contained
		visible_message(SPAN_WARNING("[H] releases [S] from the cage."))
		S.forceMove(get_turf(get_step(src.loc, dir)))
		for(var/dir in shuffle(GLOB.cardinal))
			var/turf/T = get_turf(get_step(loc, dir))
			if(turf_contains_dense_objects(T))
				continue
			S.forceMove(get_turf(get_step(src.loc, dir)))
			break

		contained = null
		underlays.Cut()
		update_icon()
	else
		visible_message(SPAN_NOTICE("The cage is empty; there's nothing to take out."))

/obj/structure/statue_cage/examine(mob/user)
	. = ..()
	if(contained)
		to_chat(user, SPAN_NOTICE("A strange statue is contained there."))
	else
		to_chat(user, SPAN_NOTICE("It's empty."))

/obj/structure/statue_cage/on_update_icon()
	icon_state = contained ? "1" : "2"
